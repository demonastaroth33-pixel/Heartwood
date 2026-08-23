import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/providers.dart';

/// One media thumbnail: photos decode their own blob; videos use the
/// generated thumbnailBlob or a quiet "generating…" placeholder (G6).
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
                    child: Icon(Icons.play_circle_outline,
                        size: 28, color: Colors.white70),
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [tokens.surfaceRaised, tokens.accentDim],
        ),
      ),
      child: Center(
        child: Icon(
          isVideo ? Icons.videocam : Icons.image,
          size: 20,
          color: tokens.textDisabled,
        ),
      ),
    );
  }
}