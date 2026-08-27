import 'package:flutter/material.dart';

import '../core/device_pace.dart';
import '../core/theme/tokens.dart';
import 'animated_widgets.dart';
import 'heartwood_icon.dart';

/// Card with the Heartwood flat treatment: surface + hairline ring,
/// radius-lg. Mirrors `.card` in the mock.
class BlockCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BoxShadow? shadow;

  const BlockCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.margin = EdgeInsets.zero,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: tokens.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: shadow != null
            ? [shadow!]
            : [BoxShadow(color: tokens.hairline, spreadRadius: 1)],
      ),
      child: child,
    );
  }
}

/// Card title row: Fraunces title left, quiet accent link right. Mirrors
/// `.card-title-row` / `.card-title` / `.card-link`.
class CardTitleRow extends StatelessWidget {
  final String title;
  final String? linkLabel;
  final VoidCallback? onLink;

  const CardTitleRow({super.key, required this.title, this.linkLabel, this.onLink});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Fraunces',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: tokens.textPrimary,
              ),
            ),
          ),
if (linkLabel != null)
            InkWell(
              onTap: onLink,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    linkLabel!,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: tokens.accent,
                    ),
                  ),
                  const SizedBox(width: 3),
                  HeartwoodIconWidget(
                    icon: HeartwoodIcon.chevron,
                    size: 13,
                    color: tokens.accent,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// The signature pill button. Mirrors `.pill-btn` / `.pill-btn.ghost` /
/// `.pill-btn.disabled` / `.pill-btn.success`.
class PillButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final HeartwoodIcon? icon;
  final bool ghost;
  final bool disabled;
  final double height;
  final bool success;
  final bool iconRotated180;

  const PillButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.ghost = false,
    this.disabled = false,
    this.height = 44,
    this.success = false,
    this.iconRotated180 = false,
  });

  @override
  State<PillButton> createState() => _PillButtonState();
}

class _PillButtonState extends State<PillButton> {
  bool _hover = false;

  static const _shadowIdle = [
    BoxShadow(
      color: Color(0x73A9C28C),
      blurRadius: 14,
      offset: Offset(0, 8),
    ),
  ];
  static const _shadowHover = [
    BoxShadow(
      color: Color(0x99A9C28C),
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final isDisabled = widget.disabled || widget.onPressed == null;
    return Opacity(
      opacity: isDisabled ? 0.38 : 1,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTap: isDisabled ? null : widget.onPressed,
          child: AnimatedContainer(
            duration: DevicePace.durationForFrames(8),
            curve: AppMotion.standard,
            transform: Matrix4.translationValues(
              0,
              _hover && !isDisabled ? -1 : 0,
              0,
            ),
            height: widget.height,
            padding: const EdgeInsets.symmetric(horizontal: 22),
            decoration: BoxDecoration(
              color: widget.ghost ? tokens.surfaceRaised : tokens.accent,
              borderRadius: BorderRadius.circular(AppRadius.pill),
              border: widget.ghost
                  ? Border.all(color: tokens.hairlineStrong)
                  : null,
              boxShadow: widget.ghost
                  ? null
                  : _hover
                      ? _shadowHover
                      : _shadowIdle,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  PopIn(
                    key: ValueKey('${widget.icon}-${widget.success}'),
                    child: Transform.rotate(
                      angle: widget.iconRotated180 ? 3.14159 : 0,
                      child: HeartwoodIconWidget(
                        icon: widget.success ? HeartwoodIcon.check : widget.icon!,
                        size: 15,
                        color: widget.ghost ? tokens.textPrimary : tokens.accentInk,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color:
                        widget.ghost ? tokens.textPrimary : tokens.accentInk,
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

/// Eyebrow mono label (uppercase, tracked). Mirrors `.eyebrow`.
class Eyebrow extends StatelessWidget {
  final String text;
  final Color? color;

  const Eyebrow({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontFamily: 'JetBrainsMono',
        fontSize: 11,
        letterSpacing: 0.14,
        fontWeight: FontWeight.w500,
        color: color ?? tokens.textTertiary,
      ),
    );
  }
}

/// Screen header row: Fraunces title left, optional pill action right.
/// Mirrors `.screen-head` (margin 34px top, 22px bottom).
class ScreenHeader extends StatelessWidget {
  final String title;
  final Widget? action;

  const ScreenHeader({super.key, required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34, bottom: 22),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Fraunces',
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Color(0xFFF1EFE2),
              ),
            ),
          ),
          ?action,
        ],
      ),
    );
  }
}

/// Search pill — inert in M0 (search is J2, later). Mirrors `.search-pill`.
class SearchPill extends StatelessWidget {
  final String hint;
  final bool fullWidth;

  const SearchPill({super.key, required this.hint, this.fullWidth = false});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      width: fullWidth ? double.infinity : 280,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: tokens.surface,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: tokens.hairline),
      ),
      child: Row(
        children: [
          HeartwoodIconWidget(
            icon: HeartwoodIcon.search,
            size: 15,
            color: tokens.textTertiary,
          ),
          const SizedBox(width: 9),
          Text(
            hint,
            style: TextStyle(fontSize: 13, color: tokens.textTertiary),
          ),
        ],
      ),
    );
  }
}

