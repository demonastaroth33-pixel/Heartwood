import 'package:personalos/data/database/database.dart';

class Habit {
  final String id;
  final String name;
  final String? area;
  final DateTime createdAt;
  final bool active;

  const Habit({
    required this.id,
    required this.name,
    this.area,
    required this.createdAt,
    this.active = true,
  });

  factory Habit.fromRow(HabitRow row) {
    return Habit(
      id: row.id,
      name: row.name,
      area: row.area,
      createdAt: row.createdAt,
      active: row.active,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'area': area,
      'createdAt': createdAt.toIso8601String(),
      'active': active,
    };
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'] as String,
      name: json['name'] as String,
      area: json['area'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      active: json['active'] as bool? ?? true,
    );
  }
}
