import 'package:flutter/material.dart';

import 'themes/app_dark_theme.dart';
import 'themes/app_light_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => AppLightTheme.theme;

  static ThemeData get dark => AppDarkTheme.theme;
}
