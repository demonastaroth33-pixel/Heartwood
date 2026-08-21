import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/repositories/event_repository.dart';
import 'package:personalos/data/repositories/habit_repository.dart';
import 'package:personalos/services/coach/coach_service.dart';

void main() {
  late AppDatabase db;
  late EventRepository events;
  late HabitRepository habits;
  late CoachService service;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    events = EventRepository(db);
    habits = HabitRepository(db, events);
    service = CoachService(db, events, habits);
  });
  tearDown(() => db.close());

  test('3 consecutive missed days writes habit.missed events + one nudge',
      () async {
    final habit = await habits.create(name: 'Read', at: DateTime(2026, 8, 1));

    await service.refresh(on: DateTime(2026, 8, 4));

    final missed =
        await events.query(type: 'habit.missed', entityId: habit.id);
    expect(missed.map((e) => e.dayKey).toList(),
        ['2026-08-01', '2026-08-02', '2026-08-03']);
    final outputs = await db.select(db.coachOutputs).get();
    expect(outputs, hasLength(1));
    expect(outputs.single.kind, 'nudge');
    expect(outputs.single.payload, contains('Read'));
  });

  test('refresh is idempotent — no duplicate events or outputs', () async {
    final habit = await habits.create(name: 'Read', at: DateTime(2026, 8, 1));
    await service.refresh(on: DateTime(2026, 8, 4));
    await service.refresh(on: DateTime(2026, 8, 4));

    final missed =
        await events.query(type: 'habit.missed', entityId: habit.id);
    expect(missed, hasLength(3));
    final outputs = await db.select(db.coachOutputs).get();
    expect(outputs, hasLength(1));
  });

  test('a single miss stays silent', () async {
    final habit = await habits.create(name: 'Read', at: DateTime(2026, 8, 1));
    await habits.checkIn(habit.id, at: DateTime(2026, 8, 1, 8));
    await habits.checkIn(habit.id, at: DateTime(2026, 8, 2, 8));

    await service.refresh(on: DateTime(2026, 8, 4));

    expect(await db.select(db.coachOutputs).get(), isEmpty);
  });
}