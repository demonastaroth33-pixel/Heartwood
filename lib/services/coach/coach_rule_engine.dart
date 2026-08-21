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
      final run = trailingConsecutiveRun(entry.value);
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

  static int trailingConsecutiveRun(List<String> dayKeys) {
    if (dayKeys.isEmpty) return 0;
    final sorted = dayKeys.map(DateTime.parse).toList()..sort();
    var run = 1;
    for (var i = sorted.length - 1; i > 0; i--) {
      if (sorted[i].difference(sorted[i - 1]).inDays == 1) {
        run++;
      } else {
        break;
      }
    }
    return run;
  }
}