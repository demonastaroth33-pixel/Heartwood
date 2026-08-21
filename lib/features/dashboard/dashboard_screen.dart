import 'package:flutter/material.dart';

import 'widgets/coach_note_block.dart';
import 'widgets/goal_progress_block.dart';
import 'widgets/storage_meter_block.dart';
import 'widgets/streak_block.dart';
import 'widgets/tasks_block.dart';
import 'widgets/today_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: const [
          TodaySection(),
          CoachNoteBlock(),
          GoalProgressBlock(),
          TasksBlock(),
          StreakBlock(),
          StorageMeterBlock(),
        ],
      ),
    );
  }
}