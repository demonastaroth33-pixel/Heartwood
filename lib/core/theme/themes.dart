import 'package:flutter/material.dart';

import 'tokens.dart';

class ThemeValues {
  final String key;
  final String label;
  final Brightness brightness;

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
  final Color gold;
  final Color goldDeep;
  final Color rust;
  final Color paper;

  const ThemeValues({
    required this.key,
    required this.label,
    required this.brightness,
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
    required this.gold,
    required this.goldDeep,
    required this.rust,
    required this.paper,
  });

  Color get accentWash => accent.withValues(alpha: 0.14);
  Color get accentWashStrong => accent.withValues(alpha: 0.26);
  Color get goldWash => gold.withValues(alpha: 0.16);
  Color get rustWash => rust.withValues(alpha: 0.15);

  AppTokens get tokens => AppTokens(
        bg: bg,
        bgDeep: bgDeep,
        surface: surface,
        surfaceRaised: surfaceRaised,
        surfaceHover: surfaceHover,
        hairline: hairline,
        hairlineStrong: hairlineStrong,
        textPrimary: textPrimary,
        textSecondary: textSecondary,
        textTertiary: textTertiary,
        accent: accent,
        accentDeep: accentDeep,
        accentInk: accentInk,
        accentWash: accentWash,
        accentWashStrong: accentWashStrong,
        gold: gold,
        goldDeep: goldDeep,
        goldWash: goldWash,
        rust: rust,
        rustWash: rustWash,
        paper: paper,
      );
}

const inkTheme = ThemeValues(
  key: 'ink',
  label: 'Ink',
  brightness: Brightness.dark,
  bg: Color(0xFF12140F),
  bgDeep: Color(0xFF0C0E0A),
  surface: Color(0xFF1A1D15),
  surfaceRaised: Color(0xFF232720),
  surfaceHover: Color(0xFF2B3027),
  hairline: Color(0x14F0EFE4),
  hairlineStrong: Color(0x24F0EFE4),
  textPrimary: Color(0xFFF1EFE2),
  textSecondary: Color(0xFFA5A791),
  textTertiary: Color(0xFF6C6E5D),
  accent: Color(0xFFA9C28C),
  accentDeep: Color(0xFF7C9A63),
  accentInk: Color(0xFF0E140C),
  gold: Color(0xFFE3B15D),
  goldDeep: Color(0xFFA9793A),
  rust: Color(0xFFC4633F),
  paper: Color(0xFFF4F0E4),
);

// Paper ships with the overhaul — same token slots, light values per the
// mock's Paper swatch (linear-gradient #F4F0E4 → #E4DFCC).
const paperTheme = ThemeValues(
  key: 'paper',
  label: 'Paper',
  brightness: Brightness.light,
  bg: Color(0xFFF4F0E4),
  bgDeep: Color(0xFFE4DFCC),
  surface: Color(0xFFFDFBF4),
  surfaceRaised: Color(0xFFEDE9DA),
  surfaceHover: Color(0xFFE2DDCB),
  hairline: Color(0x1A4A463A),
  hairlineStrong: Color(0x2E4A463A),
  textPrimary: Color(0xFF22241D),
  textSecondary: Color(0xFF5C5E51),
  textTertiary: Color(0xFF8A8C7C),
  accent: Color(0xFF6D8A4E),
  accentDeep: Color(0xFF55703C),
  accentInk: Color(0xFFF4F0E4),
  gold: Color(0xFFA9793A),
  goldDeep: Color(0xFF8A5F2C),
  rust: Color(0xFFB04E2E),
  paper: Color(0xFF22241D),
);

const themeRegistry = <String, ThemeValues>{
  'ink': inkTheme,
  'paper': paperTheme,
};

const _displayFont = 'Fraunces';
const _bodyFont = 'Inter';
const _monoFont = 'JetBrainsMono';

