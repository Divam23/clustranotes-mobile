import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Palette
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFFEFF6FF);
  static const Color primaryDark = Color(0xFF1D4ED8);
  static const Color primarySky = Color(0xFF60A5FA);

  // Light Mode Specific
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF8FAFC);
  static const Color lightInk = Color(0xFF0F172A);
  static const Color lightInkSecondary = Color(0xFF6B7280);
  static const Color border = Color(0xFFE5E7EB);
  static const Color lightNavBackground = Color(0xFFF8FAFC);

  // Dark Mode Specific
  static const Color darkBackground = Color(0xFF000000);
  static const Color darkSurface = Color(0xFF161616);
  static const Color darkInk = Color(0xFFF8FAFC);
  static const Color darkInkSecondary = Color(0xFFCBD5E1);
  static const Color darkBorder = Color(0xFF334155);
  static const Color darkNavBackground = Color(0xFF0F172A);

  // General Typography & Elements
  static const Color surfaceRaised = Color(0xFFF3F4F6);
  static const Color ink = Color(0xFF111827);
  static const Color inkSecondary = Color(0xFF6B7280);
  static const Color inkTertiary = Color(0xFF9CA3AF);
  
  // Status & Feedback Colors
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFDC2626);

  // Status Backgrounds
  static const Color successBackground = Color(0xFFF0FDF4);
  static const Color warningBackground = Color(0xFFFFFBEB);
  static const Color errorBackground = Color(0xFFFEF2F2);

  // Utilities & Badges
  static const Color transparent = Colors.transparent;
  static const Color notificationBadge = Color(0xFFDC2626);

  // Status Colors
  static const Color info = Color(0xFF2563EB);
  static const Color neutral = Color(0xFF6B7280);

  // Backgrounds
  static const Color infoBackground = Color(0xFFEFF6FF);
  static const Color neutralBackground = Color(0xFFF3F4F6);
}
