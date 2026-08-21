import 'package:drift/drift.dart';
import 'package:personalos/data/database/database.dart';

class LocalMediaAdapter {
  final AppDatabase db;
  LocalMediaAdapter(this.db);

  Future<String> save(String id, Uint8List bytes) async {
    await (db.update(db.mediaAttachments)
          ..where((t) => t.id.equals(id)))
        .write(MediaAttachmentsCompanion(blobData: Value(bytes)));
    return 'blob:$id';
  }

  Future<Uint8List?> read(String ref) async {
    if (!ref.startsWith('blob:')) return null;
    final id = ref.substring('blob:'.length);
    final q = db.select(db.mediaAttachments)..where((t) => t.id.equals(id));
    final row = await q.getSingleOrNull();
    return row?.blobData;
  }

  Future<void> delete(String ref) async {
    if (!ref.startsWith('blob:')) return;
    final id = ref.substring('blob:'.length);
    await (db.update(db.mediaAttachments)
          ..where((t) => t.id.equals(id)))
        .write(MediaAttachmentsCompanion(blobData: const Value(null)));
  }
}
