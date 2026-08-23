import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/models/journal_entry.dart';
import 'package:personalos/features/journal/journal_compose_screen.dart';
import 'package:personalos/features/journal/journal_providers.dart';
import 'package:personalos/features/journal/widgets/journal_ambience.dart';
import 'package:personalos/features/journal/widgets/media_strip.dart';
import 'package:personalos/widgets/app_fab.dart';
import 'package:personalos/widgets/screen_header.dart';

class JournalScreen extends ConsumerWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(journalEntriesProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: AppFab(
        icon: Icons.edit,
        tooltip: 'New entry',
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const JournalComposeScreen()),
        ),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: JournalAmbience()),
          SafeArea(
            child: entries.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Could not load journal: $e')),
              data: (list) => list.isEmpty
                  ? const _EmptyJournal()
                  : _Timeline(entries: list),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyJournal extends StatelessWidget {
  const _EmptyJournal();

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return ListView(
      padding: const EdgeInsets.all(AppSpace.xl),
      children: [
        const ScreenHeader(title: 'Journal'),
        const SizedBox(height: AppSpace.xxl),
        Center(
          child: Column(
            children: [
              Icon(Icons.auto_stories_outlined,
                  size: 44, color: tokens.textDisabled),
              const SizedBox(height: AppSpace.md),
              Text(
                'No entries yet — write your first one.',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: tokens.textSecondary),
              ),
            ],
          ),
        ),
      ],
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
    final days = byDay.keys.toList()..sort((a, b) => b.compareTo(a));
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: ScreenHeader(title: 'Journal'),
        ),
        for (final day in days)
          SliverPersistentHeader(
            pinned: true,
            delegate: _DateHeaderDelegate(
              dayKey: day,
              count: byDay[day]!.length,
            ),
          ),
        for (final day in days)
          SliverList.builder(
            itemCount: byDay[day]!.length,
            itemBuilder: (context, i) => _EntryTile(
              entry: byDay[day]![i],
              lastInDay: i == byDay[day]!.length - 1,
            ),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpace.xl * 2)),
      ],
    );
  }
}

class _DateHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String dayKey;
  final int count;

  _DateHeaderDelegate({required this.dayKey, required this.count});

  @override
  double get minExtent => 44;

  @override
  double get maxExtent => 44;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final date = DateTime.parse(dayKey);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final that = DateTime(date.year, date.month, date.day);
    final diff = today.difference(that).inDays;
    final label = switch (diff) {
      0 => 'Today',
      1 => 'Yesterday',
      _ => _formatDay(date),
    };
    return Container(
      height: 44,
      color: tokens.bg.withValues(alpha: overlapsContent ? 0.96 : 0.0),
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.xl),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 15,
                  ),
            ),
          ),
          Text(
            count == 1 ? '1 entry' : '$count entries',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: tokens.textSecondary),
          ),
        ],
      ),
    );
  }

  static String _formatDay(DateTime d) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[d.month - 1]} ${d.day}';
  }

  @override
  bool shouldRebuild(_DateHeaderDelegate old) =>
      old.dayKey != dayKey || old.count != count;
}

class _EntryTile extends StatelessWidget {
  final JournalEntry entry;
  final bool lastInDay;

  const _EntryTile({required this.entry, required this.lastInDay});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpace.xl,
        0,
        AppSpace.xl,
        lastInDay ? AppSpace.xl : AppSpace.md,
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => JournalComposeScreen(entry: entry),
          ),
        ),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Container(
          padding: const EdgeInsets.all(AppSpace.lg),
          decoration: BoxDecoration(
            color: tokens.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: tokens.hairline),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MediaStrip(entryId: entry.id),
              const SizedBox(height: AppSpace.md),
              if (entry.title != null) ...[
                Text(entry.title!,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSpace.xs),
              ],
              Text(
                entry.title == null ? entry.body : entry.body,
                maxLines: entry.title == null ? 4 : 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpace.md),
              Row(
                children: [
                  Text(
                    _formatTime(entry.createdAt),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: tokens.textSecondary),
                  ),
                  const Spacer(),
                  if (entry.area != null)
                    Text(
                      _areaLabel(entry.area!),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: tokens.accent),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _formatTime(DateTime d) {
    final h = d.hour.toString().padLeft(2, '0');
    final m = d.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  static String _areaLabel(String area) => area.split('_').join(' ');
}