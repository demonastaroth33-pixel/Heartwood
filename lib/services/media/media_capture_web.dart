import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart' as web;

import 'media_capture.dart';

Future<VlogSession?> startVlogSession() async {
  final stream = await web.window.navigator.mediaDevices
      .getUserMedia(
        web.MediaStreamConstraints(
          audio: true.jsify()!,
          video: {
            'facingMode': 'user',
            'width': {'ideal': 1280},
            'height': {'ideal': 720},
          }.jsify()!,
        ),
      )
      .toDart;
  final recorder = web.MediaRecorder(
    stream,
    web.MediaRecorderOptions(videoBitsPerSecond: 2000000),
  );
  final clock = Stopwatch()..start();
  final vlog = VlogRecorder._(stream, recorder, clock);
  recorder.addEventListener(
    'dataavailable',
    ((web.Event e) {
      final event = e as web.BlobEvent;
      if (event.data.size > 0) {
        vlog._chunks.add(event.data);
      }
    }).toJS,
  );
  recorder.addEventListener('stop', ((web.Event e) {
    vlog._finish();
  }).toJS);
  recorder.addEventListener('error', ((web.Event e) {
    vlog._fail();
  }).toJS);
  recorder.start();
  return vlog;
}

class VlogRecorder implements VlogSession {
  final web.MediaStream _stream;
  final web.MediaRecorder _recorder;
  final Stopwatch _clock;
  final List<web.BlobPart> _chunks = [];
  final Completer<CapturedMedia> _done = Completer<CapturedMedia>();
  bool _finished = false;

  VlogRecorder._(this._stream, this._recorder, this._clock);

  @override
  Future<CapturedMedia> stop() async {
    if (!_finished) {
      _stopTracks();
      _recorder.stop();
    }
    return _done.future;
  }

  void _finish() {
    if (_finished) return;
    _finished = true;
    _stopTracks();
    _clock.stop();
    final blob = web.Blob(
      _chunks.toJS,
      web.BlobPropertyBag(type: _recorder.mimeType),
    );
    final future = blob.arrayBuffer().toDart.then(
      (buffer) => CapturedMedia(
        bytes: buffer.toDart.asUint8List(),
        mimeType: _recorder.mimeType,
        durationSec: _clock.elapsed.inSeconds,
        fileName: 'vlog-${DateTime.now().millisecondsSinceEpoch}.webm',
      ),
    );
    _done.complete(future);
  }

  void _fail() {
    if (_finished) return;
    _finished = true;
    _stopTracks();
    if (!_done.isCompleted) {
      _done.completeError(StateError('Recording failed'));
    }
  }

  void _stopTracks() {
    for (final track in _stream.getTracks().toDart) {
      track.stop();
    }
  }
}