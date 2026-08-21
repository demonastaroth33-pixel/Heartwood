import 'package:personalos/data/database/database.dart';

class CoachOutput {
  final String id;
  final String kind;
  final String dateKey;
  final String payload;

  const CoachOutput({
    required this.id,
    required this.kind,
    required this.dateKey,
    required this.payload,
  });

  factory CoachOutput.fromRow(CoachOutputRow row) {
    return CoachOutput(
      id: row.id,
      kind: row.kind,
      dateKey: row.dateKey,
      payload: row.payload,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kind': kind,
      'dateKey': dateKey,
      'payload': payload,
    };
  }

  factory CoachOutput.fromJson(Map<String, dynamic> json) {
    return CoachOutput(
      id: json['id'] as String,
      kind: json['kind'] as String,
      dateKey: json['dateKey'] as String,
      payload: json['payload'] as String,
    );
  }
}
