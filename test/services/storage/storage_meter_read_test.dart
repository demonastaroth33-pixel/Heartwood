import 'dart:typed_data';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/data/adapters/local_media_adapter.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/models/media_attachment.dart';
import 'package:personalos/data/repositories/event_repository.dart';
import 'package:personalos/data/repositories/journal_repository.dart';
import 'package:personalos/data/repositories/media_repository.dart';
import 'package:personalos/services/storage/storage_meter.dart';

void main() {
  test('StorageMeter.read works on a fresh DB', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    final data = await StorageMeter(db).read();
    expect(data.dbMediaBytes, 0);
    expect(data.usedBytes, 0);
  });

  test('StorageMeter.read sums non-adopted media bytes', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    final events = EventRepository(db);
    final journal = JournalRepository(db, events);
    final media = MediaRepository(db, events, LocalMediaAdapter(db));
    final entry = await journal.create(body: 'x');
    await media.save(
      MediaAttachment(
        id: newId('ma'),
        entryId: entry.id,
        fileName: 'a.bin',
        mimeType: 'application/octet-stream',
        sizeBytes: 1000,
        capturedAt: DateTime.now(),
        syncState: 'local-only',
        storageRef: '',
        adopted: false,
      ),
      Uint8List.fromList(List.filled(1000, 1)),
    );
    final data = await StorageMeter(db).read();
    expect(data.dbMediaBytes, 1000);
  });
}