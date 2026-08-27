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

  testWidgets('compose overlay slides up progressively (frame-paced) and '
      'closes on save', (tester) async {
    await pumpApp(tester);
    await tester.tap(find.byKey(const Key('desktop-fab')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    // The compose must be mid-slide: its top edge is partway up.
    final translations = tester
        .widgetList<FractionalTranslation>(find.byType(FractionalTranslation))
        .where((t) => t.translation.dy > 0 && t.translation.dy < 1)
        .toList();
    expect(translations, isNotEmpty,
        reason: 'the compose must be mid-slide after the first frames');

    // It must progress: after more frames the translation shrinks.
    final first = translations.first.translation.dy;
    await tester.pump();
    await tester.pump();
    final later = tester
        .widgetList<FractionalTranslation>(find.byType(FractionalTranslation))
        .firstWhere((t) => t.translation.dy > 0 && t.translation.dy < 1)
        .translation
        .dy;
    expect(later, lessThan(first));

    // Settles fully up.
    await tester.pumpAndSettle();
    final settled = tester
        .widgetList<FractionalTranslation>(find.byType(FractionalTranslation))
        .where((t) => t.translation.dy > 0 && t.translation.dy < 1)
        .toList();
    expect(settled, isEmpty);

    // Type a body and save: the overlay closes.
    await tester.enterText(find.byType(TextField).last, 'Hello archive');
    await tester.pump();
    await tester.tap(find.text('Save'));
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();
    expect(find.text('New entry'), findsNothing);
  });
}