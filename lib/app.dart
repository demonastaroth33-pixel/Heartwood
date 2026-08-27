import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/device_mode.dart';
import 'core/theme.dart';
import 'data/providers.dart';
import 'features/dashboard/dashboard_providers.dart';
import 'features/habits/habits_providers.dart';
import 'features/journal/journal_providers.dart';
import 'features/settings/recovery_screen.dart';
import 'features/welcome/welcome_screen.dart';
import 'widgets/animated_widgets.dart';
import 'widgets/app_loader.dart';
import 'widgets/nav_shell.dart';

class App extends ConsumerStatefulWidget {
  final bool bootHealthy;
  final bool showLoader;
  final bool showWelcome;

  const App({
    super.key,
    this.bootHealthy = true,
    this.showLoader = false,
    this.showWelcome = false,
  });

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  bool _welcomeDismissed = false;

  void _onWelcomeDone() {
    ref.invalidate(habitsProvider);
    ref.invalidate(todayCheckinsProvider);
    ref.invalidate(journalEntriesProvider);
    ref.invalidate(storageMeterProvider);
    setState(() => _welcomeDismissed = true);
  }

  @override
  Widget build(BuildContext context) {
    final themeKey = ref.watch(themeKeyProvider).maybeWhen(
          data: (k) => k,
          orElse: () => inkTheme.key,
        );
    final welcomeDone = ref.watch(welcomeDoneProvider).maybeWhen(
          data: (done) => done,
          orElse: () => true,
        );
    // Some Windows/Chrome setups report prefers-reduced-motion, which sets
    // MediaQuery.disableAnimations and makes framework transitions render
    // instantly (start/end frame only). Heartwood's motion is part of the
    // design — force animations on via MaterialApp.builder (inside the app's
    // own MediaQuery) so the dock/pop effects always play.
    return MaterialApp(
      title: 'Heartwood',
      theme: buildTheme(themeRegistry[themeKey] ?? inkTheme),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        // Developer preview mode: force the layout width so every screen
        // (LayoutBuilder breakpoints AND MediaQuery reads) behaves as a
        // 390px phone or a 1280px desktop, regardless of the window.
        final mode = deviceModeFrom(
            ref.watch(deviceModeProvider).valueOrNull);
        final forcedW = forcedLayoutWidth(mode);
        Widget result = MediaQuery(
          data: MediaQuery.of(context).copyWith(disableAnimations: false),
          child: child!,
        );
        if (forcedW != null) {
          final real = MediaQuery.of(context).size;
          result = Center(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                disableAnimations: false,
                size: Size(forcedW, real.height),
              ),
              child: SizedBox(
                width: forcedW,
                height: real.height,
                child: result,
              ),
            ),
          );
        }
        return result;
      },
      home: RepaintBoundary(
        key: backdropCaptureKey,
        child: _buildHome(welcomeDone),
      ),
    );
  }

  Widget _buildHome(bool welcomeDone) {
    if (!widget.bootHealthy) return const RecoveryScreen();
    if (widget.showWelcome && !welcomeDone && !_welcomeDismissed) {
      return WelcomeScreen(onDone: _onWelcomeDone);
    }
    return Stack(
      children: [
        const NavShell(),
        if (widget.showLoader) const AppLoader(),
      ],
    );
  }
}