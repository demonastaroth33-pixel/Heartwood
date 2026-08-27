import 'package:personalos/data/database/database.dart';

/// Boot integrity check (D021): true when the DB passes its integrity check.
Future<bool> checkBootHealthy(AppDatabase db) async {
  try {
    final integrity = await db.integrityCheck();
    return integrity.isNotEmpty && integrity.first == 'ok';
  } catch (_) {
    return false;
  }
}