import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/res/app_colors.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';

final themeData = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light().copyWith(
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    surfaceContainer: AppColors.surfaceContainer,
    surfaceContainerHigh: AppColors.surfaceContainerHigh,
    onSurface: AppColors.onSurface,
    onSurfaceVariant: AppColors.onSurfaceVariant,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: AppDimens.textLarge,
      fontWeight: FontWeight.bold,
      color: AppColors.onSurface,
    ),
    headlineMedium: TextStyle(
      fontSize: AppDimens.textMedium,
      fontWeight: FontWeight.bold,
      color: AppColors.onSurface,
    ),
    headlineSmall: TextStyle(
      fontSize: AppDimens.textSmall,
      fontWeight: FontWeight.bold,
      color: AppColors.onSurface,
    ),
    bodyLarge: TextStyle(
      fontSize: AppDimens.textLarge,
      color: AppColors.onSurface,
    ),
    bodyMedium: TextStyle(
      fontSize: AppDimens.textMedium,
      color: AppColors.onSurface,
    ),
    bodySmall: TextStyle(
      fontSize: AppDimens.textSmall,
      color: AppColors.onSurface,
    ),
    labelLarge: TextStyle(
      fontSize: AppDimens.textLarge,
      color: AppColors.onSurfaceVariant,
    ),
    labelMedium: TextStyle(
      fontSize: AppDimens.textMedium,
      color: AppColors.onSurfaceVariant,
    ),
    labelSmall: TextStyle(
      fontSize: AppDimens.textSmall,
      color: AppColors.onSurfaceVariant,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.onSurface,
    size: AppDimens.iconLarge,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      iconSize: AppDimens.iconLarge,
    ),
  ),
  scaffoldBackgroundColor: AppColors.surfaceContainer,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: AppColors.surfaceContainerHigh,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.onSurfaceVariant,
    selectedLabelStyle: TextStyle(
      color: AppColors.primary,
      fontSize: AppDimens.textXSmall,
    ),
    unselectedLabelStyle: TextStyle(
      color: AppColors.onSurfaceVariant,
      fontSize: AppDimens.textXSmall,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    toolbarHeight: AppDimens.appBarHeight,
    titleTextStyle: TextStyle(
      fontSize: AppDimens.textLarge,
      fontWeight: FontWeight.bold,
      color: AppColors.onPrimary,
    ),
    iconTheme:
        IconThemeData(color: AppColors.onPrimary, size: AppDimens.iconLarge),
    actionsIconTheme: IconThemeData(color: AppColors.onPrimary),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(
      fontSize: AppDimens.textXLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary,
        width: 2.0,
      ),
    ),
    contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 4),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary,
        width: 2.0,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary,
        width: 2.0,
      ),
    ),
  ),
  radioTheme: const RadioThemeData(
    fillColor: WidgetStatePropertyAll(AppColors.primary),
    overlayColor: WidgetStatePropertyAll(AppColors.primary),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: const TextStyle(
        fontSize: AppDimens.textLarge,
        fontWeight: FontWeight.w600,
        color: AppColors.onPrimary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: AppDimens.textLarge,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
      side: const BorderSide(
        color: AppColors.primary,
        width: 2.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
      ),
    ),
  ),
);
