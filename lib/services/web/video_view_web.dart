import 'dart:js_interop';
import 'dart:typed_data';
import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

import 'video_view.dart';

/// Web implementation: plays bytes via an object URL on an HtmlElementView.
/// Each instance registers its own view type so multiple videos coexist.
Widget buildVideoView(VideoView view) {
  return _ObjectUrlVideo(
    bytes: view.bytes,
    mimeType: view.mimeType,
    autoplay: view.autoplay,
  );
}

class _ObjectUrlVideo extends StatefulWidget {
  final Uint8List bytes;
  final String mimeType;
  final bool autoplay;

  const _ObjectUrlVideo({
    required this.bytes,
    required this.mimeType,
    required this.autoplay,
  });

  @override
  State<_ObjectUrlVideo> createState() => _ObjectUrlVideoState();
}

class _ObjectUrlVideoState extends State<_ObjectUrlVideo> {
  static int _viewCounter = 0;
  late final String _viewType;
  String? _url;

  @override
  void initState() {
    super.initState();
    _viewType = 'personalos-video-${_viewCounter++}';
    final blob = web.Blob(
      [widget.bytes.toJS].toJS,
      web.BlobPropertyBag(type: widget.mimeType),
    );
    _url = web.URL.createObjectURL(blob);
    _registerView();
  }

  void _registerView() {
    final url = _url!;
    final autoplay = widget.autoplay;
    ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final video = web.HTMLVideoElement()
        ..controls = true
        ..autoplay = autoplay
        ..style.width = '100%'
        ..style.height = '100%'
        ..src = url;
      return video;
    });
  }

  @override
  void dispose() {
    if (_url != null) web.URL.revokeObjectURL(_url!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewType);
  }
}

Widget buildLivePreview(LivePreview view) {
  final stream = view.streamHandle;
  if (stream == null || !stream.isA<web.MediaStream>()) {
    return view.fallback ??
        Container(
          color: Colors.black26,
          alignment: Alignment.center,
          child: const Icon(Icons.videocam, size: 48),
        );
  }
  return _StreamPreview(stream: stream as web.MediaStream);
}

class _StreamPreview extends StatefulWidget {
  final web.MediaStream stream;

  const _StreamPreview({required this.stream});

  @override
  State<_StreamPreview> createState() => _StreamPreviewState();
}

class _StreamPreviewState extends State<_StreamPreview> {
  static int _viewCounter = 0;
  late final String _viewType;

  @override
  void initState() {
    super.initState();
    _viewType = 'personalos-preview-${_viewCounter++}';
    ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final video = web.HTMLVideoElement()
        ..autoplay = true
        ..muted = true
        ..style.width = '100%'
        ..style.height = '100%'
        ..srcObject = widget.stream;
      return video;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewType);
  }
}