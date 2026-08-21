import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/app.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/providers.dart';

void main() {
  testWidgets('unhealthy boot shows the recovery screen', (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [dbProvider.overrideWithValue(db)],
        child: const App(bootHealthy: false),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Data recovery'), findsOneWidget);
    expect(find.text('Export what is readable'), findsOneWidget);
    expect(find.text('Restore from backup'), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });

  testWidgets('settings screen exposes the Data & storage section',
      (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [dbProvider.overrideWithValue(db)],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    expect(find.text('DATA & STORAGE'), findsOneWidget);
    expect(find.text('Export backup'), findsOneWidget);
    expect(find.text('Restore backup'), findsOneWidget);
  });
}