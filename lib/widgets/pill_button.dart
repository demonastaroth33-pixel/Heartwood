import 'package:flutter/material.dart';

import '../core/theme/tokens.dart';

enum PillVariant { accent, secondary, danger, ghost }

class PillButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final PillVariant variant;
  final IconData? icon;
  final bool loading;
  final bool compact;

  const PillButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = PillVariant.accent,
    this.icon,
    this.loading = false,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final enabled = onPressed != null && !loading;
    final (bg, fg, border) = switch (variant) {
      PillVariant.accent => (tokens.accent, tokens.onAccent, null),
      PillVariant.secondary => (tokens.surfaceRaised, tokens.textPrimary, tokens.hairline),
      PillVariant.danger => (Colors.transparent, tokens.danger, tokens.hairline),
      PillVariant.ghost => (Colors.transparent, tokens.textPrimary, null),
    };
    final height = compact ? 40.0 : 48.0;
    return AnimatedOpacity(
      duration: AppMotion.fast,
      curve: AppMotion.standard,
      opacity: enabled ? 1 : 0.6,
      child: SizedBox(
        height: height,
        child: Material(
          color: enabled ? bg : tokens.surfaceRaised,
          shape: StadiumBorder(
            side: border != null
                ? BorderSide(color: border, width: 1)
                : BorderSide.none,
          ),
          child: InkWell(
            customBorder: const StadiumBorder(),
            onTap: enabled ? onPressed : null,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: compact ? AppSpace.lg : AppSpace.xl,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (loading)
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: enabled ? fg : tokens.textDisabled,
                      ),
                    )
                  else if (icon != null) ...[
                    Icon(icon, size: 16, color: enabled ? fg : tokens.textDisabled),
                    const SizedBox(width: AppSpace.xs),
                  ],
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: enabled ? fg : tokens.textDisabled,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}