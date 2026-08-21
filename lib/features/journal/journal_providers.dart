import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/data/models/journal_entry.dart';
import 'package:personalos/data/models/media_attachment.dart';
import 'package:personalos/data/providers.dart';

final journalEntriesProvider = FutureProvider<List<JournalEntry>>(
  (ref) => ref.watch(journalRepoProvider).recent(limit: 500),
);

final mediaForEntryProvider =
    FutureProvider.family<List<MediaAttachment>, String>(
  (ref, entryId) => ref.watch(mediaRepoProvider).forEntry(entryId),
);

Future<void> refreshJournal(WidgetRef ref) async {
  ref.invalidate(journalEntriesProvider);
  await ref.read(journalEntriesProvider.future);
}