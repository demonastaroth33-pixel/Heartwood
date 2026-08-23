import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/theme/tokens.dart';

/// Procedural ink-wash ambience for the Journal surface (the one ambience
/// home). Soft bamboo-line strokes + gradient washes at low opacity; the
/// asset slot stays in the architecture — the user may swap in real imagery
/// later without touching this widget's contract.
class JournalAmbience extends StatelessWidget {
  const JournalAmbience({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return IgnorePointer(
      child: CustomPaint(
        painter: _InkWashPainter(
          accent: tokens.atmoWash1,
          gold: tokens.atmoWash2,
          hairline: tokens.hairline,
          dark: tokens.bg.computeLuminance() < 0.5,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _InkWashPainter extends CustomPainter {
  final Color accent;
  final Color gold;
  final Color hairline;
  final bool dark;

  _InkWashPainter({
    required this.accent,
    required this.gold,
    required this.hairline,
    required this.dark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Two soft washes, stronger than the global atmosphere but still quiet.
    final washPaint = Paint()..blendMode = BlendMode.srcOver;
    washPaint.shader = RadialGradient(
      colors: [accent.withValues(alpha: dark ? 0.16 : 0.10), accent.withValues(alpha: 0)],
      stops: const [0, 1],
    ).createShader(Rect.fromLTWH(0, 0, size.width * 1.1, size.height));
    canvas.drawRect(
      Rect.fromLTWH(-size.width * 0.3, -size.height * 0.25, size.width * 1.4, size.height * 1.2),
      washPaint,
    );
    washPaint.shader = RadialGradient(
      colors: [gold.withValues(alpha: dark ? 0.07 : 0.05), gold.withValues(alpha: 0)],
      stops: const [0, 1],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.55, size.height * 0.35, size.width * 0.9, size.height * 0.9),
      washPaint,
    );

    // Ink-wash bamboo lines — three gentle strokes near the top-right and
    // bottom-left gutters. Hand-placed curve paths; no image assets.
    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = accent.withValues(alpha: dark ? 0.10 : 0.08)
      ..strokeWidth = 2.2;
    final rnd = math.Random(7);
    for (int i = 0; i < 3; i++) {
      final baseX = size.width * (0.80 + i * 0.06) + rnd.nextDouble() * 12;
      final baseY = size.height * (0.05 + i * 0.04);
      final h = size.height * (0.16 + rnd.nextDouble() * 0.08);
      final path = Path()..moveTo(baseX, baseY);
      path.cubicTo(
        baseX - 10 + rnd.nextDouble() * 20,
        baseY + h * 0.35,
        baseX + 6,
        baseY + h * 0.65,
        baseX - 4 + rnd.nextDouble() * 8,
        baseY + h,
      );
      canvas.drawPath(path, linePaint);
      // side twig
      final twig = Path()
        ..moveTo(baseX - 2, baseY + h * 0.42)
        ..cubicTo(
          baseX - 18,
          baseY + h * 0.38,
          baseX - 26,
          baseY + h * 0.30,
          baseX - 32,
          baseY + h * 0.20,
        );
      canvas.drawPath(twig, linePaint);
    }
    // hairline rule at the very bottom for grounding.
    canvas.drawRect(
      Rect.fromLTWH(0, size.height - 1, size.width, 1),
      Paint()..color = hairline,
    );
  }

  @override
  bool shouldRepaint(_InkWashPainter old) =>
      old.accent != accent ||
      old.gold != gold ||
      old.hairline != hairline ||
      old.dark != dark;
}