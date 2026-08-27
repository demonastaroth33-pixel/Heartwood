import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/models/habit.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/habits/habit_edit_sheet.dart';
import 'package:personalos/features/habits/habits_providers.dart';
import 'package:personalos/services/growth/growth_stage.dart';
import 'package:personalos/widgets/animated_widgets.dart';
import 'package:personalos/widgets/heartwood_icon.dart';

/// Habit detail — streak stats + last-30-days dot grid (G9). Desktop modal /
/// mobile sheet, one surface.
Future<void> showHabitDetailSheet(BuildContext context, Habit habit) {
  final desktop = MediaQuery.sizeOf(context).width >= 1040;
  if (desktop) {
    return showBlurDialog<void>(
      context: context,
      builder: (_) => _HabitDetailModal(habit: habit),
    );
  }
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).extension<AppTokens>()!.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (_) => _HabitDetailSheet(habit: habit),
  );
}

class _HabitDetailSheet extends ConsumerStatefulWidget {
  final Habit habit;

  const _HabitDetailSheet({required this.habit});

  @override
  ConsumerState<_HabitDetailSheet> createState() => _HabitDetailSheetState();
}

class _HabitDetailSheetState extends ConsumerState<_HabitDetailSheet> {
  @override
  Widget build(BuildContext context) {
    final streak = ref.watch(habitStreakProvider(widget.habit.id)).valueOrNull ?? 0;
    final stage = stageFor(streak);
    final checkins = ref.watch(habitCheckinsProvider(widget.habit.id)).valueOrNull ?? {};
    // Real last-30-days dots from actual check-ins (today at the right edge).
    final dots = List<bool>.generate(30, (i) {
      final d = DateTime.now().subtract(Duration(days: 29 - i));
      final key =
          '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
      return checkins.contains(key);
    });
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.75,
      maxChildSize: 0.92,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(24, 14, 24, 26),
          child: _DetailBody(
            habit: widget.habit,
            streak: streak,
            stage: stage,
            dots: dots,
          ),
        );
      },
    );
  }
}

/// Desktop: centered modal with blurred backdrop (mirrors `.habit-modal`).
class _HabitDetailModal extends ConsumerWidget {
  final Habit habit;

