import 'package:flutter/material.dart';

import 'block_card.dart';

class TasksBlock extends StatelessWidget {
  const TasksBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlockCard(
      title: "Today's tasks",
      child: EmptyLine(text: 'Tasks arrive in a later milestone.'),
    );
  }
}