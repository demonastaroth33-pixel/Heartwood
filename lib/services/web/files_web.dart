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
    ((web.Event e) {
      final files = input.files;
      if (files == null) {
        completer.complete([]);
        return;
      }
      final result = <PickedFile>[];
      var index = 0;
      void next() {
        if (index >= files.length) {
          completer.complete(result);
          return;
        }
        final file = files.item(index);
        index++;
        if (file == null) {
          next();
          return;
        }
        file.arrayBuffer().toDart.then((buffer) {
          result.add(
            PickedFile(name: file.name, bytes: buffer.toDart.asUint8List()),
          );
          next();
        });
      }

      next();
    }).toJS,
  );
  input.addEventListener('cancel', ((web.Event e) {
    if (!completer.isCompleted) completer.complete([]);
  }).toJS);
  input.click();
  return completer.future;
}