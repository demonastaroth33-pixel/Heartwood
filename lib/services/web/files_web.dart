import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';

import 'package:web/web.dart' as web;

import 'files.dart';

void downloadBytes(String fileName, Uint8List bytes) {
  final blob = web.Blob(
    [bytes.toJS].toJS,
    web.BlobPropertyBag(type: 'application/octet-stream'),
  );
  final url = web.URL.createObjectURL(blob);
  final anchor = web.HTMLAnchorElement()
    ..href = url
    ..download = fileName;
  anchor.click();
  web.URL.revokeObjectURL(url);
}

Future<List<PickedFile>> pickFiles({bool multiple = true}) {
  final completer = Completer<List<PickedFile>>();
  final input = web.HTMLInputElement()
    ..type = 'file'
    ..multiple = multiple;
  input.addEventListener(
    'change',
    ((web.Event e) async {
      final files = input.files;
      if (files == null) {
        completer.complete([]);
        return;
      }
      final result = <PickedFile>[];
      for (var i = 0; i < files.length; i++) {
        final file = files.item(i);
        if (file == null) continue;
        final buffer = await file.arrayBuffer().toDart;
        result.add(
          PickedFile(name: file.name, bytes: buffer.toDart.asUint8List()),
        );
      }
      completer.complete(result);
    }).toJS,
  );
  input.click();
  return completer.future;
}