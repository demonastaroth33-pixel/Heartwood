import 'package:drift/drift.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/data/adapters/local_media_adapter.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/models/event_record.dart';
import 'package:personalos/data/models/media_attachment.dart';
import 'package:personalos/data/repositories/event_repository.dart';

class MediaRepository {
  final AppDatabase db;
  final EventRepository events;
  final LocalMediaAdapter adapter;
  MediaRepository(this.db, this.events, this.adapter);

  Future<MediaAttachment> save(MediaAttachment media, Uint8List bytes) async {
    final ref = 'blob:${media.id}';
    final stored = MediaAttachment(
      id: media.id,
      entryId: media.entryId,
      fileName: media.fileName,
      mimeType: media.mimeType,
      sizeBytes: media.sizeBytes,
      durationSec: media.durationSec,
      title: media.title,
      capturedAt: media.capturedAt,
      syncState: media.syncState,
      storageRef: ref,
      thumbnailRef: media.thumbnailRef,
      contentHash: media.contentHash,
      archivedOnDevice: media.archivedOnDevice,
      adopted: media.adopted,
    );
    await db.transaction(() async {
      await db.into(db.mediaAttachments).insert(
            MediaAttachmentsCompanion.insert(
              id: media.id,
              entryId: Value(media.entryId),
              fileName: media.fileName,
              mimeType: media.mimeType,
              sizeBytes: media.sizeBytes,
              durationSec: Value(media.durationSec),
              title: Value(media.title),
              capturedAt: media.capturedAt,
              syncState: Value(media.syncState),
              storageRef: Value(ref),
              thumbnailRef: Value(media.thumbnailRef),
              contentHash: Value(media.contentHash),
              archivedOnDevice: Value(media.archivedOnDevice),
              adopted: Value(media.adopted),
            ),
          );
      await adapter.save(media.id, bytes);
      await events.append(EventRecord(
        id: newId('ev'),
        type: 'media.added',
        occurredAt: media.capturedAt,
        dayKey: dayKey(media.capturedAt),
        entityType: 'media',
        entityId: media.id,
      ));
    });
    return stored;
  }

  Future<Uint8List?> loadBlob(String id) async {
    final row = await _rowById(id);
    if (row == null) return null;
    return adapter.read(row.storageRef);
  }

  Future<List<MediaAttachment>> forEntry(String entryId) async {
    final q = db.select(db.mediaAttachments)
      ..where((t) => t.entryId.equals(entryId))
      ..orderBy([(t) => OrderingTerm.asc(t.capturedAt)]);
    final rows = await q.get();
    return rows.map(MediaAttachment.fromRow).toList();
  }

  Future<MediaAttachment?> byId(String id) async {
    final row = await _rowById(id);
    return row == null ? null : MediaAttachment.fromRow(row);
  }

  Future<void> delete(String id) async {
    final row = await _rowById(id);
    if (row == null) return;
    final isVideo = row.mimeType.startsWith('video/');
    await db.transaction(() async {
      await adapter.delete(row.storageRef);
      await (db.delete(db.mediaAttachments)
            ..where((t) => t.id.equals(id)))
          .go();
      await events.append(EventRecord(
        id: newId('ev'),
        type: isVideo ? 'vlog.deleted' : 'media.removed',
        occurredAt: DateTime.now(),
        dayKey: dayKey(DateTime.now()),
        entityType: 'media',
        entityId: id,
      ));
    });
  }

  Future<MediaAttachmentRow?> _rowById(String id) async {
    final q = db.select(db.mediaAttachments)..where((t) => t.id.equals(id));
    return q.getSingleOrNull();
  }
}
