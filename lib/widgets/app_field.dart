import 'package:flutter/material.dart';

import '../core/theme/tokens.dart';

class AppField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final bool multiline;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onChanged;
  final Widget? trailing;

  const AppField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.multiline = false,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final field = Container(
      decoration: BoxDecoration(
        color: tokens.surfaceRaised,
        borderRadius: BorderRadius.circular(
          multiline ? AppRadius.md : AppRadius.pill,
        ),
        border: Border.all(color: tokens.hairline),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        minLines: multiline ? 5 : 1,
        maxLines: multiline ? null : 1,
        textInputAction: multiline ? TextInputAction.newline : textInputAction,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: tokens.textPrimary),
        cursorColor: tokens.accent,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: tokens.textDisabled),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: multiline ? AppSpace.lg : AppSpace.lg,
            vertical: multiline ? AppSpace.lg : 14,
          ),
          suffixIcon: trailing,
        ),
      ),
    );
    if (label == null) return field;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppSpace.sm, bottom: AppSpace.xs),
          child: Text(
            label!,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: tokens.textSecondary,
                ),
          ),
        ),
        field,
      ],
    );
  }
}