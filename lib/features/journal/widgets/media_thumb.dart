import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/widgets/heartwood_icon.dart';

/// One media thumbnail: photos decode their own blob; videos use the
/// generated thumbnailBlob or a quiet placeholder.
class MediaThumb extends ConsumerStatefulWidget {
  final String mediaId;
  final String mimeType;
  final int? durationSec;

  const MediaThumb({
    super.key,
    required this.mediaId,
    required this.mimeType,
    this.durationSec,
  });

  @override
  ConsumerState<MediaThumb> createState() => _MediaThumbState();
}

class _MediaThumbState extends ConsumerState<MediaThumb> {
  late final Future<Uint8List?> _blob;

  @override
  void initState() {
    super.initState();
    _blob = widget.mimeType.startsWith('image/')
        ? ref.read(mediaRepoProvider).loadBlob(widget.mediaId)
        : ref.read(mediaRepoProvider).loadThumbnail(widget.mediaId);
  }

  @override
  Widget build(BuildContext context) {
    final isVideo = widget.mimeType.startsWith('video/');
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: FutureBuilder<Uint8List?>(
        future: _blob,
        builder: (context, snap) {
          final bytes = snap.data;
          if (bytes != null && bytes.isNotEmpty) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.memory(
                  bytes,
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                  errorBuilder: (_, _, _) => _placeholder(context, isVideo),
                ),
                if (isVideo)
                  const Center(
                    child: HeartwoodIconWidget(
                      icon: HeartwoodIcon.camera,
                      size: 18,
                      color: Color(0xB3F4F0E4),
                    ),
                  ),
              ],
            );
          }
          return _placeholder(context, isVideo);
        },
      ),
    );
  }

  Widget _placeholder(BuildContext context, bool isVideo) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      color: tokens.surfaceRaised,
      alignment: Alignment.center,
      child: isVideo
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeartwoodIconWidget(
                  icon: HeartwoodIcon.camera,
                  size: 18,
                  color: tokens.accent,
                ),
                if (widget.durationSec != null) ...[
                  const SizedBox(height: 5),
                  Text(
                    '${widget.durationSec}s',
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontSize: 9,
                      color: tokens.textSecondary,
                    ),
                  ),
                ],
              ],
            )
          : HeartwoodIconWidget(
              icon: HeartwoodIcon.leaf,
              size: 18,
              color: tokens.textTertiary,
            ),
    );
  }
}