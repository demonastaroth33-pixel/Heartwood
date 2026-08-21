import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/habits/habits_providers.dart';

import 'block_card.dart';

class TodaySection extends ConsumerWidget {
  const TodaySection({super.key});

  Future<void> _checkIn(WidgetRef ref, String habitId) async {
    await ref.read(habitRepoProvider).checkIn(habitId);
    await refreshHabitState(ref, habitId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitsProvider);
    final done = ref.watch(todayCheckinsProvider);
    return BlockCard(
      title: 'Today',
      child: habits.when(
        loading: () => const SizedBox(
          height: 32,
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (e, _) => EmptyLine(text: 'Could not load habits: $e'),
        data: (list) => list.isEmpty
            ? const EmptyLine(
                text: 'No habits yet — add your first habit in the Habits tab.',
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...list.map(
                    (habit) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Text(habit.name),
                      trailing: IconButton(
                        onPressed: () => _checkIn(ref, habit.id),
                        icon: Icon(
                          done.valueOrNull?.contains(habit.id) == true
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                        ),
                        color: done.valueOrNull?.contains(habit.id) == true
                            ? const Color(0xFFE8B45A)
                            : null,
                        tooltip: 'Check off',
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}