import 'package:flutter/material.dart';

import '../core/theme/tokens.dart';

/// Cold-start brand moment: the pill mark draws itself, the dot pops, the
/// wordmark rises, the breathing dots pulse — then the layer fades.
class AppLoader extends StatefulWidget {
  const AppLoader({super.key});

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  static const _total = Duration(milliseconds: 2000);
  late final AnimationController _controller;
  bool _hidden = false;
  bool _gone = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _total);
    _controller.forward().whenComplete(() {
      setState(() => _hidden = true);
      Future.delayed(const Duration(milliseconds: 400), () {
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
    final reduced = MediaQuery.disableAnimationsOf(context);
    final t = _controller.value;
    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedOpacity(
          opacity: _hidden ? 0 : 1,
          duration: const Duration(milliseconds: 320),
          curve: AppMotion.standard,
          child: ColoredBox(
            color: tokens.bg,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomPaint(
                    size: const Size(132, 64),
                    painter: _MarkPainter(tokens: tokens, progress: t),
                  ),
                  const SizedBox(height: 18),
                  Opacity(
                    opacity: reduced
                        ? 1
                        : ((t - 1.25) / 0.6).clamp(0.0, 1.0),
                    child: Transform.translate(
                      offset: Offset(
                        0,
                        reduced ? 0 : 4 * (1 - ((t - 1.25) / 0.6).clamp(0.0, 1.0)),
                      ),
                      child: Text(
                        'PersonalOS',
                        style: TextStyle(
                          fontSize: 13,
                          letterSpacing: 2.2,
                          color: tokens.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(3, (i) {
                      final pulse = reduced
                          ? 1.0
                          : _pulseAt(t, i * 0.18);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.lerp(
                              tokens.textDisabled,
                              tokens.accent,
                              pulse,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _pulseAt(double t, double phase) {
    final local = ((t - 1.45 - phase) / 1.4) % 1.0;
    if (local < 0) return 0;
    final up = (local * 2).clamp(0.0, 1.0);
    final down = (2 - local * 2).clamp(0.0, 1.0);
    return local < 0.5 ? up : down;
  }
}

class _MarkPainter extends CustomPainter {
  final AppTokens tokens;
  final double progress;

  _MarkPainter({required this.tokens, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(4, 4, size.width - 8, size.height - 8),
      Radius.circular((size.height - 8) / 2),
    );
    final path = Path()..addRRect(rect);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..color = tokens.accent;
    final metrics = path.computeMetrics().first;
    final draw = metrics.extractPath(0, metrics.length * progress.clamp(0.0, 1.0));
    canvas.drawPath(draw, paint);

    final dotT = ((progress - 1.05) / 0.5).clamp(0.0, 1.0);
    final scale = 0.4 + 0.6 * Curves.easeOut.transform(dotT);
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.scale(scale);
    canvas.drawCircle(
      Offset.zero,
      7,
      Paint()..color = tokens.accent.withValues(alpha: dotT),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(_MarkPainter old) =>
      old.progress != progress || old.tokens != tokens;
}