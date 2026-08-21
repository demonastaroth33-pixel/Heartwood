import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/features/habits/habit_edit_sheet.dart';
import 'package:personalos/features/habits/habit_list_tile.dart';
import 'package:personalos/features/habits/habits_providers.dart';

class HabitsScreen extends ConsumerWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Habits')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showHabitEditSheet(context),
        tooltip: 'Add habit',
        child: const Icon(Icons.add),
      ),
      body: habits.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Could not load habits: $e')),
        data: (list) => list.isEmpty
            ? const Center(
                child: Text('No habits yet — add your first habit.'),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: list.length,
                itemBuilder: (context, i) => HabitListTile(habit: list[i]),
              ),
      ),
    );
  }
}