/// Chip (filter / tag). Mirrors `.chip` / `.chip.active`.
class ChipPill extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback? onTap;
  final bool withLeaf;

  const ChipPill({
    super.key,
    required this.label,
    this.active = false,
    this.onTap,
    this.withLeaf = false,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          color: active ? Colors.transparent : tokens.surface,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(
            color: active ? Colors.transparent : tokens.hairline,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (withLeaf) ...[
              HeartwoodIconWidget(
                icon: HeartwoodIcon.leaf,
                size: 10.5,
                color: active ? tokens.accent : tokens.textSecondary,
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: active ? tokens.accent : tokens.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Life-area chip (with leaf). Mirrors `.chip.life-chip`.
class LifeChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const LifeChip({
    super.key,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          color: active ? tokens.accentWash : tokens.surface,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(
            color: active ? Colors.transparent : tokens.hairline,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeartwoodIconWidget(
              icon: HeartwoodIcon.leaf,
              size: 10.5,
              color: active ? tokens.accent : tokens.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: active ? tokens.accent : tokens.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Dashed outline — mirrors the mock's 1.5px dashed hairline surfaces
/// (`.habit-add-card`, `.journal-empty`, `.add-tag-btn`).
class DashedBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double width;
  final double radius;

  const DashedBorder({
    super.key,
    required this.child,
    required this.color,
    this.width = 1.5,
    this.radius = AppRadius.lg,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedPainter(color: color, width: width, radius: radius),
      child: child,
    );
  }
}

class _DashedPainter extends CustomPainter {
  final Color color;
  final double width;
  final double radius;

  _DashedPainter({required this.color, required this.width, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    const dash = 6.0;
    const gap = 5.0;
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );
    final path = Path()..addRRect(rrect);
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = (distance + dash).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance = end + gap;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedPainter old) =>
      old.color != color || old.width != width || old.radius != radius;
}

/// Field input. Mirrors `.field-input` (radius-md, raised fill, hairline
/// border, accent focus ring). [titleStyle] applies the Fraunces title field.
class FieldInput extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final bool multiline;
  final bool autoGrow;
  final TextStyle? textStyle;
  final ValueChanged<String>? onChanged;
  final int minLines;
  final Widget? suffix;
  final EdgeInsetsGeometry contentPadding;

  const FieldInput({
    super.key,
    required this.controller,
    this.hint,
    this.multiline = false,
    this.autoGrow = false,
    this.textStyle,
    this.onChanged,
    this.minLines = 1,
    this.suffix,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 13,
    ),
  });

  @override
  State<FieldInput> createState() => _FieldInputState();
}

class _FieldInputState extends State<FieldInput> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    // Textareas mirror the mock's `textarea.field-input` line-height 1.65.
    final base = TextStyle(
      fontFamily: 'Inter',
      fontSize: 14.5,
      height: widget.multiline ? 1.65 : 1.2,
      color: tokens.textPrimary,
    );
    final hint = (widget.textStyle ?? base).copyWith(
      color: tokens.textTertiary,
      fontSize: widget.textStyle != null ? null : 14.5,
      height: widget.multiline ? 1.65 : 1.2,
    );
    return Container(
      decoration: BoxDecoration(
        color: tokens.surfaceRaised,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: _focused ? tokens.accent : tokens.hairline,
          width: 1.5,
        ),
        boxShadow: _focused
            ? [
                BoxShadow(
                  color: tokens.accentWash,
                  blurRadius: 0,
                  spreadRadius: 4,
                ),
              ]
            : null,
      ),
      child: Focus(
        onFocusChange: (f) => setState(() => _focused = f),
        child: TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          minLines: widget.multiline ? widget.minLines : 1,
          maxLines: widget.autoGrow || widget.multiline ? null : 1,
          style: widget.textStyle ?? base,
          cursorColor: tokens.accent,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: hint,
            border: InputBorder.none,
            contentPadding: widget.contentPadding,
            suffixIcon: widget.suffix,
          ),
        ),
      ),
    );
  }
}

/// Field label. Mirrors `.field-label`.
class FieldLabel extends StatelessWidget {
  final String text;

  const FieldLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 10.5,
          letterSpacing: 0.09,
          fontWeight: FontWeight.w700,
          color: tokens.textTertiary,
        ),
      ),
    );
  }
}