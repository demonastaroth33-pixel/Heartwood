import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../core/device_pace.dart';
import '../core/theme/tokens.dart';
import '../features/dashboard/dashboard_screen.dart';
import '../features/habits/habits_screen.dart';
import '../features/journal/journal_screen.dart';
import '../features/settings/settings_screen.dart';
import 'heartwood_icon.dart';

class NavShell extends StatefulWidget {
  const NavShell({super.key});

  /// Switch the shell to another tab (0 Home, 1 Journal, 2 Habits, 3 Settings).
  static void goTo(BuildContext context, int index) {
    final state = context.findAncestorStateOfType<NavShellState>();
    state?.setIndex(index);
  }

  @override
  State<NavShell> createState() => NavShellState();
}

class NavShellState extends State<NavShell> {
  int _index = 0;
  final _journalKey = GlobalKey<JournalScreenState>();
  final _habitsKey = GlobalKey<HabitsScreenState>();

  void setIndex(int i) {
    if (i < 0 || i > 3 || i == _index) return;
    setState(() => _index = i);
  }

  void _onFab() {
    if (_index == 2) {
      _habitsKey.currentState?.plantHabit();
    } else {
      _journalKey.currentState?.openCompose();
    }
  }

  static const _labels = ['Home', 'Journal', 'Habits', 'Settings'];
  static const _icons = [
    HeartwoodIcon.rings,
    HeartwoodIcon.book,
    HeartwoodIcon.sprout,
    HeartwoodIcon.leafgear,
  ];

  

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final body = IndexedStack(
      index: _index,
      children: [
        const DashboardScreen(),
        JournalScreen(key: _journalKey),
        HabitsScreen(key: _habitsKey),
        const SettingsScreen(),
      ],
    );
return LayoutBuilder(
      builder: (context, constraints) {
        final desktop = constraints.maxWidth >= 1040;
        return Scaffold(
          backgroundColor: tokens.bg,
          body: desktop
              ? Stack(
                  children: [
                    Row(
                      children: [
                        // Cached layer: the rail only changes on tab switch,
                        // so CanvasKit can reuse it between frames.
                        RepaintBoundary(
                          child: _Rail(
                            index: _index,
                            onSelect: (i) => setState(() => _index = i),
                          ),
                        ),
                        Expanded(child: body),
                      ],
                    ),
                    _DesktopFab(
                      onTap: _onFab,
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Positioned.fill(child: body),
                    _MobileNav(
                      index: _index,
                      onSelect: (i) => setState(() => _index = i),
                      onFab: _onFab,
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class _Rail extends StatelessWidget {
  final int index;
  final ValueChanged<int> onSelect;

  const _Rail({required this.index, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      width: 84,
      decoration: BoxDecoration(
        color: tokens.bgDeep,
        border: Border(right: BorderSide(color: tokens.hairline)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 26),
      child: Column(
        children: [
          const HeartwoodIconWidget(icon: HeartwoodIcon.mark, size: 34),
          const SizedBox(height: 34),
          for (var i = 0; i < NavShellState._labels.length; i++)
            _RailItem(
              label: NavShellState._labels[i],
              icon: NavShellState._icons[i],
              active: i == index,
              onTap: () => onSelect(i),
            ),
          const Spacer(),
          const _Avatar(),
        ],
      ),
    );
  }
}

class _RailItem extends StatefulWidget {
  final String label;
  final HeartwoodIcon icon;
  final bool active;
  final VoidCallback onTap;

  const _RailItem({
    required this.label,
    required this.icon,
    required this.active,
    required this.onTap,
  });

  @override
  State<_RailItem> createState() => _RailItemState();
}

class _RailItemState extends State<_RailItem> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final active = widget.active;
    final color = active
        ? tokens.accent
        : _hover
            ? tokens.textSecondary
            : tokens.textTertiary;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: InkWell(
        onTap: widget.onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        child: Container(
          width: 56,
          height: 56,
          margin: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            color: active
                ? tokens.accentWash
                : _hover
                    ? tokens.surfaceHover
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              if (active)
                Positioned(
                  left: -14,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 3,
                    height: 22,
                    margin: const EdgeInsets.symmetric(vertical: 17),
                    decoration: BoxDecoration(
                      color: tokens.accent,
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                    ),
                  ),
                ),
              SizedBox(
                width: 56,
                height: 56,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeartwoodIconWidget(icon: widget.icon, size: 20, color: color),
                    const SizedBox(height: 5),
                    Text(
                      widget.label,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 10,
                        height: 1,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.02,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopFab extends StatefulWidget {
  final VoidCallback onTap;

  const _DesktopFab({required this.onTap});

  @override
  State<_DesktopFab> createState() => _DesktopFabState();
}

class _DesktopFabState extends State<_DesktopFab>
    with SingleTickerProviderStateMixin {
  bool _hover = false;

  static const _shadow = [
    BoxShadow(
      color: Color(0x8CA9C28C),
      blurRadius: 20,
      offset: Offset(0, 14),
    ),
  ];

  // Live-paced: always spans 10 rendered frames via PacedAnimation so the
  // 90-degree turn is quick yet perceptible (user-mandated, T14).
  late final PacedAnimation _spin =
      PacedAnimation(vsync: this, targetFrames: 8);

  @override
  void dispose() {
    _spin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Positioned(
      right: 40,
      bottom: 34,
      child: MouseRegion(
        onEnter: (_) {
          setState(() => _hover = true);
          _spin.forward();
        },
        onExit: (_) {
          setState(() => _hover = false);
          _spin.reverse();
        },
        child: GestureDetector(
          key: const Key('desktop-fab'),
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: _hover ? 1.06 : 1.0,
            duration: DevicePace.durationForFrames(8),
            curve: AppMotion.standard,
            child: AnimatedBuilder(
              animation: _spin,
              builder: (context, child) => Transform.rotate(
                angle: _spin.value * 1.5708,
                child: child,
              ),
              child: RepaintBoundary(
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: tokens.accent,
                    shape: BoxShape.circle,
                    boxShadow: _shadow,
                  ),
                  alignment: Alignment.center,
                  child: HeartwoodIconWidget(
                    icon: HeartwoodIcon.plus,
                    size: 22,
                    color: tokens.accentInk,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: tokens.surfaceRaised,
        shape: BoxShape.circle,
        border: Border.all(color: tokens.hairlineStrong),
      ),
      alignment: Alignment.center,
      child: Text(
        'R',
        style: TextStyle(
          fontFamily: 'Fraunces',
          fontStyle: FontStyle.italic,
          fontSize: 15,
          color: tokens.accent,
        ),
      ),
    );
  }
}

class _MobileNav extends StatelessWidget {
  final int index;
  final ValueChanged<int> onSelect;
  final VoidCallback onFab;

  const _MobileNav({
    required this.index,
    required this.onSelect,
    required this.onFab,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final items = ['Home', 'Journal', 'Habits', 'Settings'];
    final icons = [
      HeartwoodIcon.rings,
      HeartwoodIcon.book,
      HeartwoodIcon.sprout,
      HeartwoodIcon.leafgear,
    ];
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 78,
            padding: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: tokens.surface.withValues(alpha: 0.92),
              border: Border(top: BorderSide(color: tokens.hairline)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _MobileItem(
                  label: items[0],
                  icon: icons[0],
                  active: index == 0,
                  onTap: () => onSelect(0),
                ),
                _MobileItem(
                  label: items[1],
                  icon: icons[1],
                  active: index == 1,
                  onTap: () => onSelect(1),
                ),
                _MobileFab(onTap: onFab),
                _MobileItem(
                  label: items[2],
                  icon: icons[2],
                  active: index == 2,
                  onTap: () => onSelect(2),
                ),
                _MobileItem(
                  label: items[3],
                  icon: icons[3],
                  active: index == 3,
                  onTap: () => onSelect(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileItem extends StatelessWidget {
  final String label;
  final HeartwoodIcon icon;
  final bool active;
  final VoidCallback onTap;

  const _MobileItem({
    required this.label,
    required this.icon,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final color = active ? tokens.accent : tokens.textTertiary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: SizedBox(
        width: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: active
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: tokens.accentWashStrong,
                          blurRadius: 8,
                        ),
                      ],
                    )
                  : null,
              child: HeartwoodIconWidget(icon: icon, size: 19, color: color),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.w600, color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileFab extends StatelessWidget {
  final VoidCallback onTap;

  const _MobileFab({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return GestureDetector(
      onTap: onTap,
      child: Transform.translate(
        offset: const Offset(0, -30),
        child: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: tokens.accent,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Color(0x8CA9C28C),
                blurRadius: 16,
                offset: Offset(0, 10),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: HeartwoodIconWidget(
            icon: HeartwoodIcon.plus,
            size: 20,
            color: tokens.accentInk,
          ),
        ),
      ),
    );
  }
}