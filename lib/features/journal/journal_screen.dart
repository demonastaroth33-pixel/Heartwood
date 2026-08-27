import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/models/journal_entry.dart';
import 'package:personalos/features/journal/journal_compose_screen.dart';
import 'package:personalos/features/journal/journal_providers.dart';
import 'package:personalos/widgets/animated_widgets.dart';
import 'package:personalos/widgets/core_widgets.dart';
import 'package:personalos/widgets/heartwood_icon.dart';

class JournalScreen extends ConsumerStatefulWidget {
  const JournalScreen({super.key});

  static JournalScreenState? of(BuildContext context) {
    return context.findAncestorStateOfType<JournalScreenState>();
  }

  @override
  ConsumerState<JournalScreen> createState() => JournalScreenState();
}

class JournalScreenState extends ConsumerState<JournalScreen> {
  void openCompose() {
    openComposeOverlay(context);
  }

  @override
  Widget build(BuildContext context) {
    final entries = ref.watch(journalEntriesProvider);
    return JournalScreenBody(
      entries: entries.valueOrNull ?? const [],
    );
  }
}

class JournalScreenBody extends StatelessWidget {
  final List<JournalEntry> entries;

  const JournalScreenBody({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LayoutBuilder(
                  builder: (context, c) {
                    final narrow = c.maxWidth < 560;
                    if (narrow) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          ScreenHeader(title: 'Journal'),
                          SearchPill(hint: 'Search entries…', fullWidth: true),
                        ],
                      );
                    }
                    return Row(
                      children: const [
                        Expanded(child: ScreenHeader(title: 'Journal')),
                        SizedBox(width: 16),
                        SearchPill(hint: 'Search entries…'),
                      ],
                    );
                  },
                ),
                const _FilterRow(),
                const SizedBox(height: 26),
                if (entries.isEmpty)
                  const _JournalEmpty()
                else
                  for (var i = 0; i < _groupDays(entries).length; i++)
                    _DayGroup(day: _groupDays(entries)[i], first: i == 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static List<DayGroup> _groupDays(List<JournalEntry> entries) {
    final map = <String, List<JournalEntry>>{};
    for (final e in entries) {
      final key = '${e.createdAt.year}-${e.createdAt.month.toString().padLeft(2, '0')}-${e.createdAt.day.toString().padLeft(2, '0')}';
      map.putIfAbsent(key, () => []).add(e);
    }
    final keys = map.keys.toList()..sort((a, b) => b.compareTo(a));
    return keys.map((k) => DayGroup(key: k, entries: map[k]!)).toList();
  }
}

class DayGroup {
  final String key;
  final List<JournalEntry> entries;

  DayGroup({required this.key, required this.entries});
}

class _FilterRow extends StatelessWidget {
  const _FilterRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: const [
        ChipPill(label: 'All', active: true),
        ChipPill(label: 'Photos'),
        ChipPill(label: 'Vlogs'),
        ChipPill(label: 'Training'),
        ChipPill(label: 'Garden'),
      ],
    );
  }
}

class _JournalEmpty extends StatelessWidget {
  const _JournalEmpty();

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return DashedBorder(
      color: tokens.hairlineStrong,
      radius: AppRadius.lg,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 20),
        child: Column(
          children: [
            HeartwoodIconWidget(
              icon: HeartwoodIcon.leaf,
              size: 64,
              color: tokens.accent.withValues(alpha: 0.14),
            ),
            const SizedBox(height: 14),
            Text(
              'Earlier entries archive quietly here as growth rings — nothing is ever deleted.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.5, color: tokens.textTertiary),
            ),
            const SizedBox(height: 16),
            const PillButton(label: 'Load earlier entries', ghost: true, height: 40),
          ],
        ),
      ),
    );
  }
}

class _DayGroup extends StatelessWidget {
  final DayGroup day;
  final bool first;

  const _DayGroup({required this.day, this.first = false});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final now = DateTime.now();
    final parts = day.key.split('-');
    final d = DateTime(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
    final today = DateTime(now.year, now.month, now.day);
    final diff = today.difference(d).inDays;
    final label = diff == 0 ? 'Today' : diff == 1 ? 'Yesterday' : _formatDay(d);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Mirrors `.ring-divider` (34px top margin except the first).
        Container(
          margin: EdgeInsets.only(top: first ? 0 : 34),
          child: Row(
            children: [
              HeartwoodIconWidget(icon: HeartwoodIcon.rings, size: 18),
              const SizedBox(width: 14),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Fraunces',
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: tokens.textPrimary,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                day.entries.length == 1 ? '1 entry' : '${day.entries.length} entries',
                style: TextStyle(fontSize: 11.5, color: tokens.textTertiary),
              ),
              const SizedBox(width: 14),
              Expanded(child: Container(height: 1, color: tokens.hairline)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        for (final entry in day.entries) _EntryCard(entry: entry),
      ],
    );
  }

  static String _formatDay(DateTime d) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[d.month - 1]} ${d.day}';
  }
}

class _EntryCard extends ConsumerWidget {
  final JournalEntry entry;

