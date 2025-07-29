import 'package:flutter/material.dart';
import 'package:iss_task_app/core/constants/app_colors.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkBackground,
  primaryColor: AppColors.darkPrimary,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.darkPrimary,
    surface: AppColors.darkSurface,
    error: AppColors.darkError,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? Colors.grey.shade400
            : AppColors.darkPrimary,
      ),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      elevation: WidgetStateProperty.all<double>(4),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkBackground,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.darkPrimary),
  ),
);
