import 'package:flutter/material.dart';

import 'block_card.dart';

class GoalProgressBlock extends StatelessWidget {
  const GoalProgressBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlockCard(
      title: 'Goal progress',
      child: EmptyLine(text: 'Goals arrive in a later milestone.'),
    );
  }
}