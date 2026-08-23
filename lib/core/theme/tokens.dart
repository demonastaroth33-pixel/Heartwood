import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double pill = 999;
}

abstract final class AppSpace {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
}

abstract final class AppMotion {
  static const Duration instant = Duration(milliseconds: 120);
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration slow = Duration(milliseconds: 320);
  static const Curve standard = Curves.easeOutCubic;
  static const Curve emphasis = Curves.easeInOutCubic;
}

class AppTokens extends ThemeExtension<AppTokens> {
  final Color bg;
  final Color surface;
  final Color surfaceRaised;
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final Color accent;
  final Color onAccent;
  final Color accentDim;
  final Color gold;
  final Color danger;
  final Color warning;
  final Color hairline;
  final Color atmoWash1;
  final Color atmoWash2;
  final double atmoOpacity;
  final bool atmoDrift;

  const AppTokens({
    required this.bg,
    required this.surface,
    required this.surfaceRaised,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.accent,
    required this.onAccent,
    required this.accentDim,
    required this.gold,
    required this.danger,
    required this.warning,
    required this.hairline,
    required this.atmoWash1,
    required this.atmoWash2,
    required this.atmoOpacity,
    required this.atmoDrift,
  });

  @override
  AppTokens copyWith({
    Color? bg,
    Color? surface,
    Color? surfaceRaised,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    Color? accent,
    Color? onAccent,
    Color? accentDim,
    Color? gold,
    Color? danger,
    Color? warning,
    Color? hairline,
    Color? atmoWash1,
    Color? atmoWash2,
    double? atmoOpacity,
    bool? atmoDrift,
  }) {
    return AppTokens(
      bg: bg ?? this.bg,
      surface: surface ?? this.surface,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      accentDim: accentDim ?? this.accentDim,
      gold: gold ?? this.gold,
      danger: danger ?? this.danger,
      warning: warning ?? this.warning,
      hairline: hairline ?? this.hairline,
      atmoWash1: atmoWash1 ?? this.atmoWash1,
      atmoWash2: atmoWash2 ?? this.atmoWash2,
      atmoOpacity: atmoOpacity ?? this.atmoOpacity,
      atmoDrift: atmoDrift ?? this.atmoDrift,
    );
  }

  @override
  AppTokens lerp(AppTokens? other, double t) {
    if (other == null) return this;
    return AppTokens(
      bg: Color.lerp(bg, other.bg, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceRaised: Color.lerp(surfaceRaised, other.surfaceRaised, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      accentDim: Color.lerp(accentDim, other.accentDim, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      hairline: Color.lerp(hairline, other.hairline, t)!,
      atmoWash1: Color.lerp(atmoWash1, other.atmoWash1, t)!,
      atmoWash2: Color.lerp(atmoWash2, other.atmoWash2, t)!,
      atmoOpacity: lerpDouble(atmoOpacity, other.atmoOpacity, t)!,
      atmoDrift: t < 0.5 ? atmoDrift : other.atmoDrift,
    );
  }
}