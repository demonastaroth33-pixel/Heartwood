import 'package:personalos/data/database/database.dart';

class MediaAttachment {
  final String id;
  final String? entryId;
  final String fileName;
  final String mimeType;
  final int sizeBytes;
  final int? durationSec;
  final String? title;
  final DateTime capturedAt;
  final String syncState;
  final String storageRef;
  final String? thumbnailRef;
  final String? contentHash;
  final String? archivedOnDevice;
  final bool adopted;

  const MediaAttachment({
    required this.id,
    this.entryId,
    required this.fileName,
    required this.mimeType,
    required this.sizeBytes,
    this.durationSec,
    this.title,
    required this.capturedAt,
    this.syncState = 'local-only',
    this.storageRef = '',
    this.thumbnailRef,
    this.contentHash,
    this.archivedOnDevice,
    this.adopted = false,
  });

  factory MediaAttachment.fromRow(MediaAttachmentRow row) {
    return MediaAttachment(
      id: row.id,
      entryId: row.entryId,
      fileName: row.fileName,
      mimeType: row.mimeType,
      sizeBytes: row.sizeBytes,
      durationSec: row.durationSec,
      title: row.title,
      capturedAt: row.capturedAt,
      syncState: row.syncState,
      storageRef: row.storageRef,
      thumbnailRef: row.thumbnailRef,
      contentHash: row.contentHash,
      archivedOnDevice: row.archivedOnDevice,
      adopted: row.adopted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'entryId': entryId,
      'fileName': fileName,
      'mimeType': mimeType,
      'sizeBytes': sizeBytes,
      'durationSec': durationSec,
      'title': title,
      'capturedAt': capturedAt.toIso8601String(),
      'syncState': syncState,
      'storageRef': storageRef,
      'thumbnailRef': thumbnailRef,
      'contentHash': contentHash,
      'archivedOnDevice': archivedOnDevice,
      'adopted': adopted,
    };
  }

  factory MediaAttachment.fromJson(Map<String, dynamic> json) {
    return MediaAttachment(
      id: json['id'] as String,
      entryId: json['entryId'] as String?,
      fileName: json['fileName'] as String,
      mimeType: json['mimeType'] as String,
      sizeBytes: json['sizeBytes'] as int,
      durationSec: json['durationSec'] as int?,
      title: json['title'] as String?,
      capturedAt: DateTime.parse(json['capturedAt'] as String),
      syncState: json['syncState'] as String? ?? 'local-only',
      storageRef: json['storageRef'] as String? ?? '',
      thumbnailRef: json['thumbnailRef'] as String?,
      contentHash: json['contentHash'] as String?,
      archivedOnDevice: json['archivedOnDevice'] as String?,
      adopted: json['adopted'] as bool? ?? false,
    );
  }
}
