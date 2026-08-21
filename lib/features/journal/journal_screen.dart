import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/data/models/journal_entry.dart';
import 'package:personalos/features/journal/journal_compose_screen.dart';
import 'package:personalos/features/journal/journal_providers.dart';

class JournalScreen extends ConsumerWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(journalEntriesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Journal')),
      floatingActionButton: FloatingActionButton(
        heroTag: 'journal-fab',
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const JournalComposeScreen()),
        ),
        tooltip: 'New entry',
        child: const Icon(Icons.edit),
      ),
      body: entries.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Could not load journal: $e')),
        data: (list) => list.isEmpty
            ? const Center(
                child: Text('No entries yet — write your first one.'),
              )
            : _Timeline(entries: list),
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  final List<JournalEntry> entries;

  const _Timeline({required this.entries});

  @override
  Widget build(BuildContext context) {
    final byDay = <String, List<JournalEntry>>{};
    for (final entry in entries) {
      byDay.putIfAbsent(dayKey(entry.createdAt), () => []).add(entry);
    }
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 12),
      children: [
        for (final day in byDay.keys)
          _DayGroup(dayKey: day, entries: byDay[day]!),
      ],
    );
  }
}

class _DayGroup extends StatelessWidget {
  final String dayKey;
  final List<JournalEntry> entries;

  const _DayGroup({required this.dayKey, required this.entries});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(dayKey);
    final label =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ),
        for (final entry in entries) _EntryTile(entry: entry),
      ],
    );
  }
}

class _EntryTile extends StatelessWidget {
  final JournalEntry entry;

  const _EntryTile({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF17202E),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(
          entry.title ?? entry.body,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: entry.title == null
            ? null
            : Text(entry.body, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => JournalComposeScreen(entry: entry),
          ),
        ),
      ),
    );
  }
}