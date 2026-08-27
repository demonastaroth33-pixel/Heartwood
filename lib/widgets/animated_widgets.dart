import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show RenderRepaintBoundary;

import '../core/app_boot.dart';
import '../core/device_pace.dart';
import '../core/theme/tokens.dart';

/// Stagger reveal on load — mirrors `.reveal.d1..d6`: fades up 10px with a
/// per-block delay once the loader is done. Gated on [AppBoot.complete] so
/// the sequence plays after the HTML splash fades, not underneath it.
class Reveal extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const Reveal({super.key, required this.child, this.delay = Duration.zero});

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  // Frame-count-paced: spans 18 rendered frames, visible at any fps.
  late final PacedAnimation _c =
      PacedAnimation(vsync: this, targetFrames: 18);
  bool _started = false;

  @override
  void initState() {
    super.initState();
    void go() {
      Future.delayed(widget.delay, () {
        if (mounted) {
          _started = true;
          _c.forward();
        }
      });
    }

    if (AppBoot.complete.value) {
      go();
    } else {
      AppBoot.complete.addListener(_onBoot);
    }
  }

  void _onBoot() {
    if (!AppBoot.complete.value) return;
    AppBoot.complete.removeListener(_onBoot);
    if (mounted) {
      Future.delayed(widget.delay, () {
        if (mounted) {
          _started = true;
          _c.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    AppBoot.complete.removeListener(_onBoot);
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = CurvedAnimation(parent: _c, curve: AppMotion.standard);
    // RepaintBoundary: during this block's reveal only THIS region
    // re-rasterizes; the rest of the scene blits from cache (CanvasKit has
    // no compositor, so isolating animated subtrees is the main lever).
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: t,
        builder: (context, child) {
          if (!_started) {
            return Opacity(opacity: 0, child: child);
          }
          return Opacity(
            opacity: t.value,
            child: Transform.translate(
              offset: Offset(0, 10 * (1 - t.value)),
              child: child,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}

/// Check-circle pop — scale 1 → 1.18 → 1, mirrors `@keyframes pop`.
/// Frame-count-paced (8 rendered frames) so the pop is visible at any fps.
class PopScale extends StatefulWidget {
  final bool active;
  final Widget child;

  const PopScale({super.key, required this.active, required this.child});

  @override
  State<PopScale> createState() => _PopScaleState();
}

class _PopScaleState extends State<PopScale> with SingleTickerProviderStateMixin {
  late final PacedAnimation _c =
      PacedAnimation(vsync: this, targetFrames: 8);
  bool _played = false;

  @override
  void didUpdateWidget(PopScale old) {
    super.didUpdateWidget(old);
    if (!old.active && widget.active && !_played) {
      _played = true;
      _c.forward();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, child) {
        final v = _c.value;
        final scale = widget.active ? 1 + 0.18 * Curves.easeOutBack.transform(v) * (1 - v) * 2 : 1.0;
        return Transform.scale(scale: scale, child: child);
      },
      child: widget.child,
    );
  }
}

/// Expanding ring spark from the check circle — mirrors `.check-spark`.
/// Frame-count-paced (14 rendered frames).
class CheckSpark extends StatefulWidget {
  final Key? sparkKey;
  final VoidCallback onDone;

  const CheckSpark({super.key, this.sparkKey, required this.onDone});

  @override
  State<CheckSpark> createState() => _CheckSparkState();
}

class _CheckSparkState extends State<CheckSpark>
    with SingleTickerProviderStateMixin {
  late final PacedAnimation _c = PacedAnimation(vsync: this, targetFrames: 14);
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _c.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_done) {
        _done = true;
        widget.onDone();
      }
    });
    _c.forward();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        final t = Curves.easeOut.transform(_c.value);
        return IgnorePointer(
          child: Transform.rotate(
            angle: 0.21 * _c.value,
            child: Transform.scale(
              scale: 0.4 + 1.3 * t,
              child: Opacity(
                opacity: (1 - _c.value) * 0.85,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: tokens.accent, width: 1.5),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Pop-in for tags / media thumbs — mirrors `@keyframes popIn`.
class PopIn extends StatefulWidget {
  final Widget child;

  const PopIn({super.key, required this.child});

  @override
  State<PopIn> createState() => _PopInState();
}

class _PopInState extends State<PopIn> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 340),
  )..forward();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, child) {
        final t = Curves.easeOutBack.transform(_c.value);
        return Opacity(
          opacity: _c.value,
          child: Transform.scale(scale: 0.65 + 0.35 * t, child: child),
        );
      },
      child: widget.child,
    );
  }
}

/// Hover lift — desktop only: card lifts 3px + gains the raised shadow.
/// Mirrors `.entry-card:hover`, `.plant-card:hover` (translateY(-3px) +
/// `--sh-raised`: 0 10px 30px -12px rgba(0,0,0,.55) over the flat ring).
class HoverLift extends StatefulWidget {
  final Widget child;
  final BorderRadius borderRadius;

  const HoverLift({
    super.key,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });

  @override
  State<HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<HoverLift> {
  bool _hover = false;

  static const _shadow = [
    BoxShadow(
      color: Color(0x8C000000),
      blurRadius: 16,
      offset: Offset(0, 10),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: DevicePace.durationForFrames(10),
        curve: AppMotion.standard,
        transform: Matrix4.translationValues(0, _hover ? -3 : 0, 0),
        // Isolates the hovered card so only this region re-rasterizes.
        child: RepaintBoundary(
          child: Stack(
            children: [
              // Raised drop shadow paints behind the card while hovering; the
              // card keeps its own flat hairline ring.
              Positioned.fill(
                child: AnimatedContainer(
                  duration: DevicePace.durationForFrames(10),
                  curve: AppMotion.standard,
                  decoration: BoxDecoration(
                    borderRadius: widget.borderRadius,
                    boxShadow: _hover ? _shadow : const [],
                  ),
                ),
              ),
              widget.child,
            ],
          ),
        ),
      ),
    );
  }
}

/// Hover rotate — mirrors `.compose-close:hover` / `.modal-close:hover` /
/// `.mv-close:hover` (rotate 90° + raised wash on hover). Uses AnimatedRotation
/// so the turn interpolates around the center (no matrix-lerp drift).
class HoverRotate extends StatefulWidget {
  final Widget child;
  final double size;
  final Color? idleColor;

  const HoverRotate({
    super.key,
    required this.child,
    this.size = 36,
    this.idleColor,
  });

  @override
  State<HoverRotate> createState() => _HoverRotateState();
}

class _HoverRotateState extends State<HoverRotate>
    with SingleTickerProviderStateMixin {
  bool _hover = false;

  // Live-paced: always spans 10 rendered frames via PacedAnimation
  // (reference-like ~165ms on fast machines, ~400ms at 25fps) — a quick,
  // clearly visible turn.
  late final PacedAnimation _rot =
      PacedAnimation(vsync: this, targetFrames: 10);
  static const _curve = Cubic(0.33, 0.1, 0.67, 0.9);

  @override
  void dispose() {
    _rot.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return MouseRegion(
      onEnter: (_) {
        setState(() => _hover = true);
        _rot.forward();
      },
      onExit: (_) {
        setState(() => _hover = false);
        _rot.reverse();
      },
      child: RepaintBoundary(
        child: AnimatedContainer(
          duration: DevicePace.durationForFrames(20),
          curve: _curve,
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: _hover ? tokens.surfaceRaised : Colors.transparent,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: _rot,
            builder: (context, child) => Transform.rotate(
              angle: _rot.value * 1.5708,
              child: child,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

/// Centered modal with a blurred backdrop + scale-in — mirrors the mock's
/// `.modal-backdrop` (backdrop-filter blur 7px, taps dismiss) +
/// `.habit-modal` scale-in. The route opens instantly; the VISIBLE entrance
/// (dim + card pop) is driven by a frame-count-paced pacer inside the page,
/// so the first paint is just the first step — the pop is visible at any
/// frame rate (the wall-clock route entrance was eaten by the first paint).
Future<T?> showBlurDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
}) {
  // The backdrop is captured once and pre-blurred (sigma 5), with the live
  // BackdropFilter as the fallback; the barrier must stay a uniform color
  // for the swap to remain pixel-identical.
  final capture = _BackdropCapture.start(context);
  return Navigator.of(context).push(
    BlurDialogRoute<T>(
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // The route itself opens/closes instantly (1ms); ALL visible motion
        // (dim, pop, close) is driven by the frame-paced pacer in
        // _ModalEntrance, so nothing is ever eaten by the first paint.
        return _ModalEntrance(
          capture: capture,
          barrierDismissible: barrierDismissible,
          onBarrierTap: () => Navigator.of(context).pop(),
          child: child,
        );
      },
      barrierDismissible: false,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 1),
      reverseTransitionDuration: const Duration(milliseconds: 1),
    ),
  );
}

/// Frame-paced modal entrance AND exit: dims the backdrop and pops the card
/// via a PacedAnimation (12 rendered frames each way), so both are smooth
/// and visible at any frame rate. Pops are intercepted (PopScope) — the
/// close runs the pacer in reverse, THEN the route is actually removed.
class _ModalEntrance extends StatefulWidget {
  final _BackdropCapture? capture;
  final bool barrierDismissible;
  final VoidCallback onBarrierTap;
  final Widget child;

  const _ModalEntrance({
    required this.capture,
    required this.barrierDismissible,
    required this.onBarrierTap,
    required this.child,
  });

  @override
  State<_ModalEntrance> createState() => _ModalEntranceState();
}

class _ModalEntranceState extends State<_ModalEntrance>
    with SingleTickerProviderStateMixin {
  // Frame-count-paced open: 10 rendered frames at ANY frame rate — the
  // adaptive framework's live pacer. (The close is intentionally instant;
  // the route pops with no animation.)
  late final PacedAnimation _pop =
      PacedAnimation(vsync: this, targetFrames: 10);

  @override
  void initState() {
    super.initState();
    _pop.forward();
  }

  @override
  void dispose() {
    _pop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pop,
      builder: (context, child) {
        final v = _pop.value;
        // easeOutCubic spreads the change across all frames (fast start,
        // soft landing) — the blur sigma, dim and card pop all move
        // together, so the blur never sits still then rushes.
        final eased = Curves.easeOutCubic.transform(v);
        return Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            _BakedBackdrop(capture: widget.capture, sigma: 5 * eased),
            Container(
              color: const Color(0xFF090A07).withValues(alpha: 0.62 * eased),
            ),
            GestureDetector(
              onTap: widget.barrierDismissible ? widget.onBarrierTap : null,
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: Transform.translate(
                  offset: Offset(0, 24 * (1 - v)),
                  child: Transform.scale(
                    scale: 0.92 + 0.08 * eased,
                    child: GestureDetector(
                      onTap: () {},
                      child: RepaintBoundary(child: child),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      child: widget.child,
    );
  }
}

/// Modal route with distinct open/close durations (both 1ms — ALL visible
/// motion lives in the frame-paced [_ModalEntrance], so the route itself
/// opens and closes instantly).
class BlurDialogRoute<T> extends PageRoute<T> {
  BlurDialogRoute({
    required RoutePageBuilder pageBuilder,
    required RouteTransitionsBuilder transitionsBuilder,
    this.barrierDismissible = true,
    this.barrierColor,
    this.barrierLabel = 'Dismiss',
    this.transitionDuration = const Duration(milliseconds: 1),
    this.reverseTransitionDuration = const Duration(milliseconds: 1),
    // ignore: prefer_initializing_formals
  })  : _pageBuilder = pageBuilder,
        // ignore: prefer_initializing_formals
        _transitionsBuilder = transitionsBuilder;

  final RoutePageBuilder _pageBuilder;
  final RouteTransitionsBuilder _transitionsBuilder;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  @override
  bool get opaque => false;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
          BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) =>
      _pageBuilder(context, animation, secondaryAnimation);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      _transitionsBuilder(context, animation, secondaryAnimation, child);
}

/// Global key on the app-home RepaintBoundary (wrapped in app.dart) — the
/// capture source for the pre-baked modal backdrop. Captures rail + body +
/// FAB: everything behind a centered modal.
final GlobalKey backdropCaptureKey = GlobalKey();

/// Captures the app scene once and pre-blurs it (sigma 5) so the modal
/// transition never re-blurs per frame; the live BackdropFilter stays as the
/// fallback until the baked image lands (or if capture is unavailable).
class _BackdropCapture {
  _BackdropCapture._(this._image, this._timer);

  final Future<ui.Image?> _image;
  final Timer _timer;

  Future<ui.Image?> get image => _image;

  void cancel() => _timer.cancel();

  static _BackdropCapture? start(BuildContext context) {
    final boundary = backdropCaptureKey.currentContext?.findRenderObject();
    if (boundary is! RenderRepaintBoundary) return null;
    final dpr = View.of(context).devicePixelRatio;
    final bounds = Offset.zero & boundary.size;
    final completer = Completer<ui.Image?>();
    // Generous budget: a full-screen capture + blur bake can take 60-200ms
    // on the target GPU; the fallback covers the interim, and the race branch
    // below disposes a late-arriving bake, so nothing leaks either way.
    final timer = Timer(const Duration(milliseconds: 1000), () {
      if (!completer.isCompleted) completer.complete(null);
    });
    // Defer the capture ~250ms so it does NOT race the modal's own first
    // paint on the GPU (that race was the perceived open delay). The baked
    // image replaces the live blur mid-entrance — pixel-identical swap, so
    // the delay is invisible.
    Future<void>.delayed(const Duration(milliseconds: 250), () {
      if (!completer.isCompleted) {
        unawaited(_capture(boundary, bounds, dpr, completer, timer));
      }
    });
    return _BackdropCapture._(completer.future, timer);
  }

  static Future<void> _capture(
    RenderRepaintBoundary boundary,
    Rect bounds,
    double dpr,
    Completer<ui.Image?> completer,
    Timer timer,
  ) async {
    try {
      final raw = await boundary.toImage(pixelRatio: dpr);
      final baked = await _bake(raw);
      timer.cancel();
      if (!completer.isCompleted) {
        completer.complete(baked);
      } else {
        // The timeout already resolved the fallback; dispose the late bake
        // instead of leaking a full-screen image.
        baked.dispose();
      }
    } catch (_) {
      timer.cancel();
      if (!completer.isCompleted) completer.complete(null);
    }
  }

  static Future<ui.Image> _bake(ui.Image raw) async {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    // Blur only (no dim — the dim is a separate ramped layer in the
    // entrance, so light-to-dark is smooth; the blur sigma is animated at
    // draw time, so sharp→blur is smooth too).
    canvas.drawImage(
      raw,
      Offset.zero,
      Paint()..imageFilter = ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
    );
    final picture = recorder.endRecording();
    try {
      return await picture.toImage(raw.width, raw.height);
    } finally {
      picture.dispose();
      raw.dispose();
    }
  }
}

/// Paints the pre-baked blurred backdrop with an ANIMATED sigma (0..5), so
/// the blur grows smoothly instead of snapping in. Isolated in its own
/// RepaintBoundary: the per-frame blur cost only occurs while the sigma is
/// changing (the entrance/exit); once static, the picture is cached and the
/// card's repaints never re-blur it.
class _BakedBackdrop extends StatefulWidget {
  final _BackdropCapture? capture;
  final double sigma;

  const _BakedBackdrop({required this.capture, required this.sigma});

  @override
  State<_BakedBackdrop> createState() => _BakedBackdropState();
}

class _BakedBackdropState extends State<_BakedBackdrop> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    widget.capture?.image.then((img) {
      if (img == null) return;
      if (mounted) {
        setState(() => _image = img);
      } else {
        img.dispose();
      }
    });
  }

  @override
  void dispose() {
    widget.capture?.cancel();
    _image?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image = _image;
    if (image == null) {
      // Capture unavailable/failed: live blur fallback (full strength).
      return BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: const SizedBox.expand(),
      );
    }
    return RepaintBoundary(
      child: CustomPaint(
        painter: _BakedBackdropPainter(image, widget.sigma),
      ),
    );
  }
}

class _BakedBackdropPainter extends CustomPainter {
  _BakedBackdropPainter(this.image, this.sigma);

  final ui.Image image;
  final double sigma;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    if (sigma > 0) {
      paint.imageFilter =
          ui.ImageFilter.blur(sigmaX: sigma, sigmaY: sigma);
    }
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      Offset.zero & size,
      paint,
    );
  }

  @override
  bool shouldRepaint(_BakedBackdropPainter old) =>
      old.image != image || old.sigma != sigma;
}