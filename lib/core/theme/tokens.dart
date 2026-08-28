import 'package:flutter/material.dart';

// ============================================================
// HEARTWOOD — DESIGN TOKENS (1:1 with design/heartwood/heartwood-m0.html)
// ============================================================

abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 14;
  static const double lg = 20;
  static const double xl = 28;
  static const double pill = 999;
}

abstract final class AppSpace {
  static const double sp1 = 4;
  static const double sp2 = 8;
  static const double sp3 = 12;
  static const double sp4 = 16;
  static const double sp5 = 24;
  static const double sp6 = 32;
  static const double sp7 = 48;
}

abstract final class AppMotion {
  static const Duration instant = Duration(milliseconds: 120);
  static const Duration fast = Duration(milliseconds: 220);
  static const Duration slow = Duration(milliseconds: 420);
  // cubic-bezier(.16,.8,.3,1)
  static const Cubic standard = Cubic(0.16, 0.8, 0.3, 1.0);
  // cubic-bezier(.65,0,.35,1)
  static const Cubic emphasis = Cubic(0.65, 0.0, 0.35, 1.0);
}

class AppTokens extends ThemeExtension<AppTokens> {
  final Color bg;
  final Color bgDeep;
  final Color surface;
  final Color surfaceRaised;
  final Color surfaceHover;
  final Color hairline;
  final Color hairlineStrong;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color accent;
  final Color accentDeep;
  final Color accentInk;
  final Color accentWash;
  final Color accentWashStrong;
  final Color gold;
  final Color goldDeep;
  final Color goldWash;
  final Color rust;
  final Color rustWash;
  final Color paper;

  const AppTokens({
    required this.bg,
    required this.bgDeep,
    required this.surface,
    required this.surfaceRaised,
    required this.surfaceHover,
    required this.hairline,
    required this.hairlineStrong,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.accent,
    required this.accentDeep,
    required this.accentInk,
    required this.accentWash,
    required this.accentWashStrong,
    required this.gold,
    required this.goldDeep,
    required this.goldWash,
    required this.rust,
    required this.rustWash,
    required this.paper,
  });

  @override
  AppTokens copyWith({
    Color? bg,
    Color? bgDeep,
    Color? surface,
    Color? surfaceRaised,
    Color? surfaceHover,
    Color? hairline,
    Color? hairlineStrong,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? accent,
    Color? accentDeep,
    Color? accentInk,
    Color? accentWash,
    Color? accentWashStrong,
    Color? gold,
    Color? goldDeep,
    Color? goldWash,
    Color? rust,
    Color? rustWash,
    Color? paper,
  }) {
    return AppTokens(
      bg: bg ?? this.bg,
      bgDeep: bgDeep ?? this.bgDeep,
      surface: surface ?? this.surface,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      surfaceHover: surfaceHover ?? this.surfaceHover,
      hairline: hairline ?? this.hairline,
      hairlineStrong: hairlineStrong ?? this.hairlineStrong,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      accent: accent ?? this.accent,
      accentDeep: accentDeep ?? this.accentDeep,
      accentInk: accentInk ?? this.accentInk,
      accentWash: accentWash ?? this.accentWash,
      accentWashStrong: accentWashStrong ?? this.accentWashStrong,
      gold: gold ?? this.gold,
      goldDeep: goldDeep ?? this.goldDeep,
      goldWash: goldWash ?? this.goldWash,
      rust: rust ?? this.rust,
      rustWash: rustWash ?? this.rustWash,
      paper: paper ?? this.paper,
    );
  }

  @override
  AppTokens lerp(AppTokens? other, double t) {
    if (other == null) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppTokens(
      bg: c(bg, other.bg),
      bgDeep: c(bgDeep, other.bgDeep),
      surface: c(surface, other.surface),
      surfaceRaised: c(surfaceRaised, other.surfaceRaised),
      surfaceHover: c(surfaceHover, other.surfaceHover),
      hairline: c(hairline, other.hairline),
      hairlineStrong: c(hairlineStrong, other.hairlineStrong),
      textPrimary: c(textPrimary, other.textPrimary),
      textSecondary: c(textSecondary, other.textSecondary),
      textTertiary: c(textTertiary, other.textTertiary),
      accent: c(accent, other.accent),
      accentDeep: c(accentDeep, other.accentDeep),
      accentInk: c(accentInk, other.accentInk),
      accentWash: c(accentWash, other.accentWash),
      accentWashStrong: c(accentWashStrong, other.accentWashStrong),
      gold: c(gold, other.gold),
      goldDeep: c(goldDeep, other.goldDeep),
      goldWash: c(goldWash, other.goldWash),
      rust: c(rust, other.rust),
      rustWash: c(rustWash, other.rustWash),
      paper: c(paper, other.paper),
    );
  }
}