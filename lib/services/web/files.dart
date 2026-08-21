import 'dart:typed_data';

import 'files_stub.dart' if (dart.library.js_interop) 'files_web.dart' as impl;

class PickedFile {
  final String name;
  final Uint8List bytes;

  const PickedFile({required this.name, required this.bytes});
}

void downloadBytes(String fileName, Uint8List bytes) =>
    impl.downloadBytes(fileName, bytes);

Future<List<PickedFile>> pickFiles({bool multiple = true}) =>
    impl.pickFiles(multiple: multiple);