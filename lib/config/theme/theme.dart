import 'package:flutter/material.dart';

import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  textTheme: AppTypography.textTheme.apply(
    bodyColor: AppColors.textPrimary,
    displayColor: AppColors.textPrimary,
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: AppColors.primary,
  ).copyWith(secondary: AppColors.success, error: AppColors.error),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.primary[0],

    counterStyle: WidgetStateTextStyle.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return TextStyle(color: AppColors.primary[100]!);
      }

      return TextStyle(color: AppColors.primary[100]!);
    }),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.primary[900]!),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.primary[400]!),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.error),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.error),
    ),

    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.primary[100]!),
    ),
  ),

  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.primary[200];
        }

        return AppColors.primary[900];
      }),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevation: WidgetStateProperty.all(0),
      padding: WidgetStateProperty.all(EdgeInsets.all(16)),
      textStyle: WidgetStateProperty.all(AppTypography.body1Medium),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.primary[200];
        }

        return AppColors.primary[0];
      }),
      foregroundColor: WidgetStateProperty.all(AppColors.primary[900]),
      side: WidgetStateProperty.all(
        BorderSide(width: 1, color: AppColors.primary[200]!),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      padding: WidgetStateProperty.all(EdgeInsets.all(16)),
      textStyle: WidgetStateProperty.all(AppTypography.body1Medium),
    ),
  ),
);
