import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/device_pace.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/models/habit.dart';
import 'package:personalos/features/habits/habit_detail_sheet.dart';
import 'package:personalos/features/habits/habit_edit_sheet.dart';
import 'package:personalos/features/habits/habits_providers.dart';
import 'package:personalos/services/growth/growth_stage.dart';
import 'package:personalos/widgets/animated_widgets.dart';
import 'package:personalos/widgets/core_widgets.dart';
import 'package:personalos/widgets/heartwood_icon.dart';

class HabitsScreen extends ConsumerStatefulWidget {
  const HabitsScreen({super.key});

  static HabitsScreenState? of(BuildContext context) {
    return context.findAncestorStateOfType<HabitsScreenState>();
  }

  @override
  ConsumerState<HabitsScreen> createState() => HabitsScreenState();
}

class HabitsScreenState extends ConsumerState<HabitsScreen> {
  void plantHabit() {
    showHabitEditSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    final habits = ref.watch(habitsProvider).valueOrNull ?? [];
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ScreenHeader(
                  title: 'Habits',
                  action: PillButton(
                    label: 'New habit',
                    icon: HeartwoodIcon.plus,
                    onPressed: plantHabit,
                  ),
                ),
                const _StageLegend(),
                const SizedBox(height: 22),
                LayoutBuilder(
                  builder: (context, c) {
                    final mobile = c.maxWidth < 600;
                    // Reference card heights: desktop ≈178px (padding 22/20 +
                    // stage 52 + name + streak + 7 dots), mobile ≈103px
                    // (compact card: 36px stage, no dots). Cell widths give
                    // the exact childAspectRatio so cards match the mock.
                    final cols = c.maxWidth >= 900 ? 3 : 2;
                    final gap = mobile ? 10.0 : 16.0;
                    final cellW = (c.maxWidth - gap * (cols - 1)) / cols;
                    // Reference content: stage 52 + 6 + name + 3 + streak +
                    // 16 + dots 9 (+ padding 44) ≈ 170px desktop; compact
                    // card ≈ 106px.
                    final cellH = mobile ? 106.0 : 170.0;
                    return GridView.count(
                      crossAxisCount: cols,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: gap,
                      crossAxisSpacing: gap,
                      childAspectRatio: cellW / cellH,
                      children: [
                        for (final h in habits) _PlantCard(habit: h, mobile: mobile),
                        _AddCard(onTap: plantHabit, mobile: mobile),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StageLegend extends StatelessWidget {
  const _StageLegend();

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: tokens.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [BoxShadow(color: tokens.hairline, spreadRadius: 1)],
      ),
      // Mirrors `.stage-legend`: items min-width 84 with connector lines at
      // icon-center height. Connectors flex to fill; on very narrow screens
      // the row scrolls (never clipping the last stage).
      child: LayoutBuilder(
        builder: (context, c) {
          const itemW = 84.0;
          const minConn = 24.0;
          final available = (c.maxWidth - itemW * 8).clamp(minConn * 7, 10000.0);
          final conn = available / 7;
          final row = Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = growthStages.length - 1; i >= 0; i--) ...[
                if (i != growthStages.length - 1)
                  Container(
                    width: conn,
                    height: 1,
                    margin: const EdgeInsets.only(top: 19),
                    color: tokens.hairline,
                  ),
                SizedBox(
                  width: itemW,
                  child: _StageItem(stage: growthStages[i]),
                ),
              ],
            ],
          );
          if (c.maxWidth >= itemW * 8 + minConn * 7) return row;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: row,
          );
        },
      ),
    );
  }
}

class _StageItem extends StatelessWidget {
  final GrowthStage stage;

