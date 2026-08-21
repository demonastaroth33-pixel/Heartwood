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

  Future<void> pumpApp(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [dbProvider.overrideWithValue(db)],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('create habit → check off → streak of 1', (tester) async {
    await pumpApp(tester);
    await tester.tap(find.byIcon(Icons.check_circle_outline));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Read 20 pages');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Read 20 pages'), findsOneWidget);

    await tester.tap(find.byKey(const Key('check-habit')));
    await tester.pumpAndSettle();
    expect(find.text('1-day streak'), findsOneWidget);
  });

  testWidgets('archiving a habit removes it from the list', (tester) async {
    await pumpApp(tester);
    await tester.tap(find.byIcon(Icons.check_circle_outline));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Meditate');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Meditate'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Archive'));
    await tester.pumpAndSettle();
    expect(find.text('Meditate'), findsNothing);
    expect(find.textContaining('No habits yet'), findsOneWidget);
  });
}