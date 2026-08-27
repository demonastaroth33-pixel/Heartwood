import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/core/theme/themes.dart';
import 'package:personalos/widgets/animated_widgets.dart';
import 'package:personalos/widgets/heartwood_icon.dart';

void main() {
  testWidgets('HoverRotate rotates the icon progressively on hover',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          extensions: [inkTheme.tokens],
          scaffoldBackgroundColor: const Color(0xFF12140F),
        ),
        home: const Scaffold(
          body: Center(
            child: HoverRotate(
              size: 36,
              child: HeartwoodIconWidget(
                icon: HeartwoodIcon.x,
                size: 16,
                color: Color(0xFFA5A791),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final gesture = await tester.createGesture(
        kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(gesture.removePointer);
    await gesture.moveTo(tester.getCenter(find.byType(HoverRotate)));
    await tester.pump();

    // Rotation is live frame-paced: angle must advance between pumps and
    // never be a single jump. Extract the z-rotation of the Transform.
    double angleOf() {
      final transforms = tester
          .widgetList<Transform>(find.byType(Transform))
          .where((t) => t.transform.storage[1] != 0 || t.transform.storage[0] != 1)
          .toList();
      expect(transforms, isNotEmpty, reason: 'a rotated transform must exist');
      final m = transforms.first.transform.storage;
      return m[1].isNaN ? 0 : m[1].abs();
    }

    await tester.pump();
    final a1 = angleOf();
    await tester.pump();
    final a2 = angleOf();
    expect(a2, greaterThan(a1), reason: 'rotation must progress per frame');

    // Spans the full 90 degrees over ~30 frames, then settles.
    for (var i = 0; i < 35; i++) {
      await tester.pump();
    }
    final settled = angleOf();
    expect(settled, closeTo(1.0, 0.05));
    await tester.pumpAndSettle();
  });
}