import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/app_boot.dart';
import 'package:personalos/core/device_pace.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/dashboard/dashboard_providers.dart';
import 'package:personalos/features/habits/habits_providers.dart';
import 'package:personalos/features/journal/journal_compose_screen.dart';
import 'package:personalos/widgets/animated_widgets.dart';
import 'package:personalos/widgets/core_widgets.dart';
import 'package:personalos/widgets/heartwood_icon.dart';
import 'package:personalos/widgets/nav_shell.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // RepaintBoundary lets CanvasKit cache the static dashboard scene
    // between frames (only the animated bits re-rasterize) — a large win on
    // weak GPUs where every full-scene redraw costs 100ms+.
    return RepaintBoundary(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 80),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1180),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Reveal(delay: Duration(milliseconds: 50), child: _Hero()),
                  const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, c) {
                      final twoCol = c.maxWidth >= 900;
                      if (twoCol) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 155,
                              child: Column(
                                children: const [
                                  Reveal(
                                      delay: Duration(milliseconds: 110),
                                      child: _TodayCard()),
                                  SizedBox(height: 22),
                                  Reveal(
                                      delay: Duration(milliseconds: 170),
                                      child: CoachNoteCard()),
                                  SizedBox(height: 22),
                                  Reveal(
                                      delay: Duration(milliseconds: 230),
                                      child: GoalsTasksCard()),
                                ],
                              ),
                            ),
                            const SizedBox(width: 22),
                            const Expanded(
                              flex: 100,
                              child: Column(
                                children: [
                                  Reveal(
                                      delay: Duration(milliseconds: 170),
                                      child: StreakRingCard()),
                                  SizedBox(height: 22),
                                  Reveal(
                                      delay: Duration(milliseconds: 290),
                                      child: StorageCard()),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return Column(
                        children: const [
                          Reveal(
                              delay: Duration(milliseconds: 110),
                              child: _TodayCard()),
                          SizedBox(height: 22),
                          Reveal(
                              delay: Duration(milliseconds: 170),
                              child: CoachNoteCard()),
                          SizedBox(height: 22),
                          Reveal(
                              delay: Duration(milliseconds: 230),
                              child: GoalsTasksCard()),
                          SizedBox(height: 22),
                          Reveal(
                              delay: Duration(milliseconds: 290),
                              child: StreakRingCard()),
                          SizedBox(height: 22),
                          Reveal(
                              delay: Duration(milliseconds: 350),
                              child: StorageCard()),
                        ],
                      );
                    },
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

/// Flat hero — no photography (per spec): surface gradient, wobbly growth
/// rings decoration, eyebrow date, Fraunces greeting, date line with REAL
/// day count / habits due / archive size.
class _Hero extends ConsumerWidget {
  const _Hero();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final now = DateTime.now();
    final dateStr = _formatDate(now);
    final dayCount = ref.watch(daysInHeartwoodProvider).valueOrNull ?? 1;
    final due = ref.watch(habitsDueProvider).valueOrNull ?? 0;
    final archived = ref.watch(archiveBytesProvider).valueOrNull ?? 0;
    final mobile = MediaQuery.sizeOf(context).width < 600;
    final ringsW = mobile ? 250.0 : 330.0;
    return Container(
      margin: EdgeInsets.only(top: mobile ? 6 : 32),
      constraints: BoxConstraints(minHeight: mobile ? 130 : 210),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            tokens.surfaceRaised,
            tokens.surface,
          ],
        ),
        borderRadius: BorderRadius.circular(mobile ? AppRadius.lg : AppRadius.xl),
        boxShadow: [BoxShadow(color: tokens.hairline, spreadRadius: 1)],
      ),
      // The rings Positioned is relative to the hero's OUTER box (like the
      // mock's absolute right:-118px top:-128px), so the Stack fills the
      // hero and the content carries the padding.
      child: Stack(
        children: [
          Positioned(
            right: mobile ? -84 : -118,
            top: mobile ? -96 : -128,
            child: SizedBox(
              width: ringsW,
              height: ringsW,
              child: _BreatheRings(child: CustomPaint(painter: _RingsPainter(tokens))),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mobile ? 20 : 44,
              vertical: mobile ? 26 : 52,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Eyebrow(text: mobile ? _shortDate(now) : dateStr, color: tokens.accent),
              const SizedBox(height: 8),
              Text(
                mobile ? 'Morning, Rae.' : 'Good morning, Rae.',
                style: TextStyle(
                  fontFamily: 'Fraunces',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  fontSize: mobile ? 24 : 40,
                  height: 1.1,
                  color: tokens.paper,
                ),
              ),
              const SizedBox(height: 6),
              LayoutBuilder(
                builder: (context, c) {
                  final narrow2 = c.maxWidth < 420;
                  final items = narrow2 || mobile
                      ? <String>[
                          'Day $dayCount · $due ${due == 1 ? 'habit' : 'habits'} due'
                        ]
                      : <String>[
                          'Day $dayCount in Heartwood',
                          '$due ${due == 1 ? 'habit' : 'habits'} due',
                          '${_formatBytes(archived)} archived',
                        ];
                  return Wrap(
                    spacing: 10,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      for (var i = 0; i < items.length; i++) ...[
                        if (i > 0)
                          Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: tokens.accent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        Text(
                          items[i],
                          style: TextStyle(
                            fontSize: mobile ? 11.5 : (narrow2 ? 11.5 : 13.5),
                            color: tokens.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ],
            ),
          ),
        ],
      ),
    );
  }

  static String _formatDate(DateTime d) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    const weekdays = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday',
    ];
    return '${weekdays[d.weekday - 1]}, ${months[d.month - 1]} ${d.day}';
  }

  /// "Sat, Aug 22" — the mobile eyebrow per the mock.
  static String _shortDate(DateTime d) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return '${weekdays[d.weekday - 1]}, ${months[d.month - 1]} ${d.day}';
  }

  /// "1.2 GB" / "840 MB" — matches the mock's archive figures.
  static String _formatBytes(int bytes) {
    const mb = 1048576;
    const gb = 1073741824;
    if (bytes >= gb) {
      return '${(bytes / gb).toStringAsFixed(1).replaceAll('.0', '')} GB';
    }
    return '${(bytes / mb).toStringAsFixed(0)} MB';
  }
}

