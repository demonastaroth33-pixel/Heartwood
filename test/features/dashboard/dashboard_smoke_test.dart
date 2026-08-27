import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/app.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/providers.dart';

void main() {
  testWidgets(
    'dashboard shows Today, Coach, Goals & tasks, Streak and Storage blocks',
    (tester) async {
      await tester.binding.setSurfaceSize(const Size(1280, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      final db = AppDatabase(NativeDatabase.memory());
      addTearDown(db.close);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [dbProvider.overrideWithValue(db)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle();
    // T13: the coach refresh defers 600ms past first paint - flush the timer.
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();
      expect(find.textContaining('Good morning'), findsOneWidget);
      expect(find.text('Today'), findsOneWidget);
      expect(find.text('Coach'), findsOneWidget);
      expect(find.text('Goals & tasks'), findsOneWidget);
      expect(find.text('Streak'), findsOneWidget);
      expect(find.text('STORAGE'), findsOneWidget);
      // Desktop layout: rail on the left.
      expect(find.byType(NavigationRail), findsNothing);
    },
  );

  testWidgets('desktop uses the Heartwood rail; mobile uses the bottom nav',
      (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    await tester.binding.setSurfaceSize(const Size(1280, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [dbProvider.overrideWithValue(db)],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();
    // T13: the coach refresh defers 600ms past first paint - flush the timer.
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Journal'), findsWidgets);

    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpAndSettle();
    // T13: the coach refresh defers 600ms past first paint - flush the timer.
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Habits'), findsWidgets);
  });
}