import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/data/models/journal_entry.dart';
import 'package:personalos/data/providers.dart';

final journalEntriesProvider = FutureProvider<List<JournalEntry>>(
  (ref) => ref.watch(journalRepoProvider).recent(limit: 500),
);

Future<void> refreshJournal(WidgetRef ref) async {
  ref.invalidate(journalEntriesProvider);
  await ref.read(journalEntriesProvider.future);
}