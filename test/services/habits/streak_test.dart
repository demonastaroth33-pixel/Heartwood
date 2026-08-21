import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/data/repositories/habit_repository.dart';

void main() {
  test('streak counts consecutive days ending today', () {
    final days = {'2026-08-01', '2026-08-02', '2026-08-03'};
    expect(computeStreak(days, today: '2026-08-03'), 3);
  });

  test('streak is alive when today not yet checked but yesterday was', () {
    final days = {'2026-08-01', '2026-08-02', '2026-08-03'};
    expect(computeStreak(days, today: '2026-08-04'), 3);
  });

  test('a gap resets the streak', () {
    final broken = {'2026-08-01', '2026-08-03', '2026-08-04'};
    expect(computeStreak(broken, today: '2026-08-04'), 2);
  });

  test('no check-ins at all is zero', () {
    expect(computeStreak(const {}, today: '2026-08-04'), 0);
  });

  test('missed today and yesterday is zero', () {
    final days = {'2026-08-01', '2026-08-02'};
    expect(computeStreak(days, today: '2026-08-04'), 0);
  });
}
