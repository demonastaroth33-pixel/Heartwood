import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/models/media_attachment.dart';
import 'package:personalos/features/journal/journal_providers.dart';
import 'package:personalos/services/web/video_view.dart';

/// Full-screen media viewer (G3): photos render directly; videos play inline
/// via object URL (web). Swipeable index when multiple attachments exist.
Future<void> showMediaViewer(
  BuildContext context, {
  required MediaAttachment media,
  List<MediaAttachment> allMedia = const [],
}) {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black87,
    builder: (_) => _MediaViewer(media: media, allMedia: allMedia),
  );
}

class _MediaViewer extends ConsumerStatefulWidget {
  final MediaAttachment media;
  final List<MediaAttachment> allMedia;

  const _MediaViewer({required this.media, required this.allMedia});

  @override
  ConsumerState<_MediaViewer> createState() => _MediaViewerState();
}

class _MediaViewerState extends ConsumerState<_MediaViewer> {
  late int _index = widget.allMedia
      .indexWhere((m) => m.id == widget.media.id)
      .clamp(0, widget.allMedia.isEmpty ? 0 : widget.allMedia.length - 1);

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final list = widget.allMedia.isEmpty ? [widget.media] : widget.allMedia;
    final current = list[_index];
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: _MediaPage(media: current),
            ),
          ),
          Positioned(
            top: MediaQuery.paddingOf(context).top + 8,
            right: AppSpace.lg,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black45,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          if (list.length > 1)
            Positioned(
              bottom: MediaQuery.paddingOf(context).bottom + AppSpace.lg,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(list.length, (i) {
                  return GestureDetector(
                    onTap: () => setState(() => _index = i),
                    child: Container(
                      width: i == _index ? 16 : 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: i == _index ? tokens.accent : Colors.white30,
                        borderRadius: BorderRadius.circular(AppRadius.pill),
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

class _MediaPage extends ConsumerWidget {
  final MediaAttachment media;

  const _MediaPage({required this.media});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVideo = media.mimeType.startsWith('video/');
    final blob = ref.watch(mediaBlobProvider(media.id)).valueOrNull;
    if (isVideo) {
      if (blob == null) {
        return const Center(child: CircularProgressIndicator());
      }
      return Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoView(bytes: blob, mimeType: media.mimeType, autoplay: true),
        ),
      );
    }
    if (blob == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Center(
      child: InteractiveViewer(
        maxScale: 4,
        child: Image.memory(blob, fit: BoxFit.contain),
      ),
    );
  }
}