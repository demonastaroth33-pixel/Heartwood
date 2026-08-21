import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/app.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/dashboard/widgets/storage_meter_block.dart';
import 'package:personalos/services/storage/storage_meter.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });
  tearDown(() => db.close());

  Future<void> pumpWithMeter(WidgetTester tester, StorageMeterData data) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
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
  }

  testWidgets('meter shows used/quota at 95% with hard-warn export action',
      (tester) async {
    await pumpWithMeter(
      tester,
      const StorageMeterData(
        usedBytes: 95 * 1048576,
        quotaBytes: 100 * 1048576,
        dbMediaBytes: 40 * 1048576,
      ),
    );
    expect(find.textContaining('95.0 MB of 100.0 MB'), findsOneWidget);
    expect(find.text('Storage almost full. Export a backup now.'),
        findsOneWidget);
    expect(find.text('Export backup now'), findsOneWidget);
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
    expect(find.textContaining('50.0 MB of 100.0 MB'), findsOneWidget);
    expect(find.textContaining('Export a backup'), findsNothing);
  });
}