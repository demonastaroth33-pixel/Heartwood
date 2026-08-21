import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/main.dart';

void main() {
  test('boot check returns true on a healthy DB', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    expect(await checkBootHealthy(db), isTrue);
  });

  test('boot check returns false when the DB is unusable', () async {
    final db = AppDatabase(
      LazyDatabase(() async => throw StateError('database cannot open')),
    );
    expect(await checkBootHealthy(db), isFalse);
  });
}