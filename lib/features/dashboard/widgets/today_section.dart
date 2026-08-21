import 'package:flutter/material.dart';

import 'block_card.dart';

class TodaySection extends StatelessWidget {
  const TodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlockCard(
      title: 'Today',
      child: EmptyLine(
        text: 'No habits yet — add your first habit in the Habits tab.',
      ),
    );
  }
}