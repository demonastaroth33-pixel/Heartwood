import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/data/models/coach_output.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/habits/habits_providers.dart';
import 'package:personalos/features/journal/journal_providers.dart';
import 'package:personalos/services/growth/growth_stage.dart';
import 'package:personalos/services/storage/storage_meter.dart';

final storageMeterProvider = FutureProvider<StorageMeterData>(
  (ref) => StorageMeter(ref.watch(dbProvider)).read(),
);

final coachTodayProvider = FutureProvider<CoachOutput?>((ref) async {
  final service = ref.watch(coachServiceProvider);
  // Defer past first paint — the refresh reads all journal entries and stalls boot on weak machines (T13).
  await Future<void>.delayed(const Duration(milliseconds: 600));
  await service.refresh();
  return service.todayOutput();
});

/// Day count in Heartwood — days since the earliest activity (first habit
/// planted or first journal entry). Mirrors the mock's "Day 14 in Heartwood".
final daysInHeartwoodProvider = FutureProvider<int>((ref) async {
  final habits = await ref.watch(habitsProvider.future);
  final entries = await ref.watch(journalEntriesProvider.future);
  DateTime? earliest;
  for (final h in habits) {
    if (earliest == null || h.createdAt.isBefore(earliest)) earliest = h.createdAt;
  }
  for (final e in entries) {
    if (earliest == null || e.createdAt.isBefore(earliest)) earliest = e.createdAt;
  }
  if (earliest == null) return 1;
  final now = DateTime.now();
  final start = DateTime(earliest.year, earliest.month, earliest.day);
  final today = DateTime(now.year, now.month, now.day);
  final days = today.difference(start).inDays + 1;
  return days < 1 ? 1 : days;
});

/// Habits due today — active habits with no check-in today.
final habitsDueProvider = FutureProvider<int>((ref) async {
  final habits = await ref.watch(habitsProvider.future);
  final done = await ref.watch(todayCheckinsProvider.future);
  return habits.where((h) => !done.contains(h.id)).length;
});

/// Archived media size in bytes (real, from the storage meter).
final archiveBytesProvider = FutureProvider<int>((ref) async {
  final data = await ref.watch(storageMeterProvider.future);
  return data.dbMediaBytes;
});

class StreakSummary {
  final int best;
  final int nextRing;
  final double fraction;

  const StreakSummary({
    required this.best,
    required this.nextRing,
    required this.fraction,
  });
}

/// Best current streak across active habits + progress toward the next
/// growth-ring threshold. "Longest ring this season" is the best streak in
/// the archive (M0 has no seasons table yet).
final streakSummaryProvider = FutureProvider<StreakSummary>((ref) async {
  final habits = await ref.watch(habitsProvider.future);
  var best = 0;
  for (final h in habits) {
    final s = await ref.watch(habitStreakProvider(h.id).future);
    if (s > best) best = s;
  }
  var next = 0;
  for (final stage in growthStages) {
    if (stage.minStreak > best) {
      next = stage.minStreak;
      break;
    }
  }
  if (next == 0) next = best; // already at Heartwood (120+)
  return StreakSummary(
    best: best,
    nextRing: next,
    fraction: next == 0 ? 0 : (best / next).clamp(0.0, 1.0),
  );
});