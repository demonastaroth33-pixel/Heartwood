import 'package:flutter/foundation.dart';

/// Boot clock for entrance animations. The HTML splash holds ~1.6s + 400ms
/// fade; animations that would otherwise play underneath it (reveal stagger,
/// ring draw-in, storage fill) wait for [complete] so the user actually sees
/// them — mirrors `body.loaded` in the mock.
class AppBoot {
  static final ValueNotifier<bool> complete = ValueNotifier<bool>(false);

  static void markComplete() => complete.value = true;
}