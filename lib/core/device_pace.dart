import 'dart:ui' show FramePhase;

import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';

/// Adaptive motion pacing — the single source of truth for animation
/// durations in Heartwood.
///
/// Two mechanisms:
/// - [durationForFrames] — converts a target frame count into a wall-clock
///   duration from the measured device frame rate (snapshot at call time).
///   Use for things you cannot re-pace live (route transitions, which the
///   Navigator drives).
/// - [PacedAnimation] — an [Animation] that advances by a fixed step per
///   RENDERED frame, so it always spans the same number of visible frames
///   regardless of the device's current frame rate, including mid-animation
///   drops (the motion never collapses into 2-3 frames under stress).
///   Use for every widget-level animation.
///
/// Both derive durations from a target frame count, so the SAME animation
/// reads reference-like on a 60fps machine (~330ms for 20 frames) and stays
/// clearly perceptible on a 20fps one (~1s) or worse.
///
/// User-mandated system (T14 decision log). See docs/DevicePace.md.
class DevicePace {
  DevicePace._();

  static double _fps = 60;

  /// Current rolling estimate of the device's frame rate (frames/sec).
  static double get fps => _fps;

  /// Start collecting frame timings. Call once after runApp.
  static void init() {
    final intervals = <double>[];
    int? last;
    SchedulerBinding.instance.addTimingsCallback((timings) {
      for (final t in timings) {
        final ts = t.timestampInMicroseconds(FramePhase.buildStart);
        final prev = last;
        if (prev != null) {
          final dt = (ts - prev) / 1e6;
          if (dt > 0 && dt < 1.0) intervals.add(dt);
        }
        last = ts;
      }
      // Keep ~1.5s of intervals (percentile estimate, spike-resistant).
      while (intervals.isNotEmpty &&
          intervals.fold<double>(0, (a, b) => a + b) > 1.5) {
        intervals.removeAt(0);
      }
      if (intervals.length >= 8) {
        final sorted = [...intervals]..sort();
        final idx = (sorted.length * 0.7).floor();
        // 70th percentile: ignores boot spikes and single long frames,
        // tracks sustained conditions.
        final i = idx < 0
            ? 0
            : idx >= sorted.length
                ? sorted.length - 1
                : idx;
        final p70 = sorted[i];
        final measured = (1 / p70).clamp(1.0, 120.0);
        // Sanitize: a non-finite measurement must never poison the estimate.
        if (measured.isFinite) {
          _fps = (_fps * 0.5 + measured * 0.5).clamp(1.0, 120.0);
        }
      }
    });
  }

  /// Duration that spans [frames] rendered frames at the measured pace.
  /// Clamped so animations stay snappy on fast devices. [max] caps the
  /// wall-clock duration — route transitions pass a tight max so a slow
  /// estimate can never make them look dead (e.g. a 5s slide reads as
  /// "nothing happened").
  static Duration durationForFrames(double frames,
      {Duration max = const Duration(milliseconds: 5000)}) {
    final ms = (frames / _fps * 1000)
        .round()
        .clamp(150, max.inMilliseconds);
    return Duration(milliseconds: ms);
  }
}

/// Frame-count-paced animation: advances `1/targetFrames` per rendered
/// frame, so the motion always spans exactly [targetFrames] visible frames —
/// adapting LIVE to the device's current frame rate, including mid-animation
/// stress spikes. Wall-clock duration is whatever it needs to be.
///
/// Usage:
/// ```dart
/// late final _anim = PacedAnimation(vsync: this, targetFrames: 30);
/// // in a handler:
/// _anim.forward();        // or .reverse()
/// // rebuild with AnimatedBuilder(animation: _anim, ...)
/// // dispose(): _anim.dispose()
/// ```
class PacedAnimation extends Animation<double>
    with
        AnimationEagerListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  PacedAnimation({required TickerProvider vsync, required this.targetFrames}) {
    _ticker = vsync.createTicker(_onTick);
  }

  late Ticker _ticker;
  final double targetFrames;

  double _value = 0;
  double _direction = 1;
  bool _active = true;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  double get value => _value;

  @override
  AnimationStatus get status => _status;

  void forward() {
    _direction = 1;
    _start();
  }

  void reverse() {
    _direction = -1;
    _start();
  }

  void _start() {
    _status = _direction > 0 ? AnimationStatus.forward : AnimationStatus.reverse;
    notifyStatusListeners(_status);
    _active = true;
    _ticker.start();
  }

  void _onTick(Duration elapsed) {
    if (!_active) return;
    _value = (_value + _direction / targetFrames).clamp(0.0, 1.0);
    if (_value >= 1.0) {
      _value = 1.0;
      _active = false;
      _ticker.stop();
      _status = AnimationStatus.completed;
      notifyStatusListeners(_status);
    } else if (_value <= 0.0) {
      _value = 0.0;
      _active = false;
      _ticker.stop();
      _status = AnimationStatus.dismissed;
      notifyStatusListeners(_status);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}