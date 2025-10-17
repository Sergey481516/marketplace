import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTypography {
  static const String fontFamily = 'GeneralSans';

  static TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 64,
    fontWeight: FontWeight.w600,
    height: 0.8,
    letterSpacing: -3.2,
    color: AppColors.primary[900]!,
  );

  static TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1,
    letterSpacing: -1.6,
    color: AppColors.primary[900]!,
  );

  static TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: AppColors.primary[900]!,
  );

  static TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColors.primary[900]!,
  );

  static TextStyle body1Semibold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.primary[900]!,
  );

  static TextStyle body1Medium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColors.primary[900]!,
  );

  static TextStyle body1Regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.primary[900]!,
  );

  static TextStyle body2Semibold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.primary[900]!,
  );

  static TextStyle body2Medium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColors.primary[900]!,
  );

  static TextStyle body2Regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.primary[900]!,
  );

  static TextStyle body3Semibold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.primary[900]!,
  );

  static TextStyle body3Medium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColors.primary[900]!,
  );

  static TextStyle body3Regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.primary[900]!,
  );

  static TextTheme textTheme = TextTheme(
    displayLarge: h1,
    displayMedium: h2,
    displaySmall: h3,
    headlineMedium: h4,
    bodyLarge: body1Regular,
    bodyMedium: body2Regular,
    bodySmall: body3Regular,
    titleLarge: body1Semibold,
    titleMedium: body2Semibold,
    titleSmall: body3Semibold,
  );
}