/// Slow scale+rotate "breathe" on the rings — mirrors `.hero-rings`
/// `ringsBreathe`. Runs as a ONE-SHOT settle: CanvasKit re-rasterizes the
/// whole frame on every animation tick, so an infinite loop pins weak GPUs
/// at a few FPS (every other animation stops visibly rendering). A single
/// settle gives the same effect without the constant redraws.
class _BreatheRings extends StatefulWidget {
  final Widget child;

  const _BreatheRings({required this.child});

  @override
  State<_BreatheRings> createState() => _BreatheRingsState();
}

class _BreatheRingsState extends State<_BreatheRings>
    with SingleTickerProviderStateMixin {
  // One-shot 5s settle (long enough to read as the mock's "breathe" on slow
  // displays; no infinite loop — that pinned weak GPUs at a few fps).
  late final PacedAnimation _c =
      PacedAnimation(vsync: this, targetFrames: 50);

  @override
  void initState() {
    super.initState();
    if (AppBoot.complete.value) {
      _c.forward();
    } else {
      AppBoot.complete.addListener(_onBoot);
    }
  }

  void _onBoot() {
    if (!AppBoot.complete.value) return;
    AppBoot.complete.removeListener(_onBoot);
    if (mounted) _c.forward();
  }

  @override
  void dispose() {
    AppBoot.complete.removeListener(_onBoot);
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, child) {
          final t = Curves.easeInOut.transform(_c.value);
          return Transform.scale(
            scale: 1 + 0.035 * t,
            alignment: const Alignment(0.24, 0.16),
            child: Transform.rotate(
              angle: 1.4 * math.pi / 180 * t,
              alignment: const Alignment(0.24, 0.16),
              child: child,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}

/// Wobbly tree-ring paths + one sprout — the organic hero decoration.
class _RingsPainter extends CustomPainter {
  final AppTokens tokens;

  _RingsPainter(this.tokens);

  @override
  void paint(Canvas canvas, Size size) {
    // The reference viewBox is 320×320 with ring center at (162, 148) —
    // slightly up-right of the box center; keep that offset.
    final scale = size.width / 320.0;
    final cx = 162.0 * scale;
    final cy = 148.0 * scale;
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1 * scale
      ..strokeJoin = StrokeJoin.round
      ..color = tokens.hairlineStrong;
    var seed = 11;
    double rnd() {
      seed = (seed * 16807) % 2147483647;
      return seed / 2147483647;
    }

    final radii = [50.0, 84.0, 120.0, 156.0];
    final opacities = [0.55, 0.42, 0.30, 0.20];
    // The reference paints hairline-strong (alpha .14) and multiplies each
    // ring's stroke-opacity on top — rings are intentionally very faint.
    final baseAlpha = tokens.hairlineStrong.a;
    Offset? sproutAt;
    for (var ri = 0; ri < radii.length; ri++) {
      const n = 18;
      final pts = <Offset>[];
      var drift = (rnd() - 0.5) * 2.4;
      for (var i = 0; i < n; i++) {
        drift += (rnd() - 0.5) * 2.6;
        drift *= 0.76;
        final a = (i / n) * math.pi * 2;
        final rad = math.max(radii[ri] * 0.92, radii[ri] + drift);
        pts.add(Offset(cx + rad * scale * math.cos(a), cy + rad * scale * math.sin(a)));
      }
      if (ri == 1) sproutAt = pts[7];
      final path = Path();
      path.moveTo(pts[0].dx, pts[0].dy);
      for (var i = 0; i < n; i++) {
        final p0 = pts[(i - 1 + n) % n];
        final p1 = pts[i];
        final p2 = pts[(i + 1) % n];
        final p3 = pts[(i + 2) % n];
        path.cubicTo(
          p1.dx + (p2.dx - p0.dx) / 6,
          p1.dy + (p2.dy - p0.dy) / 6,
          p2.dx - (p3.dx - p1.dx) / 6,
          p2.dy - (p3.dy - p1.dy) / 6,
          p2.dx,
          p2.dy,
        );
      }
      path.close();
      stroke.color = tokens.hairlineStrong.withValues(alpha: baseAlpha * opacities[ri]);
      canvas.drawPath(path, stroke);
    }
    stroke.color = tokens.hairlineStrong.withValues(alpha: baseAlpha * 0.32);
    canvas.drawCircle(Offset(cx, cy), 2.2 * scale, stroke..style = PaintingStyle.fill);
    if (sproutAt != null) {
      // The mock's hero sprout: a fixed 26px ic-sprout glyph (viewBox 24)
      // placed at (-13,-26) inside a group translated to the ring point and
      // rotated -38°, accent at 60%.
      canvas.save();
      canvas.translate(sproutAt.dx, sproutAt.dy);
      canvas.rotate(-38 * math.pi / 180);
      canvas.translate(-13, -26);
      final sproutScale = 26 / 24;
      canvas.scale(sproutScale, sproutScale);
      final sprout = Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = 1.6
        ..color = tokens.accent.withValues(alpha: 0.6);
      canvas.drawPath(svgPath('M12 21V11'), sprout);
      canvas.drawPath(svgPath('M12 12C12 8 9 6 5 6c0 4 3 7 7 7Z'), sprout);
      canvas.drawPath(svgPath('M12 9c0-3 2.5-5 6-5 0 3.5-2.5 5.5-6 5.5'), sprout);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_RingsPainter old) => old.tokens != tokens;
}

class _TodayCard extends ConsumerWidget {
  const _TodayCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitsProvider).valueOrNull ?? [];
    final done = ref.watch(todayCheckinsProvider).valueOrNull ?? {};
    final tokens = Theme.of(context).extension<AppTokens>()!;
    const cap = 4;
    final shown = habits.take(cap).toList();
    final overflow = habits.length - shown.length;
    void goHabits() => NavShell.goTo(context, 2);
    return BlockCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitleRow(
            title: 'Today',
            linkLabel: 'All habits',
            onLink: goHabits,
          ),
          const _QuickCapture(),
          const SizedBox(height: 22),
          for (var i = 0; i < shown.length; i++)
            _HabitRow(
              habit: shown[i],
              checked: done.contains(shown[i].id),
              last: i == shown.length - 1 && overflow == 0,
            ),
          if (overflow > 0)
            InkWell(
              onTap: goHabits,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$overflow more habits due today',
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color: tokens.accent,
                        ),
                      ),
                      const SizedBox(width: 8),
                      HeartwoodIconWidget(
                        icon: HeartwoodIcon.chevron,
                        size: 13,
                        color: tokens.accent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _QuickCapture extends ConsumerStatefulWidget {
  const _QuickCapture();

  @override
  ConsumerState<_QuickCapture> createState() => _QuickCaptureState();
}

class _QuickCaptureState extends ConsumerState<_QuickCapture> {
  void _openCompose() {
    FocusScope.of(context).unfocus();
    openComposeOverlay(context);
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    // Mirrors `.quick-capture`: pill with the hint as plain centered text —
    // no TextField chrome to misalign.
    return GestureDetector(
      onTap: _openCompose,
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 20, right: 8),
        decoration: BoxDecoration(
          color: tokens.surfaceRaised,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(color: tokens.hairline),
        ),
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What happened today?',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.5,
                    color: tokens.textTertiary,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            _QuickCaptureButton(onTap: _openCompose),
          ],
        ),
      ),
    );
  }
}

