import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/features/habits/habit_edit_sheet.dart';
import 'package:personalos/features/habits/habit_list_tile.dart';
import 'package:personalos/features/habits/habits_providers.dart';
import 'package:personalos/widgets/app_fab.dart';
import 'package:personalos/widgets/block_card.dart';
import 'package:personalos/widgets/screen_header.dart';

class HabitsScreen extends ConsumerWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitsProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: AppFab(
        icon: Icons.add,
        tooltip: 'Add habit',
        onPressed: () => showHabitEditSheet(context),
      ),
      body: SafeArea(
        child: habits.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Could not load habits: $e')),
          data: (list) => list.isEmpty
              ? _EmptyHabits()
              : ListView(
                  padding: const EdgeInsets.symmetric(vertical: AppSpace.lg),
                  children: [
                    const ScreenHeader(title: 'Habits'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          AppSpace.xl, 0, AppSpace.xl, AppSpace.xl),
                      child: BlockCard(
                        child: Column(
                          children: [
                            for (final habit in list) HabitListTile(habit: habit),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _EmptyHabits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return ListView(
      padding: const EdgeInsets.all(AppSpace.xl),
      children: [
        const ScreenHeader(title: 'Habits'),
        const SizedBox(height: AppSpace.xxl),
        Center(
          child: Column(
            children: [
              Icon(Icons.check_circle_outline,
                  size: 44, color: tokens.textDisabled),
              const SizedBox(height: AppSpace.md),
              Text(
                'No habits yet — add your first habit.',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: tokens.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}