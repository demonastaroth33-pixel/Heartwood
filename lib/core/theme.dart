import 'theme/themes.dart' as themes;
import 'theme/themes.dart' show ThemeValues;

export 'theme/tokens.dart';
export 'theme/themes.dart';

/// Resolve theme values from a settings key; unknown keys fall back to Ink.
ThemeValues themeValuesFor(String? key) =>
    themes.themeRegistry[key] ?? themes.inkTheme;