  const _StageItem({required this.stage});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final gold = stage.gold;
    final seed = stage.minStreak == 0;
    final bg = seed
        ? tokens.surfaceRaised
        : gold
            ? tokens.goldWash
            : tokens.accentWash;
    final fg = seed
        ? tokens.textTertiary
        : gold
            ? tokens.gold
            : tokens.accent;
    return Column(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
            boxShadow: gold
                ? [BoxShadow(color: tokens.goldWash, blurRadius: 0, spreadRadius: 3)]
                : null,
          ),
          alignment: Alignment.center,
          child: HeartwoodIconWidget(icon: stage.icon, size: 18, color: fg),
        ),
        const SizedBox(height: 7),
        Text(
          stage.name,
          style: TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w600,
            color: tokens.textTertiary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          _range(stage),
          style: TextStyle(
            fontFamily: 'JetBrainsMono',
            fontSize: 9,
            color: tokens.textTertiary.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  static String _range(GrowthStage s) {
    switch (s.minStreak) {
      case 0: return 'Day 0';
      case 1: return '1–2 days';
      case 3: return '3–6 days';
      case 7: return '7–13 days';
      case 14: return '14–29 days';
      case 30: return '30–59 days';
      case 60: return '60–119 days';
      default: return '120+ days';
    }
  }
}

class _PlantCard extends ConsumerWidget {
  final Habit habit;
  final bool mobile;

  const _PlantCard({required this.habit, this.mobile = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final streak = ref.watch(habitStreakProvider(habit.id)).valueOrNull ?? 0;
    final stage = stageFor(streak);
    final checkins = ref.watch(habitCheckinsProvider(habit.id)).valueOrNull ?? {};
    final row = sevenDayRow(checkins, DateTime.now());
    return HoverLift(
      borderRadius: BorderRadius.circular(mobile ? AppRadius.md : AppRadius.lg),
      child: InkWell(
        onTap: () => showHabitDetailSheet(context, habit),
        borderRadius:
            BorderRadius.circular(mobile ? AppRadius.md : AppRadius.lg),
        child: Container(
          padding: EdgeInsets.all(mobile ? 14 : 22),
          decoration: BoxDecoration(
            color: tokens.surface,
            borderRadius:
                BorderRadius.circular(mobile ? AppRadius.md : AppRadius.lg),
            boxShadow: [BoxShadow(color: tokens.hairline, spreadRadius: 1)],
          ),
          child: mobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _StageBadge(stage: stage, compact: true),
                    const SizedBox(height: 8),
                    Text(
                      habit.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: tokens.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      streak > 0
                          ? '$streak days'
                          : 'Freshly planted',
                      style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w600,
                        color: streak > 0 ? tokens.gold : tokens.textTertiary,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _StageBadge(stage: stage),
                        HeartwoodIconWidget(
                          icon: HeartwoodIcon.dots,
                          size: 15,
                          color: tokens.textTertiary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      habit.name,
                      style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontSize: 16,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                        color: tokens.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        HeartwoodIconWidget(
                          icon: HeartwoodIcon.goldLeaf,
                          size: 12,
                          color: streak > 0 ? tokens.gold : tokens.textTertiary,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          streak > 0
                              ? '$streak day streak${stage.gold ? ' · ${stage.name}' : ''}'
                              : 'Freshly planted',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: streak > 0 ? tokens.gold : tokens.textTertiary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        for (var i = 0; i < 7; i++)
                          Container(
                            width: 9,
                            height: 9,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: i == 6
                                  ? Colors.transparent
                                  : (row[i] ? tokens.accent : tokens.surfaceRaised),
                              shape: BoxShape.circle,
                              border: i == 6
                                  ? Border.all(color: tokens.accent, width: 1)
                                  : Border.all(
                                      color: row[i] ? tokens.accent : tokens.hairlineStrong,
                                    ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _StageBadge extends StatelessWidget {
  final GrowthStage stage;
  final bool compact;

  const _StageBadge({required this.stage, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final gold = stage.gold;
    final seed = stage.minStreak == 0;
    final bg = seed
        ? tokens.surfaceRaised
        : gold
            ? tokens.goldWash
            : tokens.accentWash;
    final fg = seed
        ? tokens.textTertiary
        : gold
            ? tokens.gold
            : tokens.accent;
    final d = compact ? 36.0 : 52.0;
    return Container(
      width: d,
      height: d,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(compact ? 10 : AppRadius.md),
        boxShadow: gold
            ? [
                BoxShadow(
                  color: tokens.goldWash,
                  spreadRadius: compact ? 2 : 3,
                  blurRadius: compact ? 8 : 12,
                ),
              ]
            : null,
      ),
      alignment: Alignment.center,
      child: HeartwoodIconWidget(
        icon: stage.icon,
        size: compact ? 18 : 26,
        color: fg,
      ),
    );
  }
}

class _AddCard extends StatefulWidget {
  final VoidCallback onTap;
  final bool mobile;

  const _AddCard({required this.onTap, this.mobile = false});

  @override
  State<_AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<_AddCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final accent = _hover;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(
            widget.mobile ? AppRadius.md : AppRadius.lg),
        child: AnimatedContainer(
          duration: DevicePace.durationForFrames(8),
          decoration: BoxDecoration(
            color: accent ? tokens.accentWash : null,
            borderRadius: BorderRadius.circular(
                widget.mobile ? AppRadius.md : AppRadius.lg),
          ),
          child: DashedBorder(
            color: accent ? tokens.accent : tokens.hairlineStrong,
            radius: widget.mobile ? AppRadius.md : AppRadius.lg,
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeartwoodIconWidget(
                    icon: HeartwoodIcon.plus,
                    size: widget.mobile ? 18 : 22,
                    color: accent ? tokens.accent : tokens.textTertiary,
                  ),
                  SizedBox(height: widget.mobile ? 8 : 10),
                  Text(
                    'Plant a new habit',
                    style: TextStyle(
                      fontSize: widget.mobile ? 11.5 : 12.5,
                      fontWeight: FontWeight.w600,
                      color: accent ? tokens.accent : tokens.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}