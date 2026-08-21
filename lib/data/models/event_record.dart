import 'package:personalos/data/database/database.dart';

class EventRecord {
  final String id;
  final String type;
  final DateTime occurredAt;
  final String dayKey;
  final String? area;
  final String entityType;
  final String entityId;
  final int payloadVersion;
  final String payload;
  final String? supersedesId;

  const EventRecord({
    required this.id,
    required this.type,
    required this.occurredAt,
    required this.dayKey,
    this.area,
    required this.entityType,
    required this.entityId,
    this.payloadVersion = 1,
    this.payload = '{}',
    this.supersedesId,
  });

  factory EventRecord.fromRow(EventRow row) {
    return EventRecord(
      id: row.id,
      type: row.type,
      occurredAt: row.occurredAt,
      dayKey: row.dayKey,
      area: row.area,
      entityType: row.entityType,
      entityId: row.entityId,
      payloadVersion: row.payloadVersion,
      payload: row.payload,
      supersedesId: row.supersedesId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'occurredAt': occurredAt.toIso8601String(),
      'dayKey': dayKey,
      'area': area,
      'entityType': entityType,
      'entityId': entityId,
      'payloadVersion': payloadVersion,
      'payload': payload,
      'supersedesId': supersedesId,
    };
  }

  factory EventRecord.fromJson(Map<String, dynamic> json) {
    return EventRecord(
      id: json['id'] as String,
      type: json['type'] as String,
      occurredAt: DateTime.parse(json['occurredAt'] as String),
      dayKey: json['dayKey'] as String,
      area: json['area'] as String?,
      entityType: json['entityType'] as String,
      entityId: json['entityId'] as String,
      payloadVersion: json['payloadVersion'] as int? ?? 1,
      payload: json['payload'] as String? ?? '{}',
      supersedesId: json['supersedesId'] as String?,
    );
  }
}
