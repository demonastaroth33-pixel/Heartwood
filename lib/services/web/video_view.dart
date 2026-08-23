import 'dart:typed_data';

import 'package:flutter/widgets.dart';

import 'video_view_stub.dart'
    if (dart.library.js_interop) 'video_view_web.dart' as impl;

/// Inline video player (G3): web impl plays bytes via an object URL on an
/// HtmlElementView; stub renders a quiet placeholder (VM tests).
class VideoView extends StatelessWidget {
  final Uint8List bytes;
  final String mimeType;
  final bool autoplay;

  const VideoView({
    super.key,
    required this.bytes,
    required this.mimeType,
    this.autoplay = false,
  });

  @override
  Widget build(BuildContext context) => impl.buildVideoView(this);
}

/// Live camera preview (G5): binds the recording session's MediaStream to a
/// video element via srcObject. The handle is a platform object (web:
/// MediaStream); null → placeholder.
class LivePreview extends StatelessWidget {
  final Object? streamHandle;
  final Widget? fallback;

  const LivePreview({super.key, this.streamHandle, this.fallback});

  @override
  Widget build(BuildContext context) => impl.buildLivePreview(this);
}