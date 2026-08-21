import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/core/constants.dart';
import 'package:personalos/data/database/database.dart';

void main() {
  test('M0 schema creates cleanly and seeds areas', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    await db.customStatement('PRAGMA foreign_keys = ON');
    final counts = await db.tableCounts();
    expect(counts['areas'], seedAreas.length);
    expect(counts['events'], 0);
  });

  test('integrity check passes on a fresh DB', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    final result = await db.integrityCheck();
    expect(result, isNotEmpty);
    expect(result.first, 'ok');
  });
}
