import 'package:flutter/material.dart';

import 'tokens.dart';

class ThemeValues {
  final String key;
  final String label;
  final Brightness brightness;

  final Color bg;
  final Color surface;
  final Color surfaceRaised;
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final Color accent;
  final Color onAccent;
  final Color gold;
  final Color danger;
  final Color warning;
  final Color hairline;

  final double atmoOpacity;
  final bool atmoDrift;

  const ThemeValues({
    required this.key,
    required this.label,
    required this.brightness,
    required this.bg,
    required this.surface,
    required this.surfaceRaised,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.accent,
    required this.onAccent,
    required this.gold,
    required this.danger,
    required this.warning,
    required this.hairline,
    required this.atmoOpacity,
    required this.atmoDrift,
  });

  Color get accentDim =>
      accent.withValues(alpha: brightness == Brightness.dark ? 0.22 : 0.14);

  Color get atmoWash1 => accentDim;

  Color get atmoWash2 => gold.withValues(
        alpha: brightness == Brightness.dark ? 0.06 : 0.05,
      );

  AppTokens get tokens => AppTokens(
        bg: bg,
        surface: surface,
        surfaceRaised: surfaceRaised,
        textPrimary: textPrimary,
        textSecondary: textSecondary,
        textDisabled: textDisabled,
        accent: accent,
        onAccent: onAccent,
        accentDim: accentDim,
        gold: gold,
        danger: danger,
        warning: warning,
        hairline: hairline,
        atmoWash1: atmoWash1,
        atmoWash2: atmoWash2,
        atmoOpacity: atmoOpacity,
        atmoDrift: atmoDrift,
      );
}

const inkTheme = ThemeValues(
  key: 'ink',
  label: 'Ink',
  brightness: Brightness.dark,
  bg: Color(0xFF0D110F),
  surface: Color(0xFF141A16),
  surfaceRaised: Color(0xFF1C241E),
  textPrimary: Color(0xFFE8EDE9),
  textSecondary: Color(0xFF93A29A),
  textDisabled: Color(0xFF55615A),
  accent: Color(0xFF8FBF72),
  onAccent: Color(0xFF0D110F),
  gold: Color(0xFFE8B45A),
  danger: Color(0xFFE06C5F),
  warning: Color(0xFFD9A441),
  hairline: Color(0x12FFFFFF),
  atmoOpacity: 0.9,
  atmoDrift: true,
);

const paperTheme = ThemeValues(
  key: 'paper',
  label: 'Paper',
  brightness: Brightness.light,
  bg: Color(0xFFF2F5F1),
  surface: Color(0xFFFFFFFF),
  surfaceRaised: Color(0xFFFAFBF9),
  textPrimary: Color(0xFF1A211C),
  textSecondary: Color(0xFF5C6B61),
  textDisabled: Color(0xFFA8B2AB),
  accent: Color(0xFF4E7A35),
  onAccent: Color(0xFFF2F5F1),
  gold: Color(0xFF8A6A1F),
  danger: Color(0xFFB3382A),
  warning: Color(0xFF8F6A12),
  hairline: Color(0x1A1A211C),
  atmoOpacity: 0.7,
  atmoDrift: false,
);

const themeRegistry = <String, ThemeValues>{
  'ink': inkTheme,
  'paper': paperTheme,
};

TextTheme _textTheme(Color textPrimary, Color textSecondary, Color textDisabled) {
  const tnum = [FontFeature.tabularFigures()];
  final base = TextTheme(
    displaySmall: const TextStyle(
      fontSize: 34,
      height: 40 / 34,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.3,
    ),
    headlineSmall: const TextStyle(
      fontSize: 24,
      height: 30 / 24,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
    ),
    titleLarge: const TextStyle(
      fontSize: 18,
      height: 24 / 18,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle(
      fontSize: 15,
      height: 22 / 15,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: const TextStyle(
      fontSize: 15,
      height: 22 / 15,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 13,
      height: 18 / 13,
      fontWeight: FontWeight.w400,
      color: textSecondary,
      fontFeatures: tnum,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: textSecondary,
      fontFeatures: tnum,
    ),
    labelLarge: const TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w600,
    ),
  );
  return base.apply(
    bodyColor: textPrimary,
    displayColor: textPrimary,
    decorationColor: textPrimary,
  );
}

ThemeData buildTheme(ThemeValues v) {
  final isDark = v.brightness == Brightness.dark;
  final scheme = ColorScheme(
    brightness: v.brightness,
    primary: v.accent,
    onPrimary: v.onAccent,
    secondary: v.accent,
    onSecondary: v.onAccent,
    error: v.danger,
    onError: isDark ? const Color(0xFF1A100E) : Colors.white,
    surface: v.surface,
    onSurface: v.textPrimary,
    onSurfaceVariant: v.textSecondary,
    outline: v.hairline,
    outlineVariant: v.hairline,
    surfaceContainerHighest: v.surfaceRaised,
  );
  final tokens = v.tokens;
  final cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppRadius.lg),
    side: BorderSide(color: v.hairline),
  );
  final navBg = isDark
      ? Color.alphaBlend(v.surface.withValues(alpha: 0.96), v.bg)
      : v.surface.withValues(alpha: 0.96);
  return ThemeData(
    useMaterial3: true,
    brightness: v.brightness,
    colorScheme: scheme,
    scaffoldBackgroundColor: v.bg,
    textTheme: _textTheme(v.textPrimary, v.textSecondary, v.textDisabled),
    extensions: [tokens],
    dividerColor: v.hairline,
    cardTheme: CardThemeData(
      color: v.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: cardShape,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: navBg,
      indicatorColor: v.accentDim,
      indicatorShape: const StadiumBorder(),
      height: 76,
      elevation: 0,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) => TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: states.contains(WidgetState.selected) ? v.accent : v.textSecondary,
        ),
      ),
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          size: 21,
          color: states.contains(WidgetState.selected) ? v.accent : v.textSecondary,
        ),
      ),
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: v.surface,
      indicatorColor: v.accentDim,
      selectedIconTheme: IconThemeData(color: v.accent, size: 22),
      unselectedIconTheme: IconThemeData(color: v.textSecondary, size: 22),
      selectedLabelTextStyle: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: v.accent,
      ),
      unselectedLabelTextStyle: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: v.textSecondary,
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
        side: BorderSide(color: v.hairline),
      ),
      showDragHandle: true,
      dragHandleColor: v.hairline,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: v.accent,
        foregroundColor: v.onAccent,
        minimumSize: const Size(48, 48),
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.xl),
        shape: const StadiumBorder(),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: v.surfaceRaised,
        foregroundColor: v.textPrimary,
        minimumSize: const Size(44, 40),
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.lg),
        shape: StadiumBorder(side: BorderSide(color: v.hairline)),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: v.textSecondary,
        shape: const CircleBorder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: v.surfaceRaised,
      labelStyle: TextStyle(color: v.textSecondary),
      hintStyle: TextStyle(color: v.textDisabled),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: v.accent, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: v.hairline),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: v.danger, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: v.danger, width: 1.5),
      ),
    ),
  );
}