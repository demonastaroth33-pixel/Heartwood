import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/app.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/widgets/animated_widgets.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });
  tearDown(() => db.close());

  Future<void> pumpApp(WidgetTester tester) async {
    // setSurfaceSize alone leaves MediaQuery at the test default 800x600
    // (the TestFlutterView still reports 2400x1800 @ 3.0), which would route
    // "New habit" to the bottom sheet. Override the view so MediaQuery sees
    // the desktop width and the blur dialog opens.
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
  }

  testWidgets(
      'blur dialog: baked backdrop replaces the live blur mid-transition, '
      'dialog survives settle', (tester) async {
    await pumpApp(tester);
    await tester.tap(find.text('Habits'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('New habit'));
    // The route opens instantly; the entrance is a frame-paced pacer (16
    // frames) and the backdrop capture defers 250ms. Pump 24 real frames
    // with elapsed time so the pacer completes and the bake lands — then the
    // live BackdropFilter must be gone (blur paid once).
    await tester.pump();
    for (var i = 0; i < 24; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }

    // The habits grid's add-card also reads "Plant a new habit", so scope to
    // the dialog itself.
    final dialogTitle = find.descendant(
      of: find.byType(Dialog),
      matching: find.text('Plant a new habit'),
    );
    expect(dialogTitle, findsOneWidget);
    // The baked path replaced the live blur.
    expect(find.byType(BackdropFilter), findsNothing);

    await tester.pumpAndSettle();
    expect(dialogTitle, findsOneWidget);
  });

  testWidgets(
      'blur dialog: live BackdropFilter fallback when the capture boundary '
      'is unavailable', (tester) async {
    // A bare harness WITHOUT the app-home RepaintBoundary: backdropCaptureKey
    // is never attached, so _BackdropCapture.start returns null and the
    // byte-identical live blur fallback must render.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: TextButton(
                onPressed: () => showBlurDialog<void>(
                  context: context,
                  builder: (_) => const Dialog(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text('fallback-dialog'),
                    ),
                  ),
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.text('fallback-dialog'), findsOneWidget);
    expect(find.byType(BackdropFilter), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text('fallback-dialog'), findsOneWidget);
  });
}