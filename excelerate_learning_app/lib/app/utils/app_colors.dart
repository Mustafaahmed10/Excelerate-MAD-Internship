import 'package:flutter/material.dart';

class AppColors {
  // LIGHT THEME
  static const Color background = Color.fromARGB(255, 250, 251, 255);
  static const Color foreground = Color(0xFF232323);
  static const Color card = Colors.white;
  static const Color cardForeground = Color(0xFF232323);
  static const Color popover = Colors.white;
  static const Color popoverForeground = Color(0xFF232323);
  static const Color secondary = Color(0xFFF2F2F7);
  static const Color muted = Color(0xFFECECF0);
  static const Color mutedForeground = Color(0xFF717182);
  static const Color accent = Color(0xFFE9EBEF);
  static const Color accentForeground = Color(0xFF030213);
  static const Color destructive = Color(0xFFD4183D);
  static const Color destructiveForeground = Colors.white;
  static const Color purple = Color(0xFFBD55DB);
  static const Color smallTextGrey = Color(0xFF6B7280);
  static const Color lightBlue = Color(0xFF72AAFF);
  static const Color cian = Color(0xFFC8F0F7);
  static const Color yellow = Color(0xFFFDC700);
  static const primary = Color(0xFF007BFF);
  static const textDark = Color(0xFF1C1C1C);
  static const textGrey = Color(0xFF6C757D);
  static const iconGrey = Color(0xFF9E9E9E);
  static const cardBackground = Colors.white;
  static const border = Color(0xFFE0E0E0);

  // PRIMARY GRADIENT
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // SIDEBAR
  static const Color sidebar = Color(0xFFF9FAFC);
  static const Color sidebarForeground = Color(0xFF232323);
  static const Color sidebarPrimary = Color(0xFF030213);

  // RADIUS
  static const double borderRadius = 12.0;
}
