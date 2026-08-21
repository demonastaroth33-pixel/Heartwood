import 'package:flutter/material.dart';

const kAccent = Color(0xFFE8B45A);

ThemeData buildTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF4E7DCC),
    brightness: Brightness.dark,
  );
  return ThemeData(
    colorScheme: scheme,
    scaffoldBackgroundColor: const Color(0xFF0F141E),
    useMaterial3: true,
    fontFamily: 'Roboto',
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF17202E),
      indicatorColor: scheme.primary.withValues(alpha: 0.22),
    ),
  );
}