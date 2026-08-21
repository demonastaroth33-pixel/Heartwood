import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/models/event_record.dart';
import 'package:personalos/data/models/journal_entry.dart';
import 'package:personalos/data/repositories/event_repository.dart';

class JournalRepository {
  final AppDatabase db;
  final EventRepository events;
  JournalRepository(this.db, this.events);

  Future<JournalEntry> create({
    String? title,
    required String body,
    String? area,
    List<String> tags = const [],
    DateTime? at,
  }) async {
    final now = at ?? DateTime.now();
    final id = newId('je');
    final entry = JournalEntry(
      id: id,
      title: title,
      body: body,
      area: area,
      tags: tags,
      createdAt: now,
      updatedAt: now,
    );
    await db.transaction(() async {
      await db.into(db.journalEntries).insert(
            JournalEntriesCompanion.insert(
              id: id,
              title: Value(title),
              body: body,
              area: Value(area),
              tagsJson: jsonEncode(tags),
              createdAt: now,
              updatedAt: now,
              imported: const Value(false),
            ),
          );
      await events.append(EventRecord(
        id: newId('ev'),
        type: 'journal.created',
        occurredAt: now,
        dayKey: dayKey(now),
        area: area,
        entityType: 'journal',
        entityId: id,
        payload: jsonEncode({
          'wordCount': wordCount(body),
          'tags': tags,
          'area': area,
        }),
      ));
    });
    return entry;
  }

  Future<JournalEntry> update(JournalEntry entry) async {
    await db.transaction(() async {
      await (db.update(db.journalEntries)
            ..where((t) => t.id.equals(entry.id)))
          .write(JournalEntriesCompanion(
        title: Value(entry.title),
        body: Value(entry.body),
        area: Value(entry.area),
        tagsJson: Value(jsonEncode(entry.tags)),
        updatedAt: Value(entry.updatedAt),
      ));
      final previous = await events.query(
        entityType: 'journal',
        entityId: entry.id,
      );
      await events.append(EventRecord(
        id: newId('ev'),
        type: 'journal.edited',
        occurredAt: entry.updatedAt,
        dayKey: dayKey(entry.updatedAt),
        area: entry.area,
        entityType: 'journal',
        entityId: entry.id,
        payload: jsonEncode({
          'wordCount': wordCount(entry.body),
          'tags': entry.tags,
          'area': entry.area,
        }),
        supersedesId: previous.isEmpty ? null : previous.last.id,
      ));
    });
    return entry;
  }

  Future<void> delete(String id) async {
    final row = await byIdRow(id);
    final area = row?.area;
    await db.transaction(() async {
      await (db.update(db.journalEntries)
            ..where((t) => t.id.equals(id)))
          .write(JournalEntriesCompanion(deletedAt: Value(DateTime.now())));
      await events.append(EventRecord(
        id: newId('ev'),
        type: 'journal.deleted',
        occurredAt: DateTime.now(),
        dayKey: dayKey(DateTime.now()),
        area: area,
        entityType: 'journal',
        entityId: id,
      ));
    });
  }

  Future<List<JournalEntry>> forDay(String dayKey) async {
    final start = DateTime.parse('${dayKey}T00:00:00');
    final end = start.add(const Duration(days: 1));
    final q = db.select(db.journalEntries)
      ..where((t) =>
          t.deletedAt.isNull() &
          t.createdAt.isBiggerOrEqualValue(start) &
          t.createdAt.isSmallerThanValue(end))
      ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]);
    final rows = await q.get();
    return rows.map(JournalEntry.fromRow).toList();
  }

  Future<List<JournalEntry>> recent({int limit = 50}) async {
    final q = db.select(db.journalEntries)
      ..where((t) => t.deletedAt.isNull())
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
      ..limit(limit);
    final rows = await q.get();
    return rows.map(JournalEntry.fromRow).toList();
  }

  Future<JournalEntry?> byId(String id) async {
    final q = db.select(db.journalEntries)
      ..where((t) => t.id.equals(id) & t.deletedAt.isNull());
    final row = await q.getSingleOrNull();
    return row == null ? null : JournalEntry.fromRow(row);
  }

  Future<JournalEntryRow?> byIdRow(String id) async {
    final q = db.select(db.journalEntries)..where((t) => t.id.equals(id));
    return q.getSingleOrNull();
  }
}

int wordCount(String body) {
  final trimmed = body.trim();
  if (trimmed.isEmpty) return 0;
  return trimmed.split(RegExp(r'\s+')).length;
}
