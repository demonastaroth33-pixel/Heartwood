import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/models/habit.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/data/repositories/habit_repository.dart';
import 'package:personalos/features/habits/habits_providers.dart';
import 'package:personalos/features/journal/journal_compose_screen.dart';
import 'package:personalos/widgets/app_field.dart';
import 'package:personalos/widgets/block_card.dart';
import 'package:personalos/widgets/habit_dot_row.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          habits.when(
            loading: () => const SizedBox(
              height: 32,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => EmptyLine(text: 'Could not load habits: $e'),
            data: (list) => list.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(bottom: AppSpace.md),
                    child: EmptyLine(
                      text: 'No habits yet — add your first habit in the Habits tab.',
                    ),
                  )
                : Column(
                    children: list.map((habit) {
                      final checked =
                          done.valueOrNull?.contains(habit.id) == true;
                      return _TodayHabitRow(
                        habit: habit,
                        checked: checked,
                        onToggle: () => _checkIn(ref, habit.id),
                      );
                    }).toList(),
                  ),
          ),
          const SizedBox(height: AppSpace.md),
          _QuickCapture(onSubmit: () => _openCompose(context)),
        ],
      ),
    );
  }

  void _openCompose(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const JournalComposeScreen()),
    );
  }
}

class _TodayHabitRow extends ConsumerWidget {
  final Habit habit;
  final bool checked;
  final VoidCallback onToggle;

  const _TodayHabitRow({
    required this.habit,
    required this.checked,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streak = ref.watch(habitStreakProvider(habit.id)).valueOrNull ?? 0;
    return InkWell(
      onTap: onToggle,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpace.sm),
        child: Row(
          children: [
            _CheckCircle(checked: checked),
            const SizedBox(width: AppSpace.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(habit.name,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 2),
                  Text(
                    streak >= 3
                        ? '$streak day streak'
                        : streak > 0
                            ? '$streak day streak'
                            : 'Not logged today',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                          color: streak >= 3
                              ? Theme.of(context).extension<AppTokens>()!.gold
                              : null,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpace.sm),
            _SevenDots(habitId: habit.id, checked: checked),
          ],
        ),
      ),
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
      duration: const Duration(milliseconds: 200),
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
  final bool checked;

  const _SevenDots({required this.habitId, required this.checked});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(habitRepoProvider);
    return FutureBuilder<List<String>>(
      future: _last7(repo, habitId),
      builder: (context, snap) {
        final days = snap.data ?? [];
        final today = DateTime.now();
        final todayIndex = days.indexWhere(
            (d) => d == dayKey(DateTime(today.year, today.month, today.day)));
        final booleans = List.generate(7, (i) {
          if (i >= days.length) return false;
          final d = days[i];
          final dk = dayKey(today.subtract(Duration(days: 6 - i)));
          return d == dk;
        });
        if (todayIndex >= 0 && checked) booleans[6] = true;
        return HabitDotRow(days: booleans, todayIndex: 6);
      },
    );
  }

  Future<List<String>> _last7(HabitRepository repo, String habitId) async {
    final checkins = await repo.checkInsForHabit(habitId);
    final today = DateTime.now();
    final cutoff = dayKey(today.subtract(const Duration(days: 7)));
    return checkins
        .map((c) => c.dayKey)
        .where((d) => d.compareTo(cutoff) >= 0)
        .toList();
  }
}

class _QuickCapture extends ConsumerStatefulWidget {
  final VoidCallback onSubmit;

  const _QuickCapture({required this.onSubmit});

  @override
  ConsumerState<_QuickCapture> createState() => _QuickCaptureState();
}

class _QuickCaptureState extends ConsumerState<_QuickCapture> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return SizedBox(
      height: 48,
      child: AppField(
        controller: _controller,
        hint: 'What happened today?',
        onChanged: (v) => setState(() => _hasText = v.trim().isNotEmpty),
        trailing: _hasText
            ? IconButton(
                icon: Icon(Icons.arrow_forward, color: tokens.onAccent),
                style: IconButton.styleFrom(
                  backgroundColor: tokens.accent,
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  _controller.clear();
                  setState(() => _hasText = false);
                  widget.onSubmit();
                },
              )
            : null,
      ),
    );
  }
}