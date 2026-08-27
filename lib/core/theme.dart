
import 'theme/themes.dart' show ThemeValues, inkTheme, themeRegistry;

export 'theme/tokens.dart';
export 'theme/themes.dart';

ThemeValues themeValuesFor(String? key) => themeRegistry[key] ?? inkTheme;