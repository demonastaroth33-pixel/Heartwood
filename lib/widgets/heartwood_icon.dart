import 'dart:math' as math;

import 'package:flutter/material.dart';

// ============================================================
// HEARTWOOD ICON SET — custom botanical-line icons, ported 1:1
// from design/heartwood/heartwood-m0.html <symbol> sprite. No icon font.
// ============================================================

enum HeartwoodIcon {
  mark,
  sprout,
  book,
  rings,
  leafgear,
  check,
  goldLeaf,
  search,
  plus,
  camera,
  export,
  chevron,
  moon,
  dots,
  tree1,
  tree2,
  tree3,
  seed,
  treeFull,
  treeElder,
  heartwood,
  leaf,
  x,
  warn,
}

class HeartwoodIconWidget extends StatelessWidget {
  final HeartwoodIcon icon;
  final double size;
  final Color color;
  final double? strokeWidth;

  const HeartwoodIconWidget({
    super.key,
    required this.icon,
    this.size = 20,
    this.color = const Color(0xFFA9C28C),
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _IconPainter(icon, color, strokeWidth),
    );
  }
}

class _IconPainter extends CustomPainter {
  final HeartwoodIcon icon;
  final Color color;
  final double? strokeOverride;

  _IconPainter(this.icon, this.color, [this.strokeOverride]);