TextTheme _textTheme(ThemeValues v) {
  final primary = v.textPrimary;
  final secondary = v.textSecondary;
  final tertiary = v.textTertiary;
  return TextTheme(
    // Fraunces display roles
    displaySmall: TextStyle(
      fontFamily: _displayFont,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      fontSize: 40,
      height: 1.1,
      color: v.paper,
    ),
    headlineSmall: TextStyle(
      fontFamily: _displayFont,
      fontWeight: FontWeight.w500,
      fontSize: 28,
      height: 1.15,
      color: primary,
    ),
    titleLarge: TextStyle(
      fontFamily: _displayFont,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: 1.2,
      color: primary,
    ),
    titleMedium: TextStyle(
      fontFamily: _displayFont,
      fontWeight: FontWeight.w500,
      fontSize: 16.5,
      height: 1.25,
      color: primary,
    ),
    titleSmall: TextStyle(
      fontFamily: _displayFont,
      fontWeight: FontWeight.w500,
      fontSize: 14.5,
      height: 1.2,
      color: primary,
    ),
    // Inter body roles
    bodyLarge: TextStyle(
      fontFamily: _bodyFont,
      fontSize: 14.5,
      height: 1.5,
      color: primary,
    ),
    bodyMedium: TextStyle(
      fontFamily: _bodyFont,
      fontSize: 13.5,
      height: 1.6,
      color: secondary,
    ),
    bodySmall: TextStyle(
      fontFamily: _bodyFont,
      fontSize: 12,
      height: 1.5,
      color: tertiary,
    ),
    labelLarge: TextStyle(
      fontFamily: _bodyFont,
      fontWeight: FontWeight.w600,
      fontSize: 13.5,
      height: 1.2,
      color: primary,
    ),
    labelMedium: TextStyle(
      fontFamily: _bodyFont,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      height: 1.2,
      color: secondary,
    ),
    labelSmall: TextStyle(
      fontFamily: _bodyFont,
      fontWeight: FontWeight.w600,
      fontSize: 11,
      height: 1.2,
      letterSpacing: 0.02,
      color: tertiary,
    ),
  );
}

/// JetBrains Mono, tabular figures — for streak counts, timestamps, storage
/// figures, eyebrows.
TextStyle monoStyle(ThemeValues v, {double size = 12, Color? color, FontWeight weight = FontWeight.w500}) {
  return TextStyle(
    fontFamily: _monoFont,
    fontSize: size,
    fontWeight: weight,
    color: color ?? v.textTertiary,
    fontFeatures: const [FontFeature.tabularFigures()],
  );
}

ThemeData buildTheme(ThemeValues v) {
  final scheme = ColorScheme(
    brightness: v.brightness,
    primary: v.accent,
    onPrimary: v.accentInk,
    secondary: v.gold,
    onSecondary: v.bgDeep,
    error: v.rust,
    onError: v.paper,
    surface: v.surface,
    onSurface: v.textPrimary,
    onSurfaceVariant: v.textSecondary,
    outline: v.hairline,
    outlineVariant: v.hairline,
    surfaceContainerHighest: v.surfaceRaised,
  );
  final tokens = v.tokens;
  return ThemeData(
    useMaterial3: true,
    brightness: v.brightness,
    colorScheme: scheme,
    scaffoldBackgroundColor: v.bg,
    textTheme: _textTheme(v),
    extensions: [tokens],
    dividerColor: v.hairline,
    splashFactory: InkSparkle.splashFactory,
    cardTheme: CardThemeData(
      color: v.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(color: v.hairline),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: v.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        side: BorderSide(color: v.hairline),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: v.surface,
      modalBackgroundColor: v.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      showDragHandle: true,
      dragHandleColor: v.hairlineStrong,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: v.accent,
        foregroundColor: v.accentInk,
        minimumSize: const Size(44, 44),
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.sp5),
        shape: const StadiumBorder(),
        textStyle: const TextStyle(
          fontFamily: _bodyFont,
          fontWeight: FontWeight.w600,
          fontSize: 13.5,
        ),
        shadowColor: v.accent.withValues(alpha: 0.45),
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: v.surfaceRaised,
        foregroundColor: v.textPrimary,
        minimumSize: const Size(44, 40),
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.sp4),
        shape: StadiumBorder(side: BorderSide(color: v.hairlineStrong)),
        textStyle: const TextStyle(
          fontFamily: _bodyFont,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: v.textTertiary,
        shape: const CircleBorder(),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: v.bg.withValues(alpha: 0.92),
      indicatorColor: Colors.transparent,
      height: 78,
      elevation: 0,
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: v.bgDeep,
      indicatorColor: v.accentWash,
      selectedIconTheme: IconThemeData(color: v.accent, size: 20),
      unselectedIconTheme: IconThemeData(color: v.textTertiary, size: 20),
      selectedLabelTextStyle: TextStyle(
        fontFamily: _bodyFont,
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: v.accent,
      ),
      unselectedLabelTextStyle: TextStyle(
        fontFamily: _bodyFont,
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: v.textTertiary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: v.surfaceRaised,
      labelStyle: TextStyle(color: v.textTertiary),
      hintStyle: TextStyle(color: v.textTertiary),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpace.sp4,
        vertical: AppSpace.sp3,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: v.accent, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: v.hairline, width: 1.5),
      ),
    ),
  );
}