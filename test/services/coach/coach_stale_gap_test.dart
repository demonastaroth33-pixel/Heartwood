import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/services/coach/coach_rule_engine.dart';

void main() {
  test('a stale historical gap never fires — only the trailing run counts', () {
    final output = CoachRuleEngine.evaluate(
      missesByHabit: {
        'h-1': [
          '2026-07-01', '2026-07-02', '2026-07-03',
          '2026-08-01', '2026-08-04',
        ],
      },
      habitNames: {'h-1': 'Read'},
      on: DateTime(2026, 8, 4),
    );
    expect(output, isEmpty);
  });

  test('trailing run of 3 ending at the most recent miss fires', () {
    final output = CoachRuleEngine.evaluate(
      missesByHabit: {
        'h-1': ['2026-07-20', '2026-08-01', '2026-08-02', '2026-08-03'],
      },
      habitNames: {'h-1': 'Read'},
      on: DateTime(2026, 8, 4),
    );
    expect(output, hasLength(1));
    expect(output.first.payload, contains('Read'));
  });
}