  @override
  void paint(Canvas canvas, Size size) {
    if (icon == HeartwoodIcon.mark) {
      // The mark uses a 48-unit viewBox (all others use 24).
      canvas.scale(size.width / 48.0, size.height / 48.0);
      _mark(canvas, _strokePaint(), _fillPaint());
      return;
    }
    final s = size.width / 24.0;
    canvas.scale(s, s);
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = color;
    final fill = Paint()..color = color;

    void w(double w) {
      if (strokeOverride != null) {
        stroke.strokeWidth = strokeOverride!;
      } else {
        stroke.strokeWidth = w;
      }
    }
    void opacity(double o) => stroke.color = color.withValues(alpha: o);

    switch (icon) {
      case HeartwoodIcon.mark:
        break; // handled in the early return above
      case HeartwoodIcon.sprout:
        w(1.6);
        canvas.drawPath(svgPath('M12 21V11'), stroke);
        canvas.drawPath(svgPath('M12 12C12 8 9 6 5 6c0 4 3 7 7 7Z'), stroke);
        canvas.drawPath(svgPath('M12 9c0-3 2.5-5 6-5 0 3.5-2.5 5.5-6 5.5'), stroke);
      case HeartwoodIcon.book:
        w(1.5);
        canvas.drawPath(svgPath('M4 5.2C4 4.5 4.6 4 5.4 4H11c.8 0 1.4.6 1.4 1.4V20c0-.9-.7-1.6-1.6-1.6H4V5.2Z'), stroke);
        canvas.drawPath(svgPath('M20 5.2c0-.7-.6-1.2-1.4-1.2H13c-.8 0-1.4.6-1.4 1.4V20c0-.9.7-1.6 1.6-1.6h7V5.2Z'), stroke);
      case HeartwoodIcon.rings:
        w(1.4);
        canvas.drawCircle(const Offset(12, 12), 8.5, stroke);
        canvas.drawCircle(const Offset(12, 12), 5, stroke);
        canvas.drawCircle(const Offset(12, 12), 1.6, fill);
      case HeartwoodIcon.leafgear:
        w(1.5);
        canvas.drawCircle(const Offset(12, 12), 3.4, stroke);
        w(1.4);
        canvas.drawPath(svgPath('M12 2.5c1 1.8 1 3.4 0 5M12 21.5c1-1.8 1-3.4 0-5M21.5 12c-1.8 1-3.4 1-5 0M2.5 12c1.8-1 3.4-1 5 0M18.6 5.4c-.4 2-1.4 3.2-3 4M5.4 18.6c.4-2 1.4-3.2 3-4M18.6 18.6c-2-.4-3.2-1.4-4-3M5.4 5.4c2 .4 3.2 1.4 4 3'), stroke);
      case HeartwoodIcon.check:
        w(2);
        canvas.drawPath(svgPath('M5 12.5 10 17 19 7'), stroke);
      case HeartwoodIcon.goldLeaf:
        w(1.6);
        canvas.drawPath(svgPath('M12 21c6-1 9-6 9-14C13 7 6 10 6 16c0 1.5.4 2.7 1 3.6'), stroke);
        w(1.4);
        canvas.drawPath(svgPath('M6.5 19.5 15 11'), stroke);
      case HeartwoodIcon.search:
        w(1.6);
        canvas.drawCircle(const Offset(10.5, 10.5), 6.5, stroke);
        canvas.drawPath(svgPath('M19.5 19.5 15 15'), stroke);
      case HeartwoodIcon.plus:
        w(1.8);
        canvas.drawPath(svgPath('M12 5v14M5 12h14'), stroke);
      case HeartwoodIcon.camera:
        w(1.5);
        canvas.drawPath(svgPath('M4 8.5A1.5 1.5 0 0 1 5.5 7H8l1.2-1.8h5.6L16 7h2.5A1.5 1.5 0 0 1 20 8.5v9A1.5 1.5 0 0 1 18.5 19h-13A1.5 1.5 0 0 1 4 17.5v-9Z'), stroke);
        canvas.drawCircle(const Offset(12, 13), 3.2, stroke);
      case HeartwoodIcon.export:
        w(1.6);
        canvas.drawPath(svgPath('M12 15V4M8 8l4-4 4 4'), stroke);
        canvas.drawPath(svgPath('M4.5 15v3.5A1.5 1.5 0 0 0 6 20h12a1.5 1.5 0 0 0 1.5-1.5V15'), stroke);
      case HeartwoodIcon.chevron:
        w(1.8);
        canvas.drawPath(svgPath('M9 5l7 7-7 7'), stroke);
      case HeartwoodIcon.moon:
        w(1.5);
        canvas.drawPath(svgPath('M20 14.5A8.5 8.5 0 1 1 9.5 4a7 7 0 0 0 10.5 10.5Z'), stroke);
      case HeartwoodIcon.dots:
canvas.drawCircle(const Offset(5, 12), 1.6, fill);
        canvas.drawCircle(const Offset(12, 12), 1.6, fill);
        canvas.drawCircle(const Offset(19, 12), 1.6, fill);
      case HeartwoodIcon.tree1:
        canvas.drawPath(svgPath('M12 21V16'), stroke);
        w(1.5);
        canvas.drawPath(svgPath('M12 17c0-3-2.2-4.3-5-4.3.2 3.3 2.4 4.3 5 4.3Z'), stroke);
      case HeartwoodIcon.tree2:
        w(1.6);
        canvas.drawPath(svgPath('M12 21V13'), stroke);
        w(1.5);
        canvas.drawPath(svgPath('M12 15c0-4-2.8-5.6-6.4-5.6.3 4.2 3 5.6 6.4 5.6Z'), stroke);
        canvas.drawPath(svgPath('M12 12c0-3.4 2.2-4.8 5.2-4.8-.2 3.4-2.4 4.8-5.2 4.8Z'), stroke);
      case HeartwoodIcon.tree3:
        w(1.6);
        canvas.drawPath(svgPath('M12 21V9'), stroke);
        w(1.5);
        canvas.drawPath(svgPath('M12 12c0-4.6-3-6.4-7-6.4.3 4.6 3.2 6.4 7 6.4Z'), stroke);
        canvas.drawPath(svgPath('M12 9c0-3.8 2.6-5.4 6-5.4-.3 3.8-2.7 5.4-6 5.4Z'), stroke);
        opacity(0.8);
        w(1.3);
        canvas.drawPath(svgPath('M12 15.5c0-2.6-1.8-3.7-4.2-3.7.2 2.6 1.9 3.7 4.2 3.7Z'), stroke);
      case HeartwoodIcon.seed:
        opacity(0.55);
        w(1.4);
        canvas.drawPath(svgPath('M4 18c4-1 16-1 16 0'), stroke);
        stroke.color = color;
        w(1.6);
        canvas.drawOval(
          Rect.fromCenter(center: const Offset(12, 15.2), width: 6.2, height: 8.2),
          stroke,
        );
        opacity(0.7);
        w(1.3);
        canvas.drawPath(svgPath('M12 11.1c.5-2.4 1.8-3.4 3.4-3.7'), stroke);
      case HeartwoodIcon.treeFull:
        w(1.8);
        canvas.drawPath(svgPath('M12 21V11.5'), stroke);
        w(1.5);
        canvas.drawPath(svgPath('M12 13.5c-4.5 1-7.5-1.6-7.2-5.4C8.6 6.6 12 8.4 12 13.5Z'), stroke);
        canvas.drawPath(svgPath('M12 12c4.2 1.2 7.4-1 7.3-4.7-3.9-1.7-7.5.1-7.3 4.7Z'), stroke);
        opacity(0.85);
        w(1.3);
        canvas.drawPath(svgPath('M12 16.2c-2.6.6-4.6-.9-4.5-3.4 2.4-1 4.6.3 4.5 3.4Z'), stroke);
        canvas.drawPath(svgPath('M12 15c2.8.7 4.9-.8 4.8-3.4-2.6-1-4.9.4-4.8 3.4Z'), stroke);
      case HeartwoodIcon.treeElder:
        w(2);
        canvas.drawPath(svgPath('M12 21v-9.5'), stroke);
        fill.color = color.withValues(alpha: 0.6);
        canvas.drawCircle(const Offset(12.9, 14.6), 1, fill);
        opacity(0.55);
        w(1.2);
        canvas.drawPath(svgPath('M8.5 21c-.5-1.8 0-3 1.2-3.8M15.5 21c.5-1.8 0-3-1.2-3.8'), stroke);
        stroke.color = color;
        w(1.5);
        canvas.drawPath(svgPath('M12 13c0-4.4-3.4-6-7.4-5 .6 4.6 3.8 5.7 7.4 5Z'), stroke);
        opacity(0.8);
        w(1.2);
        canvas.drawPath(svgPath('M12 11.2c0-4-3-6-6.6-5.6 1 3.8 3.3 6 6.6 5.6Z'), stroke);
        opacity(0.5);
        w(1.1);
        canvas.drawPath(svgPath('M9.5 13.5c-.3 2.4-1.6 4-3.6 4.6'), stroke);
        stroke.color = color;
        w(1.5);
        canvas.drawPath(svgPath('M12 12.6c0-4.4 3.6-6.2 7.6-5.4-.7 4.6-4 5.8-7.6 5.4Z'), stroke);
        opacity(0.5);
        w(1.1);
        canvas.drawPath(svgPath('M14 14.2c.5 2.2 1.9 3.6 3.8 4'), stroke);
      case HeartwoodIcon.heartwood:
        w(1.5);
        canvas.drawCircle(const Offset(12, 12), 9, stroke);
        opacity(0.8);
        w(1.3);
        canvas.drawCircle(const Offset(12, 12), 6.2, stroke);
        opacity(0.65);
        w(1.2);
        canvas.drawCircle(const Offset(12, 12), 3.6, stroke);
        opacity(0.5);
        w(1);
        canvas.drawPath(svgPath('M12 12c.6-2 2-2.9 3.4-3.1'), stroke);
        canvas.drawPath(svgPath('M12 12c-.9-1.6-.6-3.2.3-4.4'), stroke);
        canvas.drawCircle(const Offset(12, 12), 1.2, fill);
      case HeartwoodIcon.leaf:
        w(1.5);
        canvas.drawPath(svgPath('M5 19c9 1 14-4 14-13-9-1-14 4-14 13Z'), stroke);
        opacity(0.7);
        w(1.2);
        canvas.drawPath(svgPath('M5.5 18.5 15 9'), stroke);
      case HeartwoodIcon.x:
        w(1.6);
        canvas.drawPath(svgPath('M6 6l12 12M18 6L6 18'), stroke);
      case HeartwoodIcon.warn:
        w(1.6);
        canvas.drawPath(svgPath('M12 3 2.5 20h19L12 3Z'), stroke);
        canvas.drawPath(svgPath('M12 10v4.5'), stroke);
        canvas.drawCircle(const Offset(12, 17.2), 0.9, fill);
    }
  }

