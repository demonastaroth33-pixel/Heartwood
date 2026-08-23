import 'package:flutter/material.dart';

import 'video_view.dart';

/// VM/test fallback — no real video element.
Widget buildVideoView(VideoView view) {
  return Container(
    color: Colors.black26,
    alignment: Alignment.center,
    child: const Icon(Icons.play_circle_outline, size: 48),
  );
}

Widget buildLivePreview(LivePreview view) {
  return view.fallback ??
      Container(
        color: Colors.black26,
        alignment: Alignment.center,
        child: const Icon(Icons.videocam, size: 48),
      );
}