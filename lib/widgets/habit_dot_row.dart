import 'package:flutter/material.dart';

import '../core/theme/tokens.dart';

/// A row of small day dots (7 or 30) showing recent completion history.
/// Checked = accent fill, unchecked = hairline, today = accent ring.
class HabitDotRow extends StatelessWidget {
  final List<bool> days;
  final int todayIndex;
  final double size;

  const HabitDotRow({
    super.key,
    required this.days,
    required this.todayIndex,
    this.size = 6,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(days.length, (i) {
        final done = days[i];
        final isToday = i == todayIndex;
        return Container(
          width: size,
          height: size,
          margin: EdgeInsets.symmetric(horizontal: size / 3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isToday
                ? Colors.transparent
                : (done ? tokens.accent : tokens.hairline),
            border: isToday
                ? Border.all(color: tokens.accent, width: 1.5)
                : null,
          ),
        );
      }),
    );
  }
}