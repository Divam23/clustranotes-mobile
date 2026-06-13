import 'package:clustranotes_mobile/app/theme/app_theme.dart';
import 'package:clustranotes_mobile/core/navigation/app_navigation_shell.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: AppNavigationShell(),
    );
  }
}
