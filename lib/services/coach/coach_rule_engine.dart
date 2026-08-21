import 'dart:math';

import 'package:personalos/core/ids.dart';

class CoachMessage {
  final String kind;
  final String dateKey;
  final String payload;

  const CoachMessage({
    required this.kind,
    required this.dateKey,
    required this.payload,
  });
}

class CoachRuleEngine {
  static List<CoachMessage> evaluate({
    required Map<String, List<String>> missesByHabit,
    Map<String, String> habitNames = const {},
    DateTime? on,
  }) {
    final today = dayKey(on ?? DateTime.now());
    final messages = <CoachMessage>[];
    for (final entry in missesByHabit.entries) {
      final run = longestConsecutiveRun(entry.value);
      if (run < 3) continue;
      final name = habitNames[entry.key] ?? 'this habit';
      messages.add(CoachMessage(
        kind: 'nudge',
        dateKey: today,
        payload: "Three days without $name — what's in the way?",
      ));
    }
    return messages;
  }

  static int longestConsecutiveRun(List<String> dayKeys) {
    if (dayKeys.isEmpty) return 0;
    final sorted = dayKeys.map(DateTime.parse).toList()..sort();
    var best = 1;
    var current = 1;
    for (var i = 1; i < sorted.length; i++) {
      final diff = sorted[i].difference(sorted[i - 1]).inDays;
      if (diff == 1) {
        current++;
        best = max(best, current);
      } else {
        current = 1;
      }
    }
    return best;
  }
}