import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_radius.dart';
import '../app_text_styles.dart';

class AppDarkTheme {
  AppDarkTheme._();

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      scaffoldBackgroundColor:
      AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        primaryFixed: AppColors.primarySky,
        surface: AppColors.darkSurface,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSurface: AppColors.darkInk,
        onError: Colors.white,
        onSecondary: AppColors.darkInkSecondary,
        surfaceDim: AppColors.darkNavBackground
      ),

      textTheme: TextTheme(
        displayLarge: AppTextStyles.display.copyWith(
          color: AppColors.darkInk,
        ),
        headlineLarge:
        AppTextStyles.heading1.copyWith(
          color: AppColors.darkInk,
        ),
        headlineMedium:
        AppTextStyles.heading2.copyWith(
          color: AppColors.darkInk,
        ),
        headlineSmall:
        AppTextStyles.heading3.copyWith(
          color: AppColors.darkInk,
        ),
        titleLarge:
        AppTextStyles.heading4.copyWith(
          color: AppColors.darkInk,
        ),
        bodyLarge:
        AppTextStyles.bodyLarge.copyWith(
          color: AppColors.darkInk,
        ),
        bodyMedium:
        AppTextStyles.body.copyWith(
          color: AppColors.darkInk,
        ),
        bodySmall:
        AppTextStyles.caption.copyWith(
          color:
          AppColors.darkInkSecondary,
        ),
        labelLarge:
        AppTextStyles.label.copyWith(
          color: AppColors.darkInk,
        ),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor:
        AppColors.darkBackground,
        foregroundColor:
        AppColors.darkInk,
        elevation: 0,
        centerTitle: false,
      ),

      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.card,
          side: const BorderSide(
            color: AppColors.darkBorder,
          ),
        ),
      ),

      inputDecorationTheme:
      InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,

        border: OutlineInputBorder(
          borderRadius: AppRadius.searchBar,
          borderSide: BorderSide.none,
        ),

        enabledBorder:
        OutlineInputBorder(
          borderRadius:
          AppRadius.searchBar,
          borderSide:
          const BorderSide(
            color: AppColors.darkBorder,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.searchBar,
          borderSide: BorderSide(
            color: AppColors.darkBorder,
            width: 1,
          ),
        ),
      ),

      elevatedButtonTheme:
      ElevatedButtonThemeData(
        style:
        ElevatedButton.styleFrom(
          backgroundColor:
          AppColors.primary,
          foregroundColor:
          Colors.white,
          elevation: 0,
          shape:
          RoundedRectangleBorder(
            borderRadius:
            AppRadius.button,
          ),
        ),
      ),

      outlinedButtonTheme:
      OutlinedButtonThemeData(
        style:
        OutlinedButton.styleFrom(
          foregroundColor:
          AppColors.primary,
          side: const BorderSide(
            color: AppColors.darkBorder,
          ),
          shape:
          RoundedRectangleBorder(
            borderRadius:
            AppRadius.button,
          ),
        ),
      ),

      bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(
        selectedItemColor:
        AppColors.primary,
        unselectedItemColor:
        AppColors.darkInkSecondary,
        backgroundColor:
        AppColors.darkBackground,
        type:
        BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
