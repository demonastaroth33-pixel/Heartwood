import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/models/media_attachment.dart';
import 'package:personalos/features/journal/journal_providers.dart';
import 'package:personalos/features/journal/widgets/media_thumb.dart';
import 'package:personalos/features/journal/widgets/media_viewer.dart';

/// Media-first timeline strip: up to 3 thumbnails + count pill (G2).
class MediaStrip extends ConsumerWidget {
  final String entryId;

  const MediaStrip({super.key, required this.entryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media = ref.watch(mediaForEntryProvider(entryId)).valueOrNull ?? [];
    if (media.isEmpty) return const SizedBox.shrink();
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final shown = media.take(3).toList();
    final more = media.length - shown.length;
    return SizedBox(
      height: 72,
      child: Row(
        children: [
          for (final m in shown)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: AppSpace.sm),
                child: _ThumbTap(
                  media: m,
                  allMedia: media,
                  child: MediaThumb(
                    mediaId: m.id,
                    mimeType: m.mimeType,
                    durationSec: m.durationSec,
                  ),
                ),
              ),
            ),
          if (more > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: tokens.surfaceRaised,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: tokens.hairline),
              ),
              child: Text(
                '+$more',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: tokens.textSecondary),
              ),
            ),
        ],
      ),
    );
  }
}

class _ThumbTap extends StatelessWidget {
  final MediaAttachment media;
  final List<MediaAttachment> allMedia;
  final Widget child;

  const _ThumbTap({
    required this.media,
    required this.allMedia,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showMediaViewer(context, media: media, allMedia: allMedia),
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: child,
    );
  }
}