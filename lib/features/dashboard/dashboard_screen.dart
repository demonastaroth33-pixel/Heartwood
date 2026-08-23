import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
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
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final now = DateTime.now();
    final hour = now.hour;
    final greeting = hour < 12
        ? 'Good morning.'
        : hour < 18
            ? 'Good afternoon.'
            : 'Good evening.';
    final dateStr = _formatDate(now);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpace.lg),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpace.xl,
              0,
              AppSpace.xl,
              AppSpace.xl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greeting,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: AppSpace.xs),
                Text(
                  dateStr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: tokens.textSecondary),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(AppSpace.xl, 0, AppSpace.xl, AppSpace.xl),
            child: TodaySection(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(AppSpace.xl, 0, AppSpace.xl, AppSpace.xl),
            child: CoachNoteBlock(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(AppSpace.xl, 0, AppSpace.xl, AppSpace.xl),
            child: GoalProgressBlock(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(AppSpace.xl, 0, AppSpace.xl, AppSpace.xl),
            child: TasksBlock(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(AppSpace.xl, 0, AppSpace.xl, AppSpace.xl),
            child: StreakBlock(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(AppSpace.xl, 0, AppSpace.xl, AppSpace.xl),
            child: StorageMeterBlock(),
          ),
        ],
      ),
    );
  }

  static String _formatDate(DateTime d) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    const weekdays = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday',
    ];
    return '${weekdays[d.weekday - 1]}, ${months[d.month - 1]} ${d.day}';
  }
}