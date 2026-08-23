import 'dart:typed_data';

import 'thumbnail_stub.dart'
    if (dart.library.js_interop) 'thumbnail_web.dart' as impl;

/// Generates a small jpeg thumbnail from a video blob (G6). Web: seeks the
/// video to ~0.1s, draws the frame to a canvas, encodes. Non-web: no-op.
/// Returns null when generation is unsupported or failed.
Future<Uint8List?> generateVideoThumbnail(
  Uint8List videoBytes,
  String mimeType,
) =>
    impl.generateVideoThumbnail(videoBytes, mimeType);