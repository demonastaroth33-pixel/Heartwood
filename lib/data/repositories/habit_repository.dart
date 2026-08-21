import 'package:drift/drift.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/models/event_record.dart';
import 'package:personalos/data/models/habit.dart';
import 'package:personalos/data/models/habit_checkin.dart';
import 'package:personalos/data/repositories/event_repository.dart';

class HabitRepository {
  final AppDatabase db;
  final EventRepository events;
  HabitRepository(this.db, this.events);

  Future<Habit> create({
    required String name,
    String? area,
    DateTime? at,
  }) async {
    final now = at ?? DateTime.now();
    final id = newId('hab');
    final habit = Habit(
      id: id,
      name: name,
      area: area,
      createdAt: now,
      active: true,
    );
    await db.into(db.habits).insert(
          HabitsCompanion.insert(
            id: id,
            name: name,
            area: Value(area),
            createdAt: now,
            active: const Value(true),
          ),
        );
    return habit;
  }

  Future<List<Habit>> listActive() async {
    final q = db.select(db.habits)
      ..where((t) => t.active.equals(true))
      ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]);
    final rows = await q.get();
    return rows.map(Habit.fromRow).toList();
  }

  Future<void> setActive(String id, bool active) async {
    await (db.update(db.habits)
          ..where((t) => t.id.equals(id)))
        .write(HabitsCompanion(active: Value(active)));
  }

  Future<void> rename(String id, String name) async {
    await (db.update(db.habits)
          ..where((t) => t.id.equals(id)))
        .write(HabitsCompanion(name: Value(name)));
  }

  Future<void> checkIn(String habitId, {DateTime? at, String? note}) async {
    final now = at ?? DateTime.now();
    final dk = dayKey(now);
    await db.transaction(() async {
      final existing = await (db.select(db.habitCheckins)
            ..where((t) => t.habitId.equals(habitId) & t.dayKey.equals(dk)))
          .getSingleOrNull();
      if (existing != null) return;
      await db.into(db.habitCheckins).insert(
            HabitCheckinsCompanion.insert(
              id: newId('chk'),
              habitId: habitId,
              dayKey: dk,
              completedAt: now,
              note: Value(note),
            ),
            mode: InsertMode.insertOrIgnore,
          );
      await events.append(EventRecord(
        id: newId('ev'),
        type: 'habit.completed',
        occurredAt: now,
        dayKey: dk,
        entityType: 'habit',
        entityId: habitId,
      ));
    });
  }

  Future<List<HabitCheckin>> checkInsForDay(String dayKey) async {
    final q = db.select(db.habitCheckins)
      ..where((t) => t.dayKey.equals(dayKey))
      ..orderBy([(t) => OrderingTerm.asc(t.completedAt)]);
    final rows = await q.get();
    return rows.map(HabitCheckin.fromRow).toList();
  }

  Future<List<HabitCheckin>> checkInsForHabit(String habitId) async {
    final q = db.select(db.habitCheckins)
      ..where((t) => t.habitId.equals(habitId))
      ..orderBy([(t) => OrderingTerm.asc(t.completedAt)]);
    final rows = await q.get();
    return rows.map(HabitCheckin.fromRow).toList();
  }

  Future<Set<String>> checkedDayKeys(String habitId) async {
    final checkins = await checkInsForHabit(habitId);
    return checkins.map((c) => c.dayKey).toSet();
  }

  Future<int> streak(String habitId, {DateTime? today}) async {
    final keys = await checkedDayKeys(habitId);
    return computeStreak(keys, today: dayKey(today ?? DateTime.now()));
  }
}

int computeStreak(Set<String> checkedDayKeys, {required String today}) {
  final todayDate = DateTime.parse(today);
  if (checkedDayKeys.contains(dayKey(todayDate))) {
    return _countBack(checkedDayKeys, todayDate);
  }
  final yesterday = todayDate.subtract(const Duration(days: 1));
  if (checkedDayKeys.contains(dayKey(yesterday))) {
    return _countBack(checkedDayKeys, yesterday);
  }
  return 0;
}

int _countBack(Set<String> keys, DateTime end) {
  var streak = 0;
  var d = DateTime(end.year, end.month, end.day);
  while (keys.contains(dayKey(d))) {
    streak++;
    d = d.subtract(const Duration(days: 1));
  }
  return streak;
}
