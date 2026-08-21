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

void main() {
  late AppDatabase db;
  late EventRepository eventRepo;
  late JournalRepository journalRepo;
  late MediaRepository mediaRepo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    eventRepo = EventRepository(db);
    journalRepo = JournalRepository(db, eventRepo);
    mediaRepo = MediaRepository(db, eventRepo, LocalMediaAdapter(db));
  });
  tearDown(() => db.close());

  test('save persists blob and media.added event; loadBlob round-trips', () async {
    final entry = await journalRepo.create(body: 'with media');
    final bytes = Uint8List.fromList(List.filled(2048, 7));
    final media = await mediaRepo.save(
      MediaAttachment(
        id: newId('ma'),
        entryId: entry.id,
        fileName: 'a.mp4',
        mimeType: 'video/mp4',
        sizeBytes: bytes.length,
        capturedAt: DateTime.now(),
        syncState: 'local-only',
        storageRef: '',
        adopted: false,
      ),
      bytes,
    );
    expect(media.storageRef, 'blob:${media.id}');
    final loaded = await mediaRepo.loadBlob(media.id);
    expect(loaded, bytes);
    final evs = await eventRepo.query(type: 'media.added', entityId: media.id);
    expect(evs, hasLength(1));
  });

  test('forEntry returns attachments for an entry', () async {
    final entry = await journalRepo.create(body: 'with media');
    final bytes = Uint8List.fromList(List.filled(10, 1));
    await mediaRepo.save(
      MediaAttachment(
        id: newId('ma'),
        entryId: entry.id,
        fileName: 'p.jpg',
        mimeType: 'image/jpeg',
        sizeBytes: bytes.length,
        capturedAt: DateTime.now(),
        syncState: 'local-only',
        storageRef: '',
        adopted: false,
      ),
      bytes,
    );
    final list = await mediaRepo.forEntry(entry.id);
    expect(list, hasLength(1));
    expect(list.first.fileName, 'p.jpg');
  });

  test('delete removes row + blob + vlog.deleted tombstone for videos', () async {
    final entry = await journalRepo.create(body: 'with vlog');
    final bytes = Uint8List.fromList(List.filled(100, 2));
    final media = await mediaRepo.save(
      MediaAttachment(
        id: newId('ma'),
        entryId: entry.id,
        fileName: 'v.mp4',
        mimeType: 'video/mp4',
        sizeBytes: bytes.length,
        capturedAt: DateTime.now(),
        syncState: 'local-only',
        storageRef: '',
        adopted: false,
      ),
      bytes,
    );
    await mediaRepo.delete(media.id);
    expect(await mediaRepo.loadBlob(media.id), isNull);
    expect(await mediaRepo.forEntry(entry.id), isEmpty);
    final tombstones =
        await eventRepo.query(type: 'vlog.deleted', entityId: media.id);
    expect(tombstones, hasLength(1));
  });

  test('delete of a photo writes media.removed', () async {
    final entry = await journalRepo.create(body: 'photo');
    final bytes = Uint8List.fromList(List.filled(50, 3));
    final media = await mediaRepo.save(
      MediaAttachment(
        id: newId('ma'),
        entryId: entry.id,
        fileName: 'p.jpg',
        mimeType: 'image/jpeg',
        sizeBytes: bytes.length,
        capturedAt: DateTime.now(),
        syncState: 'local-only',
        storageRef: '',
        adopted: false,
      ),
      bytes,
    );
    await mediaRepo.delete(media.id);
    final removed =
        await eventRepo.query(type: 'media.removed', entityId: media.id);
    expect(removed, hasLength(1));
  });
}
