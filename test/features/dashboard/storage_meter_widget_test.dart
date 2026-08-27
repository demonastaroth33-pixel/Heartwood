import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/app.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/dashboard/dashboard_providers.dart';
import 'package:personalos/services/storage/storage_meter.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });
  tearDown(() => db.close());

  Future<void> pumpWithMeter(WidgetTester tester, StorageMeterData data) async {
    await tester.binding.setSurfaceSize(const Size(1280, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          dbProvider.overrideWithValue(db),
          storageMeterProvider.overrideWith(
            (ref) => Future.value(data),
          ),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();
    // T13: the coach refresh defers 600ms past first paint - flush the timer.
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();
  }

  testWidgets('meter shows used/quota at 95% with hard-warn copy',
      (tester) async {
    await pumpWithMeter(
      tester,
      const StorageMeterData(
        usedBytes: 95 * 1048576,
        quotaBytes: 100 * 1048576,
        dbMediaBytes: 40 * 1048576,
      ),
    );
    expect(
      find.textContaining('Storage nearly full'),
      findsOneWidget,
    );
  });

  testWidgets('meter at 50% shows no warning', (tester) async {
    await pumpWithMeter(
      tester,
      const StorageMeterData(
        usedBytes: 50 * 1048576,
        quotaBytes: 100 * 1048576,
        dbMediaBytes: 0,
      ),
    );
    expect(find.textContaining('Storage nearly full'), findsNothing);
    expect(find.textContaining('Approaching your storage limit'), findsNothing);
  });
}