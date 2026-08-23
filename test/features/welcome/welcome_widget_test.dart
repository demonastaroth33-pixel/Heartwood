import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/app.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/providers.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });
  tearDown(() => db.close());

  Future<void> pumpWelcome(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [dbProvider.overrideWithValue(db)],
        child: const App(showWelcome: true),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('first run shows the 3-step welcome; habits persist after finish',
      (tester) async {
    await pumpWelcome(tester);

    expect(find.text('PersonalOS'), findsOneWidget);
    await tester.tap(find.text('Start'));
    await tester.pumpAndSettle();

    expect(find.text('Create your first habits'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Read 20 pages');
    await tester.pump();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('Read 20 pages'), findsOneWidget);

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('Write your first entry'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Day one.');
    await tester.pump();
    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();

    expect(find.text('Today'), findsOneWidget);
    final habits = await db.select(db.habits).get();
    expect(habits, hasLength(1));
    final entries = await db.select(db.journalEntries).get();
    expect(entries, hasLength(1));
  });

  testWidgets('welcome is skipped once done', (tester) async {
    await db.into(db.settings).insert(
      SettingsCompanion.insert(key: kWelcomeDoneKey, value: 'true'),
    );
    await pumpWelcome(tester);
    expect(find.text('Today'), findsOneWidget);
    expect(find.text('PersonalOS'), findsNothing);
  });
}