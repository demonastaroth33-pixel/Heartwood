import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/data/models/habit.dart';
import 'package:personalos/data/providers.dart';

final habitsProvider = FutureProvider<List<Habit>>(
  (ref) => ref.watch(habitRepoProvider).listActive(),
);

final habitStreakProvider = FutureProvider.family<int, String>(
  (ref, habitId) => ref.watch(habitRepoProvider).streak(habitId),
);

final todayCheckinsProvider = FutureProvider<Set<String>>(
  (ref) async {
    final repo = ref.watch(habitRepoProvider);
    final rows = await repo.checkInsForDay(dayKey(DateTime.now()));
    return rows.map((c) => c.habitId).toSet();
  },
);

Future<void> refreshHabits(WidgetRef ref) async {
  ref.invalidate(habitsProvider);
  ref.invalidate(todayCheckinsProvider);
  await ref.read(habitsProvider.future);
}

Future<void> refreshHabitState(WidgetRef ref, String habitId) async {
  ref.invalidate(habitStreakProvider(habitId));
  ref.invalidate(todayCheckinsProvider);
}