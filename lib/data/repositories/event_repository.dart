import 'package:drift/drift.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/models/event_record.dart';

class EventRepository {
  final AppDatabase db;
  EventRepository(this.db);

  Future<void> append(EventRecord event) async {
    await db.into(db.events).insert(
          EventsCompanion.insert(
            id: event.id,
            type: event.type,
            occurredAt: event.occurredAt,
            dayKey: event.dayKey,
            area: Value(event.area),
            entityType: event.entityType,
            entityId: event.entityId,
            payloadVersion: Value(event.payloadVersion),
            payload: event.payload,
            supersedesId: Value(event.supersedesId),
          ),
        );
  }

  Future<List<EventRecord>> query({
    String? type,
    String? dayKey,
    String? entityType,
    String? entityId,
    DateTime? from,
  }) async {
    final t = db.events;
    Expression<bool> predicate = const Constant(true);
    if (type != null) predicate = predicate & t.type.equals(type);
    if (dayKey != null) predicate = predicate & t.dayKey.equals(dayKey);
    if (entityType != null) {
      predicate = predicate & t.entityType.equals(entityType);
    }
    if (entityId != null) predicate = predicate & t.entityId.equals(entityId);
    if (from != null) {
      predicate = predicate & t.occurredAt.isBiggerOrEqualValue(from);
    }

    final q = db.select(t)..orderBy([(u) => OrderingTerm.asc(u.occurredAt)]);
    q.where((_) => predicate);
    final rows = await q.get();
    return rows.map(EventRecord.fromRow).toList();
  }

  Future<List<EventRecord>> eventsForDay(String dayKey) async {
    return query(dayKey: dayKey);
  }

  Future<bool> eventExists({
    required String type,
    required String entityId,
    required String dayKey,
  }) async {
    final q = db.select(db.events)
      ..where((t) =>
          t.type.equals(type) &
          t.entityId.equals(entityId) &
          t.dayKey.equals(dayKey))
      ..limit(1);
    final rows = await q.get();
    return rows.isNotEmpty;
  }

  Future<List<EventRecord>> eventsOfTypeSince(String type, String dayKey) async {
    return query(type: type, from: DateTime.parse('${dayKey}T00:00:00'));
  }
}
