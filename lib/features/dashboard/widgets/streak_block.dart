import 'package:flutter/material.dart';

import 'block_card.dart';

class StreakBlock extends StatelessWidget {
  const StreakBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlockCard(
      title: 'Streak / XP',
      child: EmptyLine(text: 'Streaks arrive in a later milestone.'),
    );
  }
}