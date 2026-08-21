import 'dart:convert';
import 'dart:typed_data';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/data/adapters/local_media_adapter.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/models/media_attachment.dart';
import 'package:personalos/data/repositories/event_repository.dart';
import 'package:personalos/data/repositories/export_import_repository.dart';
import 'package:personalos/data/repositories/habit_repository.dart';
import 'package:personalos/data/repositories/journal_repository.dart';
import 'package:personalos/data/repositories/media_repository.dart';
import 'package:personalos/data/repositories/settings_repository.dart';

Future<void> seed(AppDatabase db) async {
  final events = EventRepository(db);
  final journal = JournalRepository(db, events);
  final habits = HabitRepository(db, events);
  final media = MediaRepository(db, events, LocalMediaAdapter(db));
  final settings = SettingsRepository(db);

  await settings.set('timezone', 'Asia/Kolkata');
  await journal.create(
    title: 'Day one',
    body: 'Imported history begins.',
    area: 'health',
    tags: const ['win'],
    at: DateTime(2026, 8, 1, 9),
  );
  final entry = await journal.create(
    body: 'With media attached',
    at: DateTime(2026, 8, 2, 20),
  );
  await media.save(
    MediaAttachment(
      id: newId('ma'),
      entryId: entry.id,
      fileName: 'vlog.webm',
      mimeType: 'video/webm',
      sizeBytes: 4096,
      durationSec: 90,
      capturedAt: DateTime(2026, 8, 2, 20, 1),
      syncState: 'local-only',
      storageRef: '',
      adopted: false,
    ),
    Uint8List.fromList(List.filled(4096, 5)),
  );
  final habit = await habits.create(name: 'Read', area: 'learning');
  await habits.checkIn(habit.id, at: DateTime(2026, 8, 2, 8));
}

Future<Map<String, List<Map<String, dynamic>>>> dump(AppDatabase db) async {
  const tables = [
    'settings',
    'areas',
    'journal_entries',
    'media_attachments',
    'habits',
    'habit_checkins',
    'events',
    'coach_outputs',
  ];
  final result = <String, List<Map<String, dynamic>>>{};
  for (final table in tables) {
    final rows = await db.customSelect(
      'SELECT * FROM $table ORDER BY rowid',
    ).get();
    result[table] = rows
        .map((r) => r.data.map((k, v) => MapEntry(k, _norm(v))))
        .toList();
  }
  return result;
}

Object? _norm(Object? v) {
  if (v is Uint8List) return base64Encode(v);
  if (v is DateTime) return v.toIso8601String();
  return v;
}

