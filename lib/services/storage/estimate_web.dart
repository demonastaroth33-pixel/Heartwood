import 'dart:js_interop';

import 'package:web/web.dart' as web;

Future<int?> estimateUsageBytes() async {
  final estimate = await web.window.navigator.storage.estimate().toDart;
  return estimate.usage;
}

Future<int?> estimateQuotaBytes() async {
  final estimate = await web.window.navigator.storage.estimate().toDart;
  return estimate.quota;
}