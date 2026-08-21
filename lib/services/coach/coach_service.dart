import 'package:drift/drift.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/models/event_record.dart';
import 'package:personalos/data/repositories/event_repository.dart';
import 'package:personalos/data/repositories/habit_repository.dart';
import 'package:personalos/services/coach/coach_rule_engine.dart';

class CoachService {
  final AppDatabase db;
  final EventRepository events;
  final HabitRepository habits;

  CoachService(this.db, this.events, this.habits);

  Future<void> refresh({DateTime? on}) async {
    final now = on ?? DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    final active = await habits.listActive();
    final habitNames = {for (final h in active) h.id: h.name};
    final misses = <String, List<String>>{};

    for (final habit in active) {
      final checked = await habits.checkedDayKeys(habit.id);
      final missDays = <String>[];
      var d = DateTime(habit.createdAt.year, habit.createdAt.month, habit.createdAt.day);
      final end = DateTime(yesterday.year, yesterday.month, yesterday.day);
      while (!d.isAfter(end)) {
        final dk = dayKey(d);
        if (!checked.contains(dk)) missDays.add(dk);
        d = d.add(const Duration(days: 1));
      }
      for (final dk in missDays) {
        final exists = await events.eventExists(
          type: 'habit.missed',
          entityId: habit.id,
          dayKey: dk,
        );
        if (!exists) {
          await events.append(EventRecord(
            id: newId('ev'),
            type: 'habit.missed',
            occurredAt: DateTime.parse('${dk}T00:00:00'),
            dayKey: dk,
            entityType: 'habit',
            entityId: habit.id,
          ));
        }
      }
      if (missDays.isNotEmpty) misses[habit.id] = missDays;
    }

    final messages = CoachRuleEngine.evaluate(
      missesByHabit: misses,
      habitNames: habitNames,
      on: now,
    );
    for (final m in messages) {
      final existing = await (db.select(db.coachOutputs)
            ..where((t) => t.kind.equals(m.kind) & t.dateKey.equals(m.dateKey)))
          .getSingleOrNull();
      if (existing != null) continue;
      await db.into(db.coachOutputs).insert(CoachOutputsCompanion.insert(
        id: newId('co'),
        kind: m.kind,
        dateKey: m.dateKey,
        payload: m.payload,
      ));
    }
  }
}