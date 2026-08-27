import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/app.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/providers.dart' hide kWelcomeDoneKey;
import 'package:personalos/features/welcome/welcome_screen.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });
  tearDown(() => db.close());

  Future<void> pumpWelcome(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(1280, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [dbProvider.overrideWithValue(db)],
        child: const App(showWelcome: true),
      ),
    );
    await tester.pumpAndSettle();
    // T13: the coach refresh defers 600ms past first paint - flush the timer.
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();
  }

  testWidgets('first run shows the 3-step welcome; skip reaches the shell',
      (tester) async {
    await pumpWelcome(tester);

    expect(find.text('This is Heartwood.'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    // T13: the coach refresh defers 600ms past first paint - flush the timer.
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();
    expect(find.text('Plant two or three habits.'), findsOneWidget);
    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();
    // T13: the coach refresh defers 600ms past first paint - flush the timer.
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();
    expect(find.text('This is Heartwood.'), findsOneWidget);
  });

  testWidgets('welcome is skipped once done', (tester) async {
    await db.into(db.settings).insert(
      SettingsCompanion.insert(key: kWelcomeDoneKey, value: 'true'),
    );
    await pumpWelcome(tester);
    expect(find.textContaining('Good morning'), findsOneWidget);
    expect(find.text('This is Heartwood.'), findsNothing);
  });
}