void main() {
  test('export → wipe → restore yields identical data', () async {
    final dbA = AppDatabase(NativeDatabase.memory());
    await seed(dbA);
    final repoA = ExportImportRepository(dbA);
    final bundle = await repoA.exportAll();

    expect(bundle.mediaFiles, hasLength(1));
    expect(bundle.json, contains('"format":"PersonalOS-backup"'));
    expect(bundle.json, contains('"formatVersion":2'));

    final dbB = AppDatabase(NativeDatabase.memory());
    final repoB = ExportImportRepository(dbB);
    final report = await repoB.restore(bundle);

    expect(report.missingFiles, isEmpty);
    expect(await dump(dbA), await dump(dbB));

    await dbA.close();
    await dbB.close();
  });

  test('restore reports missing media as a soft failure', () async {
    final dbA = AppDatabase(NativeDatabase.memory());
    await seed(dbA);
    final bundle = await ExportImportRepository(dbA).exportAll();

    final dbB = AppDatabase(NativeDatabase.memory());
    final report = await ExportImportRepository(dbB)
        .restore(bundle.copyWith(mediaFiles: const {}));

    expect(report.missingFiles, hasLength(1));
    final media = await dbB.select(dbB.mediaAttachments).get();
    expect(media.single.blobData, isNull);

    await dbA.close();
    await dbB.close();
  });

  test('restore refuses a newer schemaVersion', () async {
    final db = AppDatabase(NativeDatabase.memory());
    final repo = ExportImportRepository(db);
    final bundle = await repo.exportAll();
    final newer = jsonDecode(bundle.json) as Map<String, dynamic>;
    newer['schemaVersion'] = (newer['schemaVersion'] as int) + 1;
    final tampered = bundle.copyWith(
      json: jsonEncode(newer),
    );
    expect(
      () => repo.restore(tampered),
      throwsA(isA<StateError>()),
    );
    await db.close();
  });

  test('restore into a populated DB replaces everything', () async {
    final dbA = AppDatabase(NativeDatabase.memory());
    await seed(dbA);
    final bundle = await ExportImportRepository(dbA).exportAll();

    final dbB = AppDatabase(NativeDatabase.memory());
    await seed(dbB);
    expect(await dbB.select(dbB.habitCheckins).get(), isNotEmpty);

    final report = await ExportImportRepository(dbB).restore(bundle);
    expect(report.missingFiles, isEmpty);
    expect(await dump(dbA), await dump(dbB));

    await dbA.close();
    await dbB.close();
  });

  test('empty DB export → restore round-trips with zero rows', () async {
    final dbA = AppDatabase(NativeDatabase.memory());
    final bundle = await ExportImportRepository(dbA).exportAll();
    expect(bundle.mediaFiles, isEmpty);

    final dbB = AppDatabase(NativeDatabase.memory());
    final report = await ExportImportRepository(dbB).restore(bundle);
    expect(report.missingFiles, isEmpty);
    expect(await dump(dbA), await dump(dbB));

    await dbA.close();
    await dbB.close();
  });

  test('exported:false manifest entries restore as metadata-only', () async {
    final dbA = AppDatabase(NativeDatabase.memory());
    await seed(dbA);
    final bundle = await ExportImportRepository(dbA).exportAll();
    final parsed = jsonDecode(bundle.json) as Map<String, dynamic>;
    final files =
        ((parsed['media'] as Map<String, dynamic>)['files'] as List)
            .cast<Map<String, dynamic>>();
    for (final f in files) {
      f['exported'] = false;
    }
    final noBlobBundle = bundle.copyWith(
      json: jsonEncode(parsed),
      mediaFiles: const {},
    );

    final dbB = AppDatabase(NativeDatabase.memory());
    final report = await ExportImportRepository(dbB).restore(noBlobBundle);
    expect(report.missingFiles, isEmpty);
    final media = await dbB.select(dbB.mediaAttachments).get();
    expect(media, hasLength(1));
    expect(media.single.blobData, isNull);

    await dbA.close();
    await dbB.close();
  });

  test('restore rejects wrong format and wrong formatVersion', () async {
    final db = AppDatabase(NativeDatabase.memory());
    final repo = ExportImportRepository(db);

    await expectLater(
      repo.restore(
        ExportBundle(json: '{"format":"not-personalos","formatVersion":2}'),
      ),
      throwsA(isA<FormatException>()),
    );
    await expectLater(
      repo.restore(
        ExportBundle(
          json:
              '{"format":"PersonalOS-backup","formatVersion":99,"schemaVersion":1,"data":{},"media":{"files":[]}}',
        ),
      ),
      throwsA(isA<FormatException>()),
    );
    await db.close();
  });

  test('soft-deleted entries survive the round-trip as tombstones', () async {
    final dbA = AppDatabase(NativeDatabase.memory());
    await seed(dbA);
    final events = EventRepository(dbA);
    final journal = JournalRepository(dbA, events);
    final entry = (await journal.recent()).first;
    await journal.delete(entry.id);
    final bundle = await ExportImportRepository(dbA).exportAll();

    final dbB = AppDatabase(NativeDatabase.memory());
    await ExportImportRepository(dbB).restore(bundle);
    expect(await dump(dbA), await dump(dbB));
    final restored = await dbB.select(dbB.journalEntries).get();
    expect(restored.singleWhere((r) => r.id == entry.id).deletedAt, isNotNull);

    await dbA.close();
    await dbB.close();
  });
}