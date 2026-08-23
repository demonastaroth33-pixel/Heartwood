import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/models/habit.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/habits/habits_providers.dart';
import 'package:personalos/widgets/habit_dot_row.dart';

class HabitListTile extends ConsumerStatefulWidget {
  final Habit habit;

  const HabitListTile({super.key, required this.habit});

  @override
  ConsumerState<HabitListTile> createState() => _HabitListTileState();
}

class _HabitListTileState extends ConsumerState<HabitListTile> {
  bool _expanded = false;

  Future<void> _checkIn(WidgetRef ref) async {
    await ref.read(habitRepoProvider).checkIn(widget.habit.id);
    await refreshHabitState(ref, widget.habit.id);
  }

  Future<void> _archive(WidgetRef ref) async {
    await ref.read(habitRepoProvider).setActive(widget.habit.id, false);
    await refreshHabits(ref);
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final streak = ref.watch(habitStreakProvider(widget.habit.id)).valueOrNull ?? 0;
    final todayDone = ref.watch(todayCheckinsProvider).valueOrNull
            ?.contains(widget.habit.id) ??
        false;
    final streakLine = streak == 0
        ? 'Not logged today'
        : streak == 1
            ? '1-day streak'
            : '$streak-day streak';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpace.sm),
          child: Row(
            children: [
              InkWell(
                key: const Key('check-habit'),
                onTap: () => _checkIn(ref),
                child: _CheckCircle(checked: todayDone),
              ),
              const SizedBox(width: AppSpace.md),
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => _expanded = !_expanded),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.habit.name,
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 2),
                      Text(
                        streakLine,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                              color: streak >= 3
                                  ? tokens.gold
                                  : tokens.textSecondary,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: AppSpace.sm),
              _SevenDots(habitId: widget.habit.id),
              const SizedBox(width: AppSpace.xs),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, size: 18, color: tokens.textSecondary),
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
        AnimatedCrossFade(
          firstChild: const SizedBox(width: double.infinity, height: 0),
          secondChild: _ThirtyDayGrid(habitId: widget.habit.id),
          crossFadeState:
              _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: AppMotion.fast,
          sizeCurve: Curves.easeOut,
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: tokens.hairline.withValues(alpha: 0.5),
        ),
      ],
    );
  }
}

class _CheckCircle extends StatelessWidget {
  final bool checked;

  const _CheckCircle({required this.checked});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return AnimatedContainer(
      duration: AppMotion.instant,
      curve: Curves.easeOut,
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: checked ? tokens.accent : Colors.transparent,
        border: Border.all(
          color: checked ? tokens.accent : tokens.hairline,
          width: 1.5,
        ),
      ),
      child: checked
          ? Icon(Icons.check, size: 18, color: tokens.onAccent)
          : null,
    );
  }
}

class _SevenDots extends ConsumerWidget {
  final String habitId;

  const _SevenDots({required this.habitId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(habitRepoProvider);
    return FutureBuilder<List<String>>(
      future: _lastDays(repo, habitId, 7),
      builder: (context, snap) {
        final days = snap.data ?? [];
        final today = DateTime.now();
        final booleans = List.generate(7, (i) {
          final dk = dayKey(today.subtract(Duration(days: 6 - i)));
          return days.contains(dk);
        });
        return HabitDotRow(days: booleans, todayIndex: 6);
      },
    );
  }

  Future<List<String>> _lastDays(dynamic repo, String habitId, int n) async {
    final checkins = await repo.checkInsForHabit(habitId);
    final today = DateTime.now();
    final cutoff = dayKey(today.subtract(Duration(days: n)));
    return checkins.map((c) => c.dayKey).where((d) => d.compareTo(cutoff) >= 0).toList();
  }
}

class _ThirtyDayGrid extends ConsumerWidget {
  final String habitId;

  const _ThirtyDayGrid({required this.habitId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final repo = ref.watch(habitRepoProvider);
    return FutureBuilder<List<String>>(
      future: _lastDays(repo, habitId, 30),
      builder: (context, snap) {
        final days = snap.data ?? [];
        final today = DateTime.now();
        return Padding(
          padding: const EdgeInsets.only(left: 44 + AppSpace.md, bottom: AppSpace.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last 30 days',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: tokens.textSecondary),
              ),
              const SizedBox(height: AppSpace.sm),
              Wrap(
                spacing: AppSpace.sm,
                runSpacing: AppSpace.sm,
                children: List.generate(30, (i) {
                  final d = today.subtract(Duration(days: 29 - i));
                  final dk = dayKey(d);
                  final done = days.contains(dk);
                  final isToday = i == 29;
                  return Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isToday
                          ? Colors.transparent
                          : (done ? tokens.accent : tokens.hairline),
                      border: isToday
                          ? Border.all(color: tokens.accent, width: 1.5)
                          : null,
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<List<String>> _lastDays(dynamic repo, String habitId, int n) async {
    final checkins = await repo.checkInsForHabit(habitId);
    final today = DateTime.now();
    final cutoff = dayKey(today.subtract(Duration(days: n)));
    return checkins.map((c) => c.dayKey).where((d) => d.compareTo(cutoff) >= 0).toList();
  }
}