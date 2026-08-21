import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/data/models/habit.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/habits/habits_providers.dart';

class HabitListTile extends ConsumerWidget {
  final Habit habit;

  const HabitListTile({super.key, required this.habit});

  Future<void> _checkIn(WidgetRef ref) async {
    await ref.read(habitRepoProvider).checkIn(habit.id);
    await refreshHabitState(ref, habit.id);
  }

  Future<void> _archive(WidgetRef ref) async {
    await ref.read(habitRepoProvider).setActive(habit.id, false);
    await refreshHabits(ref);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streak = ref.watch(habitStreakProvider(habit.id));
    final streakLine = switch (streak.valueOrNull) {
      null || 0 => null,
      final int n => '$n-day streak',
    };
    return Card(
      color: const Color(0xFF17202E),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(habit.name),
        subtitle: streakLine == null ? null : Text(streakLine),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              key: const Key('check-habit'),
              onPressed: () => _checkIn(ref),
              icon: const Icon(Icons.radio_button_unchecked),
              iconSize: 32,
              tooltip: 'Check off',
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 'archive') _archive(ref);
              },
              itemBuilder: (context) => const [
                PopupMenuItem(value: 'archive', child: Text('Archive')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}