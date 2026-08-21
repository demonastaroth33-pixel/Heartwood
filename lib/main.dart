import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'data/database/database.dart';
import 'data/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDatabase.open();
  final integrity = await db.integrityCheck();
  final healthy = integrity.isNotEmpty && integrity.first == 'ok';
  runApp(
    ProviderScope(
      overrides: [dbProvider.overrideWithValue(db)],
      child: App(bootHealthy: healthy),
    ),
  );
}