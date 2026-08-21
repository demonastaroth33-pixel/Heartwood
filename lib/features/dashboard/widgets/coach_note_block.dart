import 'package:flutter/material.dart';

import 'block_card.dart';

class CoachNoteBlock extends StatelessWidget {
  const CoachNoteBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlockCard(
      title: 'Coach',
      child: EmptyLine(text: 'Day on track.'),
    );
  }
}