import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/data/adapters/local_media_adapter.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/repositories/event_repository.dart';
import 'package:personalos/data/repositories/habit_repository.dart';
import 'package:personalos/data/repositories/journal_repository.dart';
import 'package:personalos/data/repositories/media_repository.dart';
import 'package:personalos/data/repositories/settings_repository.dart';
import 'package:personalos/services/media/media_capture.dart';

final dbProvider = Provider<AppDatabase>(
  (ref) => throw UnimplementedError('dbProvider must be overridden at startup'),
);

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