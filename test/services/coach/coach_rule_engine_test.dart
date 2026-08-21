import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/services/coach/coach_rule_engine.dart';

void main() {
  test('3 consecutive missed days produces a gentle line; fewer days silence',
      () {
    final output = CoachRuleEngine.evaluate(
      missesByHabit: {
        'h-1': ['2026-08-01', '2026-08-02', '2026-08-03'],
      },
      habitNames: {'h-1': 'Read'},
      on: DateTime(2026, 8, 4),
    );
    expect(output, hasLength(1));
    expect(output.first.kind, 'nudge');
    expect(output.first.payload, contains('Three days without Read'));
    expect(output.first.payload, isNot(contains('failed')));

    final quiet = CoachRuleEngine.evaluate(
      missesByHabit: {
        'h-1': ['2026-08-03'],
      },
      on: DateTime(2026, 8, 4),
    );
    expect(quiet, isEmpty);
  });

  test('only a calendar-consecutive run of 3 counts', () {
    final output = CoachRuleEngine.evaluate(
      missesByHabit: {
        'h-1': ['2026-08-01', '2026-08-03', '2026-08-04'],
      },
      on: DateTime(2026, 8, 5),
    );
    expect(output, isEmpty);
  });
}