  Paint _strokePaint() => Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..color = color;

  Paint _fillPaint() => Paint()..color = color;

  void _mark(Canvas canvas, Paint stroke, Paint fill) {
    void withOpacity(double o) => stroke.color = color.withValues(alpha: o);
    stroke.strokeWidth = 1;
    withOpacity(0.28);
    canvas.drawCircle(const Offset(24, 27), 16, stroke);
    withOpacity(0.48);
    canvas.drawCircle(const Offset(24, 27), 10.5, stroke);
    withOpacity(0.72);
    canvas.drawCircle(const Offset(24, 27), 5, stroke);
    canvas.drawCircle(const Offset(24, 27), 1.5, fill);
    withOpacity(1);
    stroke.strokeWidth = 1.6;
    canvas.drawPath(svgPath('M24 17V8.5'), stroke);
    stroke.strokeWidth = 1.4;
    canvas.drawPath(svgPath('M24 12.2c0-4-3-5.9-6.8-5.5.6 3.8 3.2 5.9 6.8 5.5Z'), stroke);
    canvas.drawPath(svgPath('M24 12.2c0-4 3-5.9 6.8-5.5-.6 3.8-3.2 5.9-6.8 5.5Z'), stroke);
  }

  @override
  bool shouldRepaint(_IconPainter old) => old.icon != icon || old.color != color;
}

