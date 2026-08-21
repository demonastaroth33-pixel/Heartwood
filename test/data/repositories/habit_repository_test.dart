import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/repositories/event_repository.dart';
import 'package:personalos/data/repositories/habit_repository.dart';

void main() {
  late AppDatabase db;
  late EventRepository eventRepo;
  late HabitRepository habitRepo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    eventRepo = EventRepository(db);
    habitRepo = HabitRepository(db, eventRepo);
  });
  tearDown(() => db.close());

  test('create + listActive returns only active habits', () async {
    await habitRepo.create(name: 'Read');
    await habitRepo.create(name: 'Meditate', area: 'health');
    expect(await habitRepo.listActive(), hasLength(2));
  });

  test('setActive hides a habit from listActive', () async {
    final habit = await habitRepo.create(name: 'Read');
    await habitRepo.setActive(habit.id, false);
    final active = await habitRepo.listActive();
    expect(active, isEmpty);
  });

  test('rename updates the habit name', () async {
    final habit = await habitRepo.create(name: 'Read');
    await habitRepo.rename(habit.id, 'Read 20 pages');
    final active = await habitRepo.listActive();
    expect(active.single.name, 'Read 20 pages');
  });

  test('checkIn writes checkin row + habit.completed event transactionally',
      () async {
    final habit = await habitRepo.create(name: 'Read');
    await habitRepo.checkIn(habit.id, at: DateTime(2026, 8, 1, 8));
    expect(await habitRepo.checkInsForDay('2026-08-01'), hasLength(1));
    final evs =
        await eventRepo.query(type: 'habit.completed', entityId: habit.id);
    expect(evs, hasLength(1));
    expect(evs.first.dayKey, '2026-08-01');
  });

  test('duplicate check-in for same habit+day is idempotent', () async {
    final habit = await habitRepo.create(name: 'Read');
    await habitRepo.checkIn(habit.id, at: DateTime(2026, 8, 1, 8));
    await habitRepo.checkIn(habit.id, at: DateTime(2026, 8, 1, 20));
    expect(await habitRepo.checkInsForDay('2026-08-01'), hasLength(1));
    final evs =
        await eventRepo.query(type: 'habit.completed', entityId: habit.id);
    expect(evs, hasLength(1));
  });

  test('streak via repository reads check-in history', () async {
    final habit = await habitRepo.create(name: 'Read');
    await habitRepo.checkIn(habit.id, at: DateTime(2026, 8, 1, 8));
    await habitRepo.checkIn(habit.id, at: DateTime(2026, 8, 2, 8));
    await habitRepo.checkIn(habit.id, at: DateTime(2026, 8, 3, 8));
    expect(
      await habitRepo.streak(habit.id, today: DateTime(2026, 8, 3)),
      3,
    );
    expect(
      await habitRepo.streak(habit.id, today: DateTime(2026, 8, 4)),
      3,
    );
  });
}
