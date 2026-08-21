import 'dart:convert';

import 'package:personalos/data/database/database.dart';

class JournalEntry {
  final String id;
  final String? title;
  final String body;
  final String? area;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool imported;
  final String? importHash;

  const JournalEntry({
    required this.id,
    this.title,
    required this.body,
    this.area,
    this.tags = const [],
    required this.createdAt,
    required this.updatedAt,
    this.imported = false,
    this.importHash,
  });

  factory JournalEntry.fromRow(JournalEntryRow row) {
    return JournalEntry(
      id: row.id,
      title: row.title,
      body: row.body,
      area: row.area,
      tags: row.tagsJson.isEmpty
          ? const []
          : (jsonDecode(row.tagsJson) as List).cast<String>(),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      imported: row.imported,
      importHash: row.importHash,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'area': area,
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'imported': imported,
      'importHash': importHash,
    };
  }

  factory JournalEntry.fromJson(Map<String, dynamic> json) {
    return JournalEntry(
      id: json['id'] as String,
      title: json['title'] as String?,
      body: json['body'] as String,
      area: json['area'] as String?,
      tags: (json['tags'] as List<dynamic>? ?? const []).cast<String>(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      imported: json['imported'] as bool? ?? false,
      importHash: json['importHash'] as String?,
    );
  }
}
