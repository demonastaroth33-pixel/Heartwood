import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';

import 'package:web/web.dart' as web;

Future<Uint8List?> generateVideoThumbnail(
  Uint8List videoBytes,
  String mimeType,
) async {
  try {
    final completer = Completer<Uint8List?>();
    final blob = web.Blob(
      [videoBytes.toJS].toJS,
      web.BlobPropertyBag(type: mimeType),
    );
    final url = web.URL.createObjectURL(blob);
    final video = web.HTMLVideoElement()
      ..muted = true
      ..preload = 'auto'
      ..src = url;
    video.addEventListener(
      'loadeddata',
      ((web.Event e) {
        video.currentTime = 0.1;
      }).toJS,
    );
    video.addEventListener(
      'seeked',
      ((web.Event e) {
        final canvas = web.HTMLCanvasElement()
          ..width = 320
          ..height = 180;
        final ctx = canvas.getContext('2d') as web.CanvasRenderingContext2D;
        ctx.drawImage(video, 0, 0, 320, 180);
        canvas.toBlob(
          ((web.Blob? result) {
            web.URL.revokeObjectURL(url);
            if (result == null) {
              completer.complete(null);
              return;
            }
            result.arrayBuffer().toDart.then((buffer) {
              completer.complete(buffer.toDart.asUint8List());
            });
          }).toJS,
          'image/jpeg',
          0.7.jsify(),
        );
      }).toJS,
    );
    video.addEventListener(
      'error',
      ((web.Event e) {
        web.URL.revokeObjectURL(url);
        if (!completer.isCompleted) completer.complete(null);
      }).toJS,
    );
    return completer.future;
  } catch (_) {
    return null;
  }
}