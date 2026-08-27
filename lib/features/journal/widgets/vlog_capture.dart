import 'dart:async';

import 'package:flutter/material.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/services/media/media_capture.dart';
import 'package:personalos/services/web/video_view.dart';
import 'package:personalos/widgets/core_widgets.dart';
import 'package:personalos/widgets/heartwood_icon.dart';

/// Result of the keep/discard review.
class VlogResult {
  final CapturedMedia media;
  final String? title;

  VlogResult(this.media, this.title);
}

/// Runs the G5 capture overlay (live preview + REC + stop) then the G4
/// keep/discard review. Returns the kept media, or null if discarded/cancelled.
Future<VlogResult?> runVlogCapture(
  BuildContext context,
  MediaCaptureService capture,
) async {
  final session = await capture.startVlog();
  if (session == null) return null;
  if (!context.mounted) return null;

  CapturedMedia? captured;
  final cancelled = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black,
    builder: (_) => _CaptureOverlay(session: session),
  );
  if (cancelled == true) {
    try {
      captured = await session.stop();
    } catch (_) {}
  } else {
    try {
      captured = await session.stop();
    } catch (_) {}
    // Cancelled mid-recording → discard silently.
    return null;
  }
  if (captured == null || !context.mounted) return null;

  return showDialog<VlogResult>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _VlogReview(media: captured!),
  );
}

class _CaptureOverlay extends StatefulWidget {
  final VlogSession session;

  const _CaptureOverlay({required this.session});

  @override
  State<_CaptureOverlay> createState() => _CaptureOverlayState();
}

class _CaptureOverlayState extends State<_CaptureOverlay> {
  Timer? _timer;
  int _secs = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _secs++);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _fmt() {
    final m = (_secs ~/ 60).toString();
    final s = (_secs % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: tokens.bgDeep,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 20, 28, 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(false),
                    child: HeartwoodIconWidget(
                      icon: HeartwoodIcon.x,
                      size: 15,
                      color: tokens.textTertiary,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0C0E0A).withValues(alpha: 0.72),
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: tokens.rust,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'REC',
                          style: TextStyle(
                            fontFamily: 'JetBrainsMono',
                            fontSize: 10,
                            letterSpacing: 0.1,
                            color: tokens.paper,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0C0E0A).withValues(alpha: 0.72),
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                    ),
                    child: Text(
                      _fmt(),
                      style: TextStyle(
                        fontFamily: 'JetBrainsMono',
                        fontSize: 12,
                        color: tokens.paper,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 28),
                decoration: BoxDecoration(
                  color: const Color(0xFF10130D),
                  borderRadius: BorderRadius.circular(AppRadius.xl),
                  boxShadow: [
                    BoxShadow(color: tokens.hairlineStrong),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    // grid overlay — BEHIND the preview so lines never
                    // sit on top of the camera feed.
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _GridPainter(
                          color: tokens.hairline.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                    // Live preview when the session exposes a stream.
                    if (widget.session.previewHandle != null)
                      Positioned.fill(
                        child: LivePreview(
                          streamHandle: widget.session.previewHandle,
                        ),
                      )
                    else
                      Positioned.fill(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeartwoodIconWidget(
                                icon: HeartwoodIcon.camera,
                                size: 34,
                                color: tokens.textTertiary.withValues(alpha: 0.65),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'LIVE CAMERA PREVIEW',
                                style: TextStyle(
                                  fontFamily: 'JetBrainsMono',
                                  fontSize: 11,
                                  letterSpacing: 0.14,
                                  color: tokens.textTertiary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    // frame
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: tokens.hairline),
                            borderRadius: BorderRadius.circular(AppRadius.lg),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '720P CAP · 2 MBPS',
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontSize: 9.5,
                      letterSpacing: 0.12,
                      color: tokens.textTertiary,
                    ),
                  ),
                  const SizedBox(width: 30),
                  GestureDetector(
                    key: const Key('capture-stop'),
                    onTap: () => Navigator.of(context).pop(true),
                    child: Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: tokens.paper, width: 3),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: 27,
                        height: 27,
                        decoration: BoxDecoration(
                          color: tokens.rust,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    'MEDIARECORDER',
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontSize: 9.5,
                      letterSpacing: 0.12,
                      color: tokens.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color color;

  _GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    for (var x = 0.0; x < size.width; x += 44) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (var y = 0.0; y < size.height; y += 44) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => old.color != color;
}

class _VlogReview extends StatefulWidget {
  final CapturedMedia media;

  const _VlogReview({required this.media});

  @override
  State<_VlogReview> createState() => _VlogReviewState();
}

class _VlogReviewState extends State<_VlogReview> {
  final _title = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final dur = widget.media.durationSec ?? 0;
    final m = (dur ~/ 60).toString();
    final s = (dur % 60).toString().padLeft(2, '0');
    return Dialog(
      backgroundColor: tokens.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        side: BorderSide(color: tokens.hairline),
      ),
      child: Container(
        width: 360,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: tokens.bgDeep,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: tokens.hairlineStrong),
              ),
              alignment: Alignment.center,
              child: HeartwoodIconWidget(
                icon: HeartwoodIcon.camera,
                size: 34,
                color: tokens.accent.withValues(alpha: 0.85),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Keep this vlog?',
              style: TextStyle(
                fontFamily: 'Fraunces',
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: tokens.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '$m:$s · attached to this entry',
              style: TextStyle(
                fontFamily: 'JetBrainsMono',
                fontSize: 11.5,
                color: tokens.textTertiary,
              ),
            ),
            const SizedBox(height: 14),
            const FieldLabel(text: 'Title (optional)'),
            FieldInput(
              controller: _title,
              hint: 'e.g. Kitchen light walkthrough',
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    decoration: BoxDecoration(
                      color: tokens.surfaceRaised,
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                      border: Border.all(color: tokens.hairlineStrong),
                    ),
                    child: Row(
                      children: [
                        HeartwoodIconWidget(
                          icon: HeartwoodIcon.x,
                          size: 14,
                          color: tokens.rust,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Discard',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: tokens.rust,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PillButton(
                  label: 'Keep',
                  icon: HeartwoodIcon.check,
                  onPressed: () {
                    final t = _title.text.trim();
                    Navigator.of(context).pop(
                      VlogResult(
                        CapturedMedia(
                          bytes: widget.media.bytes,
                          mimeType: widget.media.mimeType,
                          durationSec: widget.media.durationSec,
                          fileName: t.isEmpty
                              ? widget.media.fileName
                              : t,
                        ),
                        t.isEmpty ? null : t,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}