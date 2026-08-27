import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web/web.dart' as web;

import 'app.dart';
import 'core/app_boot.dart';
import 'core/boot_health.dart';
import 'core/device_pace.dart';
import 'data/database/database.dart';
import 'data/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDatabase.open();
  final healthy = await checkBootHealthy(db);
  runApp(
    ProviderScope(
      overrides: [dbProvider.overrideWithValue(db)],
      child: App(
        bootHealthy: healthy,
        showLoader: false,
        showWelcome: true,
      ),
    ),
  );
  // The HTML splash dispatches `hw-boot-done` the moment it starts fading;
  // start entrance animations from there so the reveal stagger / ring draw-in
  // is actually seen. The timer is a fallback if the event never arrives.
  web.window.addEventListener('hw-boot-done', ((JSAny _) => AppBoot.markComplete()).toJS);
  Future<void>.delayed(const Duration(seconds: 6), () {
    if (!AppBoot.complete.value) AppBoot.markComplete();
  });
  DevicePace.init();
  _logFrameDiagnostics();
}

/// Counts rendered frames per second for the first 30s and logs them, so we
/// can tell whether the app keeps scheduling frames when idle (continuous
/// work) or renders only on demand (healthy). Remove once diagnosed.
void _logFrameDiagnostics() {
  try {
    final boot = DateTime.now();
    final binding = WidgetsBinding.instance;
    var frames = 0;
    var lastLog = DateTime.now();
    var windows = 0;
    binding.addTimingsCallback((timings) {
      frames += timings.length;
      final now = DateTime.now();
      if (now.difference(lastLog).inSeconds >= 1 && windows < 180) {
        final avg = timings.isEmpty
            ? 0
            : timings.map((t) => t.totalSpan.inMilliseconds).reduce((a, b) => a + b) ~/
                timings.length;
        // ignore: avoid_print
        print('[heartwood-frames] t=${now.difference(boot).inSeconds}s fps=$frames lastAvg=${avg}ms');
        frames = 0;
        lastLog = now;
        windows++;
      }
    });
  } catch (_) {
    // Diagnostics must never break boot.
  }
}