class _QuickCaptureButton extends StatefulWidget {
  final VoidCallback onTap;

  const _QuickCaptureButton({required this.onTap});

  @override
  State<_QuickCaptureButton> createState() => _QuickCaptureButtonState();
}

class _QuickCaptureButtonState extends State<_QuickCaptureButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hover ? 1.07 : 1.0,
          duration: DevicePace.durationForFrames(8),
          curve: AppMotion.standard,
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: tokens.accent,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: HeartwoodIconWidget(
              icon: HeartwoodIcon.plus,
              size: 16,
              color: tokens.accentInk,
            ),
          ),
        ),
      ),
    );
  }
}

class _HabitRow extends ConsumerWidget {
  final dynamic habit;
  final bool checked;
  final bool last;

  const _HabitRow({required this.habit, required this.checked, this.last = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    // Compact variant mirrors the mock's mobile habit rows below the rail
    // breakpoint (26px circle / 12px tick / "74d"); desktop stays 32/15.
    final compact = MediaQuery.sizeOf(context).width < 1040;
    final streak =
        ref.watch(habitStreakProvider(habit.id)).valueOrNull ?? 0;
    return InkWell(
      onTap: () async {
        // Toggle: tick when unchecked, untick when already checked today.
        final repo = ref.read(habitRepoProvider);
        if (checked) {
          await repo.uncheckIn(habit.id);
        } else {
          await repo.checkIn(habit.id);
        }
        ref.invalidate(habitStreakProvider(habit.id));
        ref.invalidate(todayCheckinsProvider);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: compact ? 10 : 11),
        decoration: BoxDecoration(
          border: last
              ? null
              : Border(bottom: BorderSide(color: tokens.hairline)),
        ),
        child: Row(
          children: [
            _CheckCircle(checked: checked, compact: compact),
            SizedBox(width: compact ? 12 : 14),
            Expanded(
              child: Text(
                habit.name as String,
                style: TextStyle(
                  fontSize: compact ? 13.5 : 14.5,
                  fontWeight: FontWeight.w500,
                  color: tokens.textPrimary,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!compact) ...[
                  HeartwoodIconWidget(
                    icon: HeartwoodIcon.goldLeaf,
                    size: 12,
                    color: checked ? tokens.gold : tokens.textTertiary,
                  ),
                  const SizedBox(width: 4),
                ],
                Text(
                  _streakLabel(checked, streak, compact),
                  style: TextStyle(
                    fontSize: compact ? 11 : 12,
                    color: checked ? tokens.gold : tokens.textTertiary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Mobile variant mirrors the mock: "74d" gold when checked, "—" otherwise.
  static String _streakLabel(bool checked, int streak, bool compact) {
    if (checked && streak > 0) {
      return compact ? '${streak}d' : '$streak days';
    }
    return compact ? '—' : 'Not yet today';
  }
}

class _CheckCircle extends StatefulWidget {
  final bool checked;
  final bool compact;

  const _CheckCircle({required this.checked, this.compact = false});

  @override
  State<_CheckCircle> createState() => _CheckCircleState();
}

class _CheckCircleState extends State<_CheckCircle> {
  bool _spark = false;

  @override
  void didUpdateWidget(_CheckCircle old) {
    super.didUpdateWidget(old);
    if (!old.checked && widget.checked) {
      setState(() => _spark = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final d = widget.compact ? 26.0 : 32.0;
    return SizedBox(
      width: d,
      height: d,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PopScale(
            active: widget.checked,
            child: AnimatedContainer(
              duration: DevicePace.durationForFrames(8),
              curve: AppMotion.standard,
              width: d,
              height: d,
              decoration: BoxDecoration(
                color: widget.checked ? tokens.accent : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.checked ? tokens.accent : tokens.hairlineStrong,
                  width: 1.5,
                ),
              ),
              child: widget.checked
                  ? HeartwoodIconWidget(
                      icon: HeartwoodIcon.check,
                      size: widget.compact ? 9 : 11,
                      strokeWidth: 1.5,
                      color: tokens.accentInk,
                    )
                  : null,
            ),
          ),
          if (_spark)
            CheckSpark(onDone: () => setState(() => _spark = false)),
        ],
      ),
    );
  }
}

class CoachNoteCard extends ConsumerStatefulWidget {
  const CoachNoteCard({super.key});

  @override
  ConsumerState<CoachNoteCard> createState() => _CoachNoteCardState();
}

class _CoachNoteCardState extends ConsumerState<CoachNoteCard> {
  bool _dismissed = false;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final output = ref.watch(coachTodayProvider).valueOrNull;
    final neutral = _dismissed || output == null;
    final text = neutral
        ? 'Day on track — nothing needs attention right now.'
        : output.payload;
    return BlockCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
            child: CardTitleRow(title: 'Coach'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [tokens.surfaceRaised, tokens.surface],
                ),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: tokens.hairline),
              ),
              child: Stack(
                children: [
                  AnimatedSwitcher(
                    duration: DevicePace.durationForFrames(8),
                    child: Column(
                      key: ValueKey(neutral),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: tokens.accentWash,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: HeartwoodIconWidget(
                            icon: HeartwoodIcon.sprout,
                            size: 15,
                            color: tokens.accent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          text,
                          style: TextStyle(
                            fontSize: 13.5,
                            height: 1.65,
                            color: tokens.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!neutral)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: HoverRotate(
                        size: 26,
                        child: GestureDetector(
                          onTap: () => setState(() => _dismissed = true),
                          child: HeartwoodIconWidget(
                            icon: HeartwoodIcon.x,
                            size: 13,
                            color: tokens.textTertiary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GoalsTasksCard extends StatelessWidget {
  const GoalsTasksCard({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return BlockCard(
      child: Column(
        children: [
          CardTitleRow(title: 'Goals & tasks'),
          LayoutBuilder(
            builder: (context, c) {
              final narrow = c.maxWidth < 380;
              final label = Text(
                'No goals tracked yet',
                style: TextStyle(fontSize: 13.5, color: tokens.textTertiary),
              );
              final action = const PillButton(label: 'Add a goal', ghost: true, height: 34);
              if (narrow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    label,
                    const SizedBox(height: 12),
                    action,
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  label,
                  PillButton(
                    label: 'Add a goal',
                    ghost: true,
                    height: 34,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: tokens.surfaceRaised,
                          content: Text(
                            'Goals arrive in a later milestone.',
                            style: TextStyle(color: tokens.textPrimary),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class StreakRingCard extends ConsumerStatefulWidget {
  const StreakRingCard({super.key});

  @override
  ConsumerState<StreakRingCard> createState() => _StreakRingCardState();
}

class _StreakRingCardState extends ConsumerState<StreakRingCard>
    with SingleTickerProviderStateMixin {
  // Frame-count-paced: spans 30 rendered frames (live-adapting via
  // PacedAnimation).
  late final PacedAnimation _c =
      PacedAnimation(vsync: this, targetFrames: 30);

  @override
  void initState() {
    super.initState();
    // Gated on the boot clock so the draw-in plays after the splash fades,
    // with the mock's .2s delay on top.
    void go() {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) _c.forward();
      });
    }

    if (AppBoot.complete.value) {
      go();
    } else {
      AppBoot.complete.addListener(_onBoot);
    }
  }

  void _onBoot() {
    if (!AppBoot.complete.value) return;
    AppBoot.complete.removeListener(_onBoot);
    if (mounted) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) _c.forward();
      });
    }
  }

  @override
  void dispose() {
    AppBoot.complete.removeListener(_onBoot);
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final summary = ref.watch(streakSummaryProvider).valueOrNull;
    final best = summary?.best ?? 0;
    final next = summary?.nextRing ?? 0;
    final fraction = summary?.fraction ?? 0;
    return BlockCard(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Streak',
              style: TextStyle(
                fontFamily: 'Fraunces',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: tokens.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 18),
          RepaintBoundary(
            child: SizedBox(
              width: 172,
              height: 172,
              child: AnimatedBuilder(
                animation: _c,
                builder: (context, _) => CustomPaint(
                  painter: _RingPainter(
                    track: tokens.hairline,
                    mid: tokens.accentWashStrong,
                    fill: tokens.gold,
                    progress: fraction * AppMotion.emphasis.transform(_c.value),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$best',
                          style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 38,
                            fontWeight: FontWeight.w500,
                            height: 1,
                            color: tokens.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'DAY STREAK',
                          style: TextStyle(
                            fontSize: 11,
                            letterSpacing: 0.06,
                            color: tokens.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text.rich(
            _footSpans(best, next),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.5, height: 1.5, color: tokens.textSecondary),
          ),
        ],
      ),
    );
  }

  /// Longest-ring line + days-to-next-ring line, with the figure in gold.
  static TextSpan _footSpans(int best, int next) {
    if (best <= 0) {
      return const TextSpan(
          text: 'No streaks yet — plant a habit and check in daily.');
    }
    if (next <= best) {
      return TextSpan(children: [
        const TextSpan(text: 'Longest ring this season: '),
        TextSpan(
          text: '$best days',
          style: const TextStyle(color: Color(0xFFE3B15D), fontWeight: FontWeight.w700),
        ),
        const TextSpan(
            text: '\nYou\'ve reached Heartwood — every day is a ring.'),
      ]);
    }
    final left = next - best;
    final when = switch (left) {
      1 => 'One more day to your next ring.',
      2 => 'Two more days to your next ring.',
      _ => '$left days to your next ring.',
    };
    return TextSpan(children: [
      const TextSpan(text: 'Longest ring this season: '),
      TextSpan(
        text: '$best days',
        style: const TextStyle(color: Color(0xFFE3B15D), fontWeight: FontWeight.w700),
      ),
      TextSpan(text: '\n$when'),
    ]);
  }
}

class _RingPainter extends CustomPainter {
  final Color track;
  final Color mid;
  final Color fill;
  final double progress;

  _RingPainter({required this.track, required this.mid, required this.fill, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2 - 7;
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(-math.pi / 2);
    canvas.translate(-center.dx, -center.dy);
    final trackP = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..color = track;
    canvas.drawCircle(center, r, trackP);
    // Dashed mid ring — mirrors `.ring-mid` (stroke-dasharray 2 6).
    final midP = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = mid;
    final midR = r * 0.76;
    final dash = 2.0;
    final gap = 6.0;
    final total = 2 * math.pi * midR;
    final n = (total / (dash + gap)).floor();
    for (var i = 0; i < n; i++) {
      final start = (i * (dash + gap)) / midR;
      final sweep = (dash / midR).clamp(0.0, math.pi * 2);
      canvas.drawArc(Rect.fromCircle(center: center, radius: midR), start, sweep, false, midP);
    }
    final fillP = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..color = fill;
    final arc = Rect.fromCircle(center: center, radius: r);
    canvas.drawArc(arc, 0, 2 * math.pi * progress, false, fillP);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.progress != progress || old.track != track;
}

class StorageCard extends ConsumerStatefulWidget {
  const StorageCard({super.key});

  @override
  ConsumerState<StorageCard> createState() => _StorageCardState();
}

class _StorageCardState extends ConsumerState<StorageCard>
    with SingleTickerProviderStateMixin {
  // Frame-count-paced: spans 20 rendered frames (live-adapting).
  late final PacedAnimation _c =
      PacedAnimation(vsync: this, targetFrames: 20);

  @override
  void initState() {
    super.initState();
    void go() {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) _c.forward();
      });
    }

    if (AppBoot.complete.value) {
      go();
    } else {
      AppBoot.complete.addListener(_onBoot);
    }
  }

  void _onBoot() {
    if (!AppBoot.complete.value) return;
    AppBoot.complete.removeListener(_onBoot);
    if (mounted) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) _c.forward();
      });
    }
  }

  @override
  void dispose() {
    AppBoot.complete.removeListener(_onBoot);
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final data = ref.watch(storageMeterProvider).valueOrNull;
    final quota = data?.quotaBytes ?? 0;
    final used = data?.usedBytes ?? 0;
    final fraction = quota <= 0 ? 0.0 : (used / quota).clamp(0.0, 1.0);
    final pct = fraction * 100;
    final warn = pct >= 90;
    final mid = pct >= 70;
    return BlockCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'STORAGE',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 0.08,
                  fontWeight: FontWeight.w600,
                  color: tokens.textTertiary,
                ),
              ),
              Text(
                '${_gb(used)} / ${_gb(quota)} GB',
                style: TextStyle(
                  fontFamily: 'JetBrainsMono',
                  fontSize: 12.5,
                  color: tokens.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          RepaintBoundary(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.md),
              child: SizedBox(
                height: 10,
                child: Stack(
                  children: [
                    Container(color: tokens.surfaceRaised),
                    AnimatedBuilder(
                      animation: _c,
                      builder: (context, _) => FractionallySizedBox(
                        widthFactor: fraction * Curves.easeInOut.transform(_c.value),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: warn
                                  ? [const Color(0xFF9A4A2E), tokens.rust]
                                  : mid
                                      ? [tokens.goldDeep, tokens.gold]
                                      : [tokens.accentDeep, tokens.accent],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (mid || warn) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                HeartwoodIconWidget(
                  icon: HeartwoodIcon.warn,
                  size: 14,
                  color: warn ? tokens.rust : tokens.gold,
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Text(
                    warn
                        ? 'Storage nearly full — export a backup and offload media soon.'
                        : 'Approaching your storage limit — exports keep you safe.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: warn ? tokens.rust : tokens.gold,
                    ),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Tick(), _Tick(), _Tick(), _Tick(), _Tick(),
              _Tick(), _Tick(), _Tick(), _Tick(),
            ],
          ),
        ],
      ),
    );
  }

  static String _gb(int bytes) {
    final gb = bytes / 1073741824;
    return gb.toStringAsFixed(1).replaceAll('.0', '');
  }
}

class _Tick extends StatelessWidget {
  const _Tick();

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      width: 1,
      height: 5,
      color: tokens.hairlineStrong,
    );
  }
}