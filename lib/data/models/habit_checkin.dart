import 'package:personalos/data/database/database.dart';

class HabitCheckin {
  final String id;
  final String habitId;
  final String dayKey;
  final DateTime completedAt;
  final String? note;

  const HabitCheckin({
    required this.id,
    required this.habitId,
    required this.dayKey,
    required this.completedAt,
    this.note,
  });

  factory HabitCheckin.fromRow(HabitCheckinRow row) {
    return HabitCheckin(
      id: row.id,
      habitId: row.habitId,
      dayKey: row.dayKey,
      completedAt: row.completedAt,
      note: row.note,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'habitId': habitId,
      'dayKey': dayKey,
      'completedAt': completedAt.toIso8601String(),
      'note': note,
    };
  }

  factory HabitCheckin.fromJson(Map<String, dynamic> json) {
    return HabitCheckin(
      id: json['id'] as String,
      habitId: json['habitId'] as String,
      dayKey: json['dayKey'] as String,
      completedAt: DateTime.parse(json['completedAt'] as String),
      note: json['note'] as String?,
    );
  }
}
