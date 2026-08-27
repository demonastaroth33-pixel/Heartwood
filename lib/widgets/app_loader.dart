import 'package:flutter/material.dart';

import '../core/theme/tokens.dart';

/// Heartwood splash: a sprout draws itself in (stem, roots, two leaves,
/// soil line), a ripple pulse, three drifting motes, then the wordmark and
/// "growing your archive" subline fade up. Mirrors #loader in the mock.
class AppLoader extends StatefulWidget {
  const AppLoader({super.key});

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _hidden = false;
  bool _gone = false;

  @override
  void initState() {
    super.initState();
    final reduced = MediaQuery.disableAnimationsOf(context);
    _controller = AnimationController(
      vsync: this,
      duration: reduced
          ? const Duration(milliseconds: 300)
          : const Duration(milliseconds: 1900),
    );
    _controller.forward().whenComplete(() {
      setState(() => _hidden = true);
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) setState(() => _gone = true);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_gone) return const SizedBox.shrink();
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final t = _controller.value;
    final reduced = MediaQuery.disableAnimationsOf(context);
    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedOpacity(
          opacity: _hidden ? 0 : 1,
          duration: const Duration(milliseconds: 700),
          curve: AppMotion.standard,
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, -0.16),
                radius: 1.2,
                colors: [const Color(0xFF171B12), tokens.bgDeep],
              ),
            ),
            child: Stack(
              children: [
                for (final mote in const [
                  (0.38, 0.3),
                  (0.60, 1.1),
                  (0.47, 2.0),
                ])
                  Positioned(
                    left: mote.$1 * 100,
                    bottom: 300,
                    child: _Mote(delay: mote.$2, t: t),
                  ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 104,
                        height: 104,
                        child: CustomPaint(
                          painter: _SproutPainter(tokens: tokens, t: t),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Opacity(
                        opacity: reduced ? 1 : ((t - 0.55) / 0.32).clamp(0.0, 1.0),
                        child: Transform.translate(
                          offset: Offset(
                            0,
                            reduced ? 0 : 8 * (1 - ((t - 0.55) / 0.32).clamp(0.0, 1.0)),
                          ),
                          child: Text(
                            'heartwood',
                            style: TextStyle(
                              fontFamily: 'Fraunces',
                              fontStyle: FontStyle.italic,
                              fontSize: 21,
                              letterSpacing: 0.4,
                              color: tokens.textSecondary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Opacity(
                        opacity: reduced ? 1 : ((t - 0.66) / 0.32).clamp(0.0, 1.0),
                        child: Transform.translate(
                          offset: Offset(
                            0,
                            reduced ? 0 : 8 * (1 - ((t - 0.66) / 0.32).clamp(0.0, 1.0)),
                          ),
                          child: Text(
                            'GROWING YOUR ARCHIVE',
                            style: TextStyle(
                              fontFamily: 'JetBrainsMono',
                              fontSize: 10.5,
                              letterSpacing: 1.7,
                              color: tokens.textTertiary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Mote extends StatelessWidget {
  final double delay;
  final double t;

  const _Mote({required this.delay, required this.t});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final local = ((t - delay / 3.4) % 1.0).clamp(0.0, 1.0);
    final opacity = local < 0.15
        ? (local / 0.15) * 0.7
        : local > 0.8
            ? (1 - local) / 0.2 * 0.7
            : 0.7;
    return Opacity(
      opacity: local <= 0 ? 0 : opacity,
      child: Transform.translate(
        offset: Offset(0, -70 * local),
        child: Transform.scale(
          scale: 0.6 + 0.4 * local,
          child: Container(
            width: 3,
            height: 3,
            decoration: BoxDecoration(
              color: tokens.accent,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class _SproutPainter extends CustomPainter {
  final AppTokens tokens;
  final double t;

  _SproutPainter({required this.tokens, required this.t});

  double _clampT(double start, double dur) => ((t - start) / dur).clamp(0.0, 1.0);

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.width / 2;
    final soilY = size.height * 0.75;
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = tokens.accent;

    // soil line
    final soil = _clampT(0.0, 0.26);
    stroke.strokeWidth = 1.4;
    stroke.color = tokens.accent.withValues(alpha: 0.5);
    canvas.drawLine(
      Offset(c - 20, soilY),
      Offset(c - 20 + 40 * soil, soilY),
      stroke,
    );
    // roots
    final root = _clampT(0.08, 0.55);
    stroke.color = tokens.accent.withValues(alpha: 0.45);
    stroke.strokeWidth = 1.3;
    final r1 = Path()
      ..moveTo(c, soilY)
      ..cubicTo(c - 4, soilY + 5, c - 6, soilY + 10, c - 5, soilY + 16);
    final r2 = Path()
      ..moveTo(c, soilY)
      ..cubicTo(c + 4, soilY + 5, c + 6, soilY + 10, c + 5, soilY + 16);
    _drawPartial(canvas, r1, stroke, root);
    _drawPartial(canvas, r2, stroke, root);
    // stem
    final stem = _clampT(0.08, 0.55);
    stroke.strokeWidth = 2;
    stroke.color = tokens.accent;
    final s = Path()..moveTo(c, soilY)..lineTo(c, size.height * 0.42);
    _drawPartial(canvas, s, stroke, stem);
    // left leaf
    final lf = _clampT(0.30, 0.45);
    stroke.strokeWidth = 1.7;
    final l1 = Path()
      ..moveTo(c, size.height * 0.56)
      ..cubicTo(c, size.height * 0.45, c - 8, size.height * 0.40, c - 18, size.height * 0.40)
      ..cubicTo(c - 16.5, size.height * 0.52, c - 8, size.height * 0.56, c, size.height * 0.56);
    _drawPartial(canvas, l1, stroke, lf);
    // right leaf
    final rf = _clampT(0.40, 0.45);
    final l2 = Path()
      ..moveTo(c, size.height * 0.48)
      ..cubicTo(c, size.height * 0.385, c + 7, size.height * 0.345, c + 17, size.height * 0.345)
      ..cubicTo(c + 15.7, size.height * 0.45, c + 8, size.height * 0.49, c, size.height * 0.48);
    _drawPartial(canvas, l2, stroke, rf);
    // ripple
    final ripple = _clampT(0.55, 0.5);
    canvas.drawCircle(
      Offset(c, soilY),
      30 * (0.3 + 1.6 * Curves.easeOut.transform(ripple)),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..color = tokens.accent.withValues(alpha: (1 - ripple) * 0.9),
    );
  }

  void _drawPartial(Canvas canvas, Path path, Paint paint, double progress) {
    final metric = path.computeMetrics().first;
    canvas.drawPath(
      metric.extractPath(0, metric.length * progress),
      paint,
    );
  }

  @override
  bool shouldRepaint(_SproutPainter old) => old.t != t || old.tokens != tokens;
}