import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'data/database/database.dart';
import 'data/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDatabase.open();
  final healthy = await checkBootHealthy(db);
  runApp(
    ProviderScope(
      overrides: [dbProvider.overrideWithValue(db)],
      child: App(bootHealthy: healthy),
    ),
  );
}

Future<bool> checkBootHealthy(AppDatabase db) async {
  try {
    final integrity = await db.integrityCheck();
    return integrity.isNotEmpty && integrity.first == 'ok';
  } catch (_) {
    return false;
  }
}