import 'package:flutter/material.dart';

import '../core/theme/tokens.dart';

class AppFab extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  const AppFab({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return FloatingActionButton(
      heroTag: tooltip,
      onPressed: onPressed,
      tooltip: tooltip,
      backgroundColor: tokens.accent,
      foregroundColor: tokens.onAccent,
      elevation: 2,
      shape: const CircleBorder(),
      child: Icon(icon, size: 22),
    );
  }
}