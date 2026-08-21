import 'dart:typed_data';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/data/adapters/local_media_adapter.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/models/media_attachment.dart';
import 'package:personalos/data/repositories/event_repository.dart';
import 'package:personalos/data/repositories/habit_repository.dart';
import 'package:personalos/data/repositories/journal_repository.dart';
import 'package:personalos/data/repositories/media_repository.dart';

void main() {
  test('concurrent double check-in produces exactly one row and one event',
      () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    final events = EventRepository(db);
    final habits = HabitRepository(db, events);
    final habit = await habits.create(name: 'Read');

    await Future.wait([
      habits.checkIn(habit.id, at: DateTime(2026, 8, 1, 8)),
      habits.checkIn(habit.id, at: DateTime(2026, 8, 1, 9)),
    ]);

    expect(await habits.checkInsForDay('2026-08-01'), hasLength(1));
    final completed =
        await events.query(type: 'habit.completed', entityId: habit.id);
    expect(completed, hasLength(1));
  });

  test('journal delete removes attached media rows + tombstones', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    final events = EventRepository(db);
    final journal = JournalRepository(db, events);
    final media = MediaRepository(db, events, LocalMediaAdapter(db));
    final entry = await journal.create(body: 'with a vlog');
    final mediaId = newId('ma');
    await media.save(
      MediaAttachment(
        id: mediaId,
        entryId: entry.id,
        fileName: 'v.webm',
        mimeType: 'video/webm',
        sizeBytes: 100,
        capturedAt: DateTime.now(),
        syncState: 'local-only',
        storageRef: '',
        adopted: false,
      ),
      Uint8List.fromList(List.filled(100, 1)),
    );

    await journal.delete(entry.id);

    expect(await media.forEntry(entry.id), isEmpty);
    expect(await db.select(db.mediaAttachments).get(), isEmpty);
    final tombstones =
        await events.query(type: 'vlog.deleted', entityId: mediaId);
    expect(tombstones, hasLength(1));
  });
}