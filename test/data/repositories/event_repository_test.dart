import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/models/event_record.dart';
import 'package:personalos/data/repositories/event_repository.dart';

void main() {
  late AppDatabase db;
  late EventRepository repo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = EventRepository(db);
  });
  tearDown(() => db.close());

  EventRecord event(String id, String type, String dayKey,
      {String? entityId, DateTime? at}) {
    return EventRecord(
      id: id,
      type: type,
      occurredAt: at ?? DateTime.parse('${dayKey}T09:00:00'),
      dayKey: dayKey,
      entityType: 'habit',
      entityId: entityId ?? 'h-1',
      payloadVersion: 1,
      payload: '{}',
    );
  }

  test('append then query by type+day', () async {
    await repo.append(event('ev-1', 'habit.completed', '2026-08-01'));
    final rows =
        await repo.query(type: 'habit.completed', dayKey: '2026-08-01');
    expect(rows, hasLength(1));
    expect(rows.first.entityId, 'h-1');
  });

  test('query filters by entityType+entityId', () async {
    await repo.append(event('ev-1', 'habit.completed', '2026-08-01'));
    await repo.append(event('ev-2', 'habit.completed', '2026-08-01', entityId: 'h-2'));
    final rows = await repo.query(entityType: 'habit', entityId: 'h-2');
    expect(rows, hasLength(1));
    expect(rows.first.id, 'ev-2');
  });

  test('eventsForDay returns the day subset in order', () async {
    await repo.append(event('ev-1', 'habit.completed', '2026-08-01', at: DateTime(2026, 8, 1, 8)));
    await repo.append(event('ev-2', 'journal.created', '2026-08-01', at: DateTime(2026, 8, 1, 20)));
    await repo.append(event('ev-3', 'habit.completed', '2026-08-02'));
    final rows = await repo.eventsForDay('2026-08-01');
    expect(rows, hasLength(2));
  });

  test('eventExists dedupes per (type, entityId, dayKey)', () async {
    await repo.append(event('ev-1', 'habit.missed', '2026-08-01'));
    expect(
      await repo.eventExists(type: 'habit.missed', entityId: 'h-1', dayKey: '2026-08-01'),
      isTrue,
    );
    expect(
      await repo.eventExists(type: 'habit.missed', entityId: 'h-1', dayKey: '2026-08-02'),
      isFalse,
    );
    expect(
      await repo.eventExists(type: 'habit.completed', entityId: 'h-1', dayKey: '2026-08-01'),
      isFalse,
    );
  });

  test('eventsOfTypeSince returns events of a type on or after dayKey', () async {
    await repo.append(event('ev-1', 'habit.missed', '2026-08-01'));
    await repo.append(event('ev-2', 'habit.missed', '2026-08-02'));
    await repo.append(event('ev-3', 'habit.completed', '2026-08-02'));
    final rows = await repo.eventsOfTypeSince('habit.missed', '2026-08-02');
    expect(rows, hasLength(1));
    expect(rows.first.id, 'ev-2');
  });
}