  const _HabitDetailModal({required this.habit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final streak = ref.watch(habitStreakProvider(habit.id)).valueOrNull ?? 0;
    final stage = stageFor(streak);
    final checkins = ref.watch(habitCheckinsProvider(habit.id)).valueOrNull ?? {};
    final dots = List<bool>.generate(30, (i) {
      final d = DateTime.now().subtract(Duration(days: 29 - i));
      final key =
          '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
      return checkins.contains(key);
    });
    return Dialog(
      backgroundColor: tokens.surface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        side: BorderSide(color: tokens.hairline),
      ),
      child: Container(
        width: 428,
        constraints: const BoxConstraints(maxHeight: 640),
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Habit',
                      style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFF1EFE2),
                      ),
                    ),
                  ),
                  HoverRotate(
                    size: 32,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: HeartwoodIconWidget(
                        icon: HeartwoodIcon.x,
                        size: 15,
                        color: tokens.textTertiary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: stage.gold
                          ? tokens.goldWash
                          : stage.minStreak == 0
                              ? tokens.surfaceRaised
                              : tokens.accentWash,
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    alignment: Alignment.center,
                    child: HeartwoodIconWidget(
                      icon: stage.icon,
                      size: 26,
                      color: stage.gold
                          ? tokens.gold
                          : stage.minStreak == 0
                              ? tokens.textTertiary
                              : tokens.accent,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          habit.name,
                          style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: tokens.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            HeartwoodIconWidget(
                              icon: HeartwoodIcon.leaf,
                              size: 12,
                              color: tokens.textTertiary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              habit.area == null
                                  ? 'No life area'
                                  : habit.area!.split('_').join(' '),
                              style: TextStyle(
                                fontSize: 12,
                                color: tokens.textTertiary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _Stat(
                      value: '$streak',
                      label: 'day streak',
                      mono: false,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _Stat(
                      value: stage.name,
                      label: 'stage',
                      mono: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: _Stat(value: 'Daily', label: 'cadence', mono: true),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'LAST 30 DAYS',
                style: TextStyle(
                  fontSize: 10.5,
                  letterSpacing: 0.09,
                  fontWeight: FontWeight.w700,
                  color: tokens.textTertiary,
                ),
              ),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                children: [
                  for (var i = 0; i < 30; i++)
                    Container(
                      decoration: BoxDecoration(
                        color: dots[i] ? tokens.accent : tokens.surfaceRaised,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: dots[i] ? tokens.accent : tokens.hairlineStrong,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _DetailArchiveButton(habit: habit),
                  _DetailEditButton(habit: habit),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailBody extends ConsumerWidget {
  final Habit habit;
  final int streak;
  final GrowthStage stage;
  final List<bool> dots;

  const _DetailBody({
    required this.habit,
    required this.streak,
    required this.stage,
    required this.dots,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              Container(
                width: 34,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: tokens.hairlineStrong,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Habit',
                      style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: tokens.textPrimary,
                      ),
                    ),
                  ),
                  HoverRotate(
                    size: 32,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: HeartwoodIconWidget(
                        icon: HeartwoodIcon.x,
                        size: 15,
                        color: tokens.textTertiary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: stage.gold
                          ? tokens.goldWash
                          : stage.minStreak == 0
                              ? tokens.surfaceRaised
                              : tokens.accentWash,
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    alignment: Alignment.center,
                    child: HeartwoodIconWidget(
                      icon: stage.icon,
                      size: 26,
                      color: stage.gold
                          ? tokens.gold
                          : stage.minStreak == 0
                              ? tokens.textTertiary
                              : tokens.accent,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          habit.name,
                          style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: tokens.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            HeartwoodIconWidget(
                              icon: HeartwoodIcon.leaf,
                              size: 12,
                              color: tokens.textTertiary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              habit.area == null
                                  ? 'No life area'
                                  : habit.area!.split('_').join(' '),
                              style: TextStyle(
                                fontSize: 12,
                                color: tokens.textTertiary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _Stat(
                      value: '$streak',
                      label: 'day streak',
                      mono: false,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _Stat(
                      value: stage.name,
                      label: 'stage',
                      mono: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: _Stat(value: 'Daily', label: 'cadence', mono: true),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'LAST 30 DAYS',
                style: TextStyle(
                  fontSize: 10.5,
                  letterSpacing: 0.09,
                  fontWeight: FontWeight.w700,
                  color: tokens.textTertiary,
                ),
              ),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                children: [
                  for (var i = 0; i < 30; i++)
                    Container(
                      decoration: BoxDecoration(
                        color: dots[i] ? tokens.accent : tokens.surfaceRaised,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: dots[i] ? tokens.accent : tokens.hairlineStrong,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _DetailArchiveButton(habit: habit),
                  _DetailEditButton(habit: habit),
                ],
              ),
      ],
    );
  }
}

class _DetailArchiveButton extends ConsumerWidget {
  final Habit habit;

  const _DetailArchiveButton({required this.habit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return GestureDetector(
      onTap: () async {
        await ref.read(habitRepoProvider).setActive(habit.id, false);
        ref.invalidate(habitsProvider);
        if (context.mounted) Navigator.of(context).pop();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: tokens.rustWash,
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Row(
          children: [
            HeartwoodIconWidget(
              icon: HeartwoodIcon.x,
              size: 13,
              color: tokens.rust,
            ),
            const SizedBox(width: 6),
            Text(
              'Archive',
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: tokens.rust,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  final bool mono;

  const _Stat({required this.value, required this.label, required this.mono});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: tokens.surfaceRaised,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              fontFamily: mono ? 'JetBrainsMono' : 'Fraunces',
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: tokens.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 0.08,
              fontWeight: FontWeight.w700,
              color: tokens.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailEditButton extends StatelessWidget {
  final Habit habit;

  const _DetailEditButton({required this.habit});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        // Edit via the same creation surface, prefilled.
        final ctx = context;
        Future.microtask(() {
          if (ctx.mounted) showHabitEditFrom(ctx, habit);
        });
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: tokens.surfaceRaised,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(color: tokens.hairlineStrong),
        ),
        alignment: Alignment.center,
        child: Text(
          'Edit',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: tokens.textPrimary,
          ),
        ),
      ),
    );
  }
}