// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:iss_task_app/core/constants/app_colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,

  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    surface: AppColors.surface,
    error: AppColors.error,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(color: AppColors.textPrimary),
    bodyMedium: TextStyle(color: AppColors.textSecondary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.primary.withOpacity(
            0.85,
          ); // Slightly darker when pressed
        }
        if (states.contains(WidgetState.disabled)) {
          return Colors.blueGrey;
        }
        return AppColors.primary;
      }),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      overlayColor: WidgetStateProperty.all<Color>(
        AppColors.primary.withOpacity(0.1),
      ), // Subtle overlay
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      elevation: WidgetStateProperty.all<double>(2),
    ),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.background,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.primary),
  ),
);
