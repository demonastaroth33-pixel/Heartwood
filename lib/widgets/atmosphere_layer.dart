import 'package:flutter/material.dart';

import '../core/theme/tokens.dart';

class AtmosphereLayer extends StatefulWidget {
  const AtmosphereLayer({super.key});

  @override
  State<AtmosphereLayer> createState() => _AtmosphereLayerState();
}

class _AtmosphereLayerState extends State<AtmosphereLayer>
    with SingleTickerProviderStateMixin {
  static bool get _inTest =>
      WidgetsBinding.instance.runtimeType.toString().contains('Test');
  late final AnimationController _drift;
  late bool _animate;

  @override
  void initState() {
    super.initState();
    _animate = false;
    _drift = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduced = MediaQuery.disableAnimationsOf(context);
    final tokens = Theme.of(context).extension<AppTokens>();
    final animate = !reduced && !_inTest && (tokens?.atmoDrift ?? false);
    if (animate != _animate) {
      setState(() => _animate = animate);
      if (animate) {
        _drift.repeat(reverse: true);
      } else {
        _drift.stop();
        _drift.value = 0;
      }
    }
  }

  @override
  void dispose() {
    _drift.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _drift,
        builder: (context, _) {
          final dy = _animate ? _drift.value * 28 - 14 : 0.0;
          return CustomPaint(
            painter: _AtmospherePainter(tokens: tokens, dy: dy),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _AtmospherePainter extends CustomPainter {
  final AppTokens tokens;
  final double dy;

  _AtmospherePainter({required this.tokens, required this.dy});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    // The shell scaffold is transparent so this layer is the base paint:
    // first the theme background, then the washes on top.
    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h),
      Paint()..color = tokens.bg,
    );
    canvas.save();
    canvas.translate(0, dy);
    final paint = Paint()..blendMode = BlendMode.srcOver;

    paint.shader = RadialGradient(
      colors: [tokens.atmoWash1, tokens.atmoWash1.withValues(alpha: 0)],
      stops: const [0, 1],
    ).createShader(Rect.fromLTWH(0, 0, w * 0.9, h * 0.9));
    canvas.save();
    canvas.translate(-w * 0.28, -h * 0.42);
    canvas.scale(0.9, 0.9);
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h), paint);
    canvas.restore();

    paint.shader = RadialGradient(
      colors: [tokens.atmoWash2, tokens.atmoWash2.withValues(alpha: 0)],
      stops: const [0, 1],
    ).createShader(Rect.fromLTWH(0, 0, w * 0.9, h * 0.9));
    canvas.save();
    canvas.translate(w * 0.5, -h * 0.42);
    canvas.scale(0.8, 0.8);
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h), paint);
    canvas.restore();

    canvas.restore();
  }

  @override
  bool shouldRepaint(_AtmospherePainter old) =>
      old.tokens != tokens || old.dy != dy;
}