/// Full SVG path parser (M/L/H/V/C/Q/A/Z, relative + implicit repeats,
/// compact numbers) shared by every glyph and the hero rings sprout.
Path svgPath(String d) {
  final path = Path();
  final re = RegExp(r'([MmLlHhVvCcQqAaZz])s*([^MmLlHhVvCcQqAaZz]*)');
  var x = 0.0, y = 0.0;
  var startX = 0.0, startY = 0.0;

  void lineAbs(double nx, double ny) {
    x = nx;
    y = ny;
    path.lineTo(x, y);
  }

  void curveAbs(double c1x, double c1y, double c2x, double c2y, double nx, double ny) {
    path.cubicTo(c1x, c1y, c2x, c2y, nx, ny);
    x = nx;
    y = ny;
  }

  void quadAbs(double c1x, double c1y, double nx, double ny) {
    path.quadraticBezierTo(c1x, c1y, nx, ny);
    x = nx;
    y = ny;
  }

  // SVG elliptical arc (endpoint parameterization) approximated with cubic
  // Bezier segments split into <=90 degrees; handles rotated ellipses.
  void arcAbs(double rx, double ry, double rotDeg, bool largeArc, bool sweep,
      double nx, double ny) {
    final x1 = x, y1 = y, x2 = nx, y2 = ny;
    if (x1 == x2 && y1 == y2) return;
    rx = rx.abs();
    ry = ry.abs();
    final phi = rotDeg * math.pi / 180;
    final cosP = math.cos(phi), sinP = math.sin(phi);
    final dx2 = (x1 - x2) / 2, dy2 = (y1 - y2) / 2;
    final x1p = cosP * dx2 + sinP * dy2;
    final y1p = -sinP * dx2 + cosP * dy2;
    final rx2 = rx * rx, ry2 = ry * ry;
    final x1p2 = x1p * x1p, y1p2 = y1p * y1p;
    final lambda = x1p2 / rx2 + y1p2 / ry2;
    if (lambda > 1) {
      final s = math.sqrt(lambda);
      rx *= s;
      ry *= s;
    }
    final rx2b = rx * rx, ry2b = ry * ry;
    final num = rx2b * ry2b - rx2b * y1p2 - ry2b * x1p2;
    final den = rx2b * y1p2 + ry2b * x1p2;
    final coef =
        (largeArc == sweep ? -1 : 1) * math.sqrt(math.max(0, num / den));
    final cxp = coef * ((rx * y1p) / ry);
    final cyp = coef * (-(ry * x1p) / rx);
    final cx = cosP * cxp - sinP * cyp + (x1 + x2) / 2;
    final cy = sinP * cxp + cosP * cyp + (y1 + y2) / 2;
    double angle(double ux, double uy, double vx, double vy) {
      final dot = ux * vx + uy * vy;
      final len = math.sqrt((ux * ux + uy * uy) * (vx * vx + vy * vy));
      final a = math.acos((dot / len).clamp(-1.0, 1.0));
      return (ux * vy - uy * vx < 0) ? -a : a;
    }

    final theta1 = angle(1, 0, (x1p - cxp) / rx, (y1p - cyp) / ry);
    var dtheta = angle((x1p - cxp) / rx, (y1p - cyp) / ry,
        (-x1p - cxp) / rx, (-y1p - cyp) / ry);
    if (!sweep && dtheta > 0) dtheta -= 2 * math.pi;
    if (sweep && dtheta < 0) dtheta += 2 * math.pi;

    Offset onEllipse(double t) {
      final ex = rx * math.cos(t), ey = ry * math.sin(t);
      return Offset(cx + cosP * ex - sinP * ey, cy + sinP * ex + cosP * ey);
    }

    Offset tangent(double t) {
      final tx = -rx * math.sin(t), ty = ry * math.cos(t);
      return Offset(cosP * tx - sinP * ty, sinP * tx + cosP * ty);
    }

    final segments = math.max(1, (dtheta.abs() / (math.pi / 2)).ceil());
    final step = dtheta / segments;
    for (var i = 0; i < segments; i++) {
      final t1 = theta1 + step * i;
      final t2 = t1 + step;
      final p1 = onEllipse(t1), p2 = onEllipse(t2);
      final alpha = 4 / 3 * math.tan(step / 4);
      final c1 = p1 + tangent(t1) * alpha;
      final c2 = p2 - tangent(t2) * alpha;
      path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, p2.dx, p2.dy);
    }
    x = nx;
    y = ny;
  }

  for (final m in re.allMatches(d)) {
    final cmd = m.group(1)!;
    final nums = RegExp(r'-?\d*\.?\d+(?:[eE][-+]?\d+)?')
        .allMatches(m.group(2) ?? '')
        .map((n) => double.parse(n.group(0)!))
        .toList();
    var i = 0;
    var c = cmd;
    var first = true;
    while (i < nums.length) {
      final uc = c.toUpperCase();
      final isFirst = first;
      first = false;
      final rel = c != c.toUpperCase();
      var consumed = 0;
      switch (uc) {
        case 'M':
          consumed = 2;
          if (i + consumed <= nums.length) {
            final nx = rel ? x + nums[i] : nums[i];
            final ny = rel ? y + nums[i + 1] : nums[i + 1];
            if (isFirst) {
              path.moveTo(nx, ny);
              startX = nx;
              startY = ny;
            } else {
              lineAbs(nx, ny);
            }
            x = nx;
            y = ny;
            c = cmd == 'm' ? 'l' : 'L';
          }
        case 'L':
          consumed = 2;
          if (i + consumed <= nums.length) {
            lineAbs(rel ? x + nums[i] : nums[i], rel ? y + nums[i + 1] : nums[i + 1]);
          }
        case 'H':
          consumed = 1;
          if (i + consumed <= nums.length) {
            lineAbs(rel ? x + nums[i] : nums[i], y);
          }
        case 'V':
          consumed = 1;
          if (i + consumed <= nums.length) {
            lineAbs(x, rel ? y + nums[i] : nums[i]);
          }
        case 'C':
          consumed = 6;
          if (i + consumed <= nums.length) {
            final c1x = rel ? x + nums[i] : nums[i];
            final c1y = rel ? y + nums[i + 1] : nums[i + 1];
            final c2x = rel ? x + nums[i + 2] : nums[i + 2];
            final c2y = rel ? y + nums[i + 3] : nums[i + 3];
            final nx = rel ? x + nums[i + 4] : nums[i + 4];
            final ny = rel ? y + nums[i + 5] : nums[i + 5];
            curveAbs(c1x, c1y, c2x, c2y, nx, ny);
          }
        case 'Q':
          consumed = 4;
          if (i + consumed <= nums.length) {
            quadAbs(rel ? x + nums[i] : nums[i], rel ? y + nums[i + 1] : nums[i + 1],
                rel ? x + nums[i + 2] : nums[i + 2], rel ? y + nums[i + 3] : nums[i + 3]);
          }
        case 'A':
          if (i + 7 <= nums.length) {
            final rx = nums[i], ry = nums[i + 1];
            final rot = nums[i + 2];
            final large = nums[i + 3] != 0;
            final sweep = nums[i + 4] != 0;
            var j = i + 5;
            while (j + 1 < nums.length) {
              final nx = rel ? x + nums[j] : nums[j];
              final ny = rel ? y + nums[j + 1] : nums[j + 1];
              arcAbs(rx, ry, rot, large, sweep, nx, ny);
              j += 2;
            }
            i = j;
            continue;
          }
        case 'Z':
          consumed = 1;
          path.close();
          x = startX;
          y = startY;
      }
      if (consumed == 0) break;
      i += consumed;
    }
  }
  return path;
}
