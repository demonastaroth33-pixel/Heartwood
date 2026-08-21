import 'package:drift/drift.dart';
import 'package:personalos/data/database/database.dart';

class SettingsRepository {
  final AppDatabase db;
  SettingsRepository(this.db);

  Future<String?> get(String key) async {
    final q = db.select(db.settings)..where((t) => t.key.equals(key));
    final row = await q.getSingleOrNull();
    return row?.value;
  }

  Future<void> set(String key, String value) async {
    await db.into(db.settings).insert(
          SettingsCompanion.insert(key: key, value: value),
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<String> getOrSet(String key, String fallback) async {
    final existing = await get(key);
    if (existing != null) return existing;
    await set(key, fallback);
    return fallback;
  }
}