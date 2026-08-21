import 'package:personalos/data/database/database.dart';

import 'estimate_stub.dart' if (dart.library.js_interop) 'estimate_web.dart'
    as impl;

enum StorageLevel { none, warn, hardWarn }

StorageLevel warningLevel({
  required double usedBytes,
  required double quotaBytes,
}) {
  if (quotaBytes <= 0) return StorageLevel.none;
  final fraction = usedBytes / quotaBytes;
  if (fraction >= 0.9) return StorageLevel.hardWarn;
  if (fraction >= 0.7) return StorageLevel.warn;
  return StorageLevel.none;
}

class StorageMeterData {
  final int usedBytes;
  final int quotaBytes;
  final int dbMediaBytes;

  const StorageMeterData({
    required this.usedBytes,
    required this.quotaBytes,
    required this.dbMediaBytes,
  });

  StorageLevel get level =>
      warningLevel(usedBytes: usedBytes.toDouble(), quotaBytes: quotaBytes.toDouble());
}

class StorageMeter {
  final AppDatabase db;

  StorageMeter(this.db);

  Future<StorageMeterData> read() async {
    final row = await db.customSelect(
      'SELECT COALESCE(SUM(size_bytes), 0) AS s FROM media_attachments WHERE adopted = 0',
    ).getSingle();
    final dbMedia = row.read<int>('s');
    final usage = await impl.estimateUsageBytes();
    final quota = await impl.estimateQuotaBytes();
    return StorageMeterData(
      usedBytes: usage ?? dbMedia,
      quotaBytes: quota ?? 0,
      dbMediaBytes: dbMedia,
    );
  }
}