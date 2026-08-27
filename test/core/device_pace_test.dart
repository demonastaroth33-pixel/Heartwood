import 'package:flutter/animation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/core/device_pace.dart';

void main() {
  testWidgets('PacedAnimation advances 1/targetFrames per rendered frame and '
      'completes in exactly targetFrames frames', (tester) async {
    final vsync = TestVSync();
    final anim = PacedAnimation(vsync: vsync, targetFrames: 20);
    addTearDown(anim.dispose);

    var completed = false;
    anim.addStatusListener((s) {
      if (s == AnimationStatus.completed) completed = true;
    });

    expect(anim.value, 0.0);
    anim.forward();
    for (var i = 1; i <= 10; i++) {
      await tester.pump();
      expect(anim.value, closeTo(i / 20, 0.001),
          reason: 'frame $i must advance exactly one step');
      expect(completed, isFalse);
    }
    for (var i = 11; i <= 20; i++) {
      await tester.pump();
    }
    expect(anim.value, 1.0);
    expect(completed, isTrue);

    // Settled: further pumps must not move it.
    final before = anim.value;
    await tester.pump();
    expect(anim.value, before);
  });

  test('durationForFrames adapts to the measured pace with sane clamps', () {
    expect(DevicePace.durationForFrames(20).inMilliseconds,
        inInclusiveRange(150, 5000));
  });
}