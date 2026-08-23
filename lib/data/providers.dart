import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/themes.dart';
import 'package:personalos/data/adapters/local_media_adapter.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/repositories/event_repository.dart';
import 'package:personalos/data/repositories/export_import_repository.dart';
import 'package:personalos/data/repositories/habit_repository.dart';
import 'package:personalos/data/repositories/journal_repository.dart';
import 'package:personalos/data/repositories/media_repository.dart';
import 'package:personalos/data/repositories/settings_repository.dart';
import 'package:personalos/services/media/media_capture.dart';
import 'package:personalos/services/coach/coach_service.dart';

final dbProvider = Provider<AppDatabase>(
  (ref) => throw UnimplementedError('dbProvider must be overridden at startup'),
);

const kThemeKey = 'theme';
const kWelcomeDoneKey = 'welcome_done';

final themeKeyProvider = FutureProvider<String>((ref) async {
  try {
    final stored = await ref.watch(settingsRepoProvider).get(kThemeKey);
    if (stored != null && themeRegistry.containsKey(stored)) return stored;
  } catch (_) {
    // DB not reachable (recovery boot) — default theme.
  }
  return inkTheme.key;
});

final welcomeDoneProvider = FutureProvider<bool>((ref) async {
  try {
    final done = await ref.watch(settingsRepoProvider).get(kWelcomeDoneKey);
    return done == 'true';
  } catch (_) {
    return true;
  }
});

final eventRepoProvider = Provider<EventRepository>(
  (ref) => EventRepository(ref.watch(dbProvider)),
);

final journalRepoProvider = Provider<JournalRepository>(
  (ref) =>
      JournalRepository(ref.watch(dbProvider), ref.watch(eventRepoProvider)),
);

final habitRepoProvider = Provider<HabitRepository>(
  (ref) => HabitRepository(ref.watch(dbProvider), ref.watch(eventRepoProvider)),
);

final mediaRepoProvider = Provider<MediaRepository>(
  (ref) => MediaRepository(
    ref.watch(dbProvider),
    ref.watch(eventRepoProvider),
    LocalMediaAdapter(ref.watch(dbProvider)),
  ),
);

final settingsRepoProvider = Provider<SettingsRepository>(
  (ref) => SettingsRepository(ref.watch(dbProvider)),
);

final mediaCaptureProvider = Provider<MediaCaptureService>(
  (ref) => WebMediaCapture(),
);

final exportRepoProvider = Provider<ExportImportRepository>(
  (ref) => ExportImportRepository(ref.watch(dbProvider)),
);

final coachServiceProvider = Provider<CoachService>(
  (ref) => CoachService(
    ref.watch(dbProvider),
    ref.watch(eventRepoProvider),
    ref.watch(habitRepoProvider),
  ),
);