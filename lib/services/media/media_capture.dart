import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

import 'media_capture_stub.dart'
    if (dart.library.js_interop) 'media_capture_web.dart' as impl;

class CapturedMedia {
  final Uint8List bytes;
  final String mimeType;
  final int? durationSec;
  final String fileName;

  const CapturedMedia({
    required this.bytes,
    required this.mimeType,
    this.durationSec,
    required this.fileName,
  });
}

abstract class MediaCaptureService {
  Future<CapturedMedia?> pickPhoto();
  Future<VlogSession?> startVlog();
}

abstract class VlogSession {
  Future<CapturedMedia> stop();
}

class WebMediaCapture implements MediaCaptureService {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<CapturedMedia?> pickPhoto() async {
    XFile? file;
    try {
      file = await _picker.pickImage(source: ImageSource.camera);
    } catch (_) {
      file = await _picker.pickImage(source: ImageSource.gallery);
    }
    if (file == null) return null;
    final bytes = await file.readAsBytes();
    return CapturedMedia(
      bytes: bytes,
      mimeType: 'image/jpeg',
      fileName: file.name,
    );
  }

  @override
  Future<VlogSession?> startVlog() => impl.startVlogSession();
}