import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/app.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/providers.dart';

void main() {
  testWidgets('debug tree at frames', (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(() => db.close());
    tester.view.physicalSize = const Size(3840, 2700);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.reset);
    await tester.binding.setSurfaceSize(const Size(1280, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [dbProvider.overrideWithValue(db)],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Habits'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('New habit'));
    final baked = find.byWidgetPredicate(
      (w) => w is CustomPaint &&
          w.painter.runtimeType.toString() == '_BakedBackdropPainter',
    );
    await tester.pump();
    debugPrint('pump(): texts=${find.text('Plant a new habit').evaluate().length} '
        'bf=${find.byType(BackdropFilter).evaluate().length} '
        'baked=${baked.evaluate().length} '
        'dialogs=${find.byType(Dialog).evaluate().length}');
    await tester.pump(const Duration(milliseconds: 50));
    debugPrint('pump50: texts=${find.text('Plant a new habit').evaluate().length} '
        'bf=${find.byType(BackdropFilter).evaluate().length} '
        'baked=${baked.evaluate().length} '
        'dialogs=${find.byType(Dialog).evaluate().length}');
    await tester.pump(const Duration(milliseconds: 50));
    debugPrint('pump100: texts=${find.text('Plant a new habit').evaluate().length} '
        'bf=${find.byType(BackdropFilter).evaluate().length} '
        'baked=${baked.evaluate().length} '
        'dialogs=${find.byType(Dialog).evaluate().length}');
    await tester.pumpAndSettle();
  });
}