  const _EntryCard({required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final media = ref.watch(mediaForEntryProvider(entry.id)).valueOrNull ?? [];
    final hasMedia = media.isNotEmpty;
    final time = entry.createdAt;
    final hh = time.hour.toString().padLeft(2, '0');
    final mm = time.minute.toString().padLeft(2, '0');
    return HoverLift(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: InkWell(
        onTap: () => openComposeOverlay(context, entry: entry),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: tokens.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: [BoxShadow(color: tokens.hairline, spreadRadius: 1)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (hasMedia) _MediaGrid(media: media),
              Padding(
                padding: EdgeInsets.all(hasMedia ? 20 : 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Expanded(
                          child: Text(
                            entry.title ?? 'Untitled',
                            style: TextStyle(
                              fontFamily: 'Fraunces',
                              fontSize: 16.5,
                              fontWeight: FontWeight.w500,
                              color: tokens.textPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '$hh:$mm',
                          style: TextStyle(
                            fontFamily: 'JetBrainsMono',
                            fontSize: 11,
                            color: tokens.textTertiary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      entry.body,
                      maxLines: hasMedia ? 2 : 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.5,
                        height: 1.6,
                        color: tokens.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        if (entry.area != null)
                          _LifeTag(label: _areaLabel(entry.area!)),
                        for (final t in entry.tags.take(3)) _Tag(label: t),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _areaLabel(String area) => area.split('_').join(' ');
}

class _LifeTag extends StatelessWidget {
  final String label;

  const _LifeTag({required this.label});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: tokens.accentWash,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeartwoodIconWidget(
            icon: HeartwoodIcon.leaf,
            size: 10,
            color: tokens.accentDeep,
          ),
          const SizedBox(width: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.02,
              color: tokens.accentDeep,
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;

  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: tokens.surfaceRaised,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.02,
          color: tokens.textTertiary,
        ),
      ),
    );
  }
}

class _MediaGrid extends ConsumerWidget {
  final List<dynamic> media;

  const _MediaGrid({required this.media});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final shown = media.take(3).toList();
    final more = media.length - shown.length;
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Expanded(flex: 14, child: _MediaCell(media: shown[0], allMedia: media)),
          if (shown.length > 1) ...[
            const SizedBox(width: 2),
            Expanded(flex: 10, child: _MediaCell(media: shown[1], allMedia: media)),
          ],
          if (shown.length > 2) ...[
            const SizedBox(width: 2),
            Expanded(
              flex: 10,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _MediaCell(media: shown[2], allMedia: media),
                  if (more > 0)
                    Positioned(
                      right: 6,
                      bottom: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0C0E0A).withValues(alpha: 0.72),
                          borderRadius: BorderRadius.circular(AppRadius.pill),
                        ),
                        child: Text(
                          '+$more',
                          style: TextStyle(
                            fontFamily: 'JetBrainsMono',
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: tokens.paper,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MediaCell extends ConsumerStatefulWidget {
  final dynamic media;
  final List<dynamic> allMedia;

  const _MediaCell({required this.media, required this.allMedia});

  @override
  ConsumerState<_MediaCell> createState() => _MediaCellState();
}

class _MediaCellState extends ConsumerState<_MediaCell> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final media = widget.media;
    final isVideo = (media.mimeType as String).startsWith('video/');
    final blob =
        ref.watch(mediaBlobProvider(media.id as String)).valueOrNull;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () => _openViewer(context),
        child: AnimatedContainer(
          duration: AppMotion.fast,
          color: tokens.surfaceRaised,
          alignment: Alignment.center,
          child: blob != null
              ? ColorFiltered(
                  colorFilter: ColorFilter.matrix(_hover
                      ? const [
                          1, 0, 0, 0, 0,
                          0, 1, 0, 0, 0,
                          0, 0, 1, 0, 0,
                          0, 0, 0, 1.06, 0,
                        ]
                      : const [
                          0.92, 0, 0, 0, 0,
                          0, 0.92, 0, 0, 0,
                          0, 0, 0.92, 0, 0,
                          0, 0, 0, 1, 0,
                        ]),
                  child: Image.memory(
                    blob,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                    errorBuilder: (_, _, _) => HeartwoodIconWidget(
                      icon: isVideo ? HeartwoodIcon.camera : HeartwoodIcon.leaf,
                      size: 22,
                      color: tokens.textTertiary,
                    ),
                  ),
                )
              : HeartwoodIconWidget(
                  icon: isVideo ? HeartwoodIcon.camera : HeartwoodIcon.leaf,
                  size: 22,
                  color: tokens.textTertiary,
                ),
        ),
      ),
    );
  }

  void _openViewer(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _MediaViewerPage(
          mediaId: widget.media.id as String,
          allMedia: widget.allMedia,
        ),
      ),
    );
  }
}

class _MediaViewerPage extends ConsumerStatefulWidget {
  final String mediaId;
  final List<dynamic> allMedia;

  const _MediaViewerPage({required this.mediaId, required this.allMedia});

  @override
  ConsumerState<_MediaViewerPage> createState() => _MediaViewerPageState();
}

class _MediaViewerPageState extends ConsumerState<_MediaViewerPage> {
  late int _index = widget.allMedia.indexWhere(
      (m) => (m.id as String) == widget.mediaId);

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final current = widget.allMedia[_index];
    final blob = ref
        .watch(mediaBlobProvider(current.id as String))
        .valueOrNull;
    return Scaffold(
      backgroundColor: const Color(0xFF060705).withValues(alpha: 0.94),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Center(
              child: blob != null
                  ? InteractiveViewer(
                      maxScale: 4,
                      child: Image.memory(blob),
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
          Positioned(
            top: 24,
            right: 28,
            child: HoverRotate(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: tokens.surfaceRaised,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: HeartwoodIconWidget(
                    icon: HeartwoodIcon.x,
                    size: 16,
                    color: tokens.textPrimary,
                  ),
                ),
              ),
            ),
          ),
          if (widget.allMedia.length > 1)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.allMedia.length, (i) {
                  final active = i == _index;
                  return GestureDetector(
                    onTap: () => setState(() => _index = i),
                    child: AnimatedContainer(
                      duration: AppMotion.fast,
                      curve: AppMotion.standard,
                      width: active ? 18 : 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 3.5),
                      decoration: BoxDecoration(
                        color: active
                            ? tokens.accent
                            : tokens.hairlineStrong,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}