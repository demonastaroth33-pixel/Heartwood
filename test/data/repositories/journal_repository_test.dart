import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/repositories/event_repository.dart';
import 'package:personalos/data/repositories/journal_repository.dart';

void main() {
  late AppDatabase db;
  late EventRepository eventRepo;
  late JournalRepository journalRepo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    eventRepo = EventRepository(db);
    journalRepo = JournalRepository(db, eventRepo);
  });
  tearDown(() => db.close());

  test('create writes entity and journal.created event in one transaction',
      () async {
    final entry = await journalRepo
        .create(body: 'Today I worked out and read', area: 'health', tags: const ['win']);
    expect(entry.id, isNotEmpty);
    final events =
        await eventRepo.query(type: 'journal.created', entityId: entry.id);
    expect(events, hasLength(1));
    final payload = jsonDecode(events.first.payload) as Map<String, dynamic>;
    expect(payload['wordCount'], greaterThan(0));
    expect(payload['area'], 'health');
  });

  test('forDay groups by capture-time local date', () async {
    await journalRepo.create(body: 'morning', at: DateTime(2026, 8, 1, 8));
    await journalRepo.create(body: 'night', at: DateTime(2026, 8, 1, 23));
    await journalRepo.create(body: 'next day', at: DateTime(2026, 8, 2, 1));
    expect(await journalRepo.forDay('2026-08-01'), hasLength(2));
    expect(await journalRepo.forDay('2026-08-02'), hasLength(1));
  });

  test('delete is a soft tombstone + journal.deleted event', () async {
    final entry = await journalRepo.create(body: 'x');
    await journalRepo.delete(entry.id);
    expect(await journalRepo.forDay(dayKeyOf(entry)), isEmpty);
    final deletes =
        await eventRepo.query(type: 'journal.deleted', entityId: entry.id);
    expect(deletes, hasLength(1));
  });

  test('update appends journal.edited with supersedesId', () async {
    final entry = await journalRepo.create(body: 'v1');
    final updated = await journalRepo.update(
      entry.copyWith(body: 'v2', updatedAt: DateTime(2026, 8, 1, 10)),
    );
    expect(updated.body, 'v2');
    final edits =
        await eventRepo.query(type: 'journal.edited', entityId: entry.id);
    expect(edits, hasLength(1));
    final creates =
        await eventRepo.query(type: 'journal.created', entityId: entry.id);
    expect(edits.first.supersedesId, creates.first.id);
  });

  test('recent returns newest-first active entries', () async {
    await journalRepo.create(body: 'a', at: DateTime(2026, 8, 1));
    await journalRepo.create(body: 'b', at: DateTime(2026, 8, 3));
    await journalRepo.create(body: 'c', at: DateTime(2026, 8, 2));
    final recent = await journalRepo.recent(limit: 10);
    expect(recent.map((e) => e.body).toList(), ['b', 'c', 'a']);
  });
}

String dayKeyOf(dynamic entry) {
  final d = (entry as dynamic).createdAt as DateTime;
  final y = d.year.toString().padLeft(4, '0');
  final m = d.month.toString().padLeft(2, '0');
  final day = d.day.toString().padLeft(2, '0');
  return '$y-$m-$day';
}
