import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  //Headlines/Titles 
  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.foreground,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.foreground,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.foreground,
  );

  // Card title 
  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.cardForeground,
  );

  //Card subtitle / description inside cards
  static const TextStyle cardSubtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.25,
    color: AppColors.mutedForeground,
  );

  // --- Body text ---
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.45,
    color: AppColors.foreground,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.45,
    color: AppColors.foreground,
  );

  //Small / muted text 
  static const TextStyle small = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.mutedForeground,
  );

  static const TextStyle smallBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.mutedForeground,
  );

 
  static const TextStyle info = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.mutedForeground,
  );

  static const TextStyle infoBold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.mutedForeground,
  );

  static const TextStyle micro = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.mutedForeground,
  );

  static TextTheme textTheme([Color? foreground]) {
    final color = foreground ?? AppColors.foreground;
    return TextTheme(
      headlineLarge: h1.copyWith(color: color),
      headlineMedium: h2.copyWith(color: color),
      headlineSmall: h3.copyWith(color: color),
      titleLarge: cardTitle.copyWith(color: color),
      bodyLarge: body.copyWith(color: color),
      bodyMedium: small.copyWith(color: AppColors.mutedForeground),
      labelSmall: micro.copyWith(color: AppColors.mutedForeground),
    );
  }

  static const smallGrey = TextStyle(
    fontSize: 12,
    color: AppColors.textGrey,
  );

  static const sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

   static const smallpurple = TextStyle(
    fontSize: 12,
    color: AppColors.purple,
  );

   static const smallblue = TextStyle(
    fontSize: 12,
    color: AppColors.lightBlue,
  );

   static const smallblack = TextStyle(
    fontSize: 12,
    color: Colors.black,
  );
}
