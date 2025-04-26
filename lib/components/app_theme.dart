import 'package:bible_app/constants/constants.dart';
import 'package:bible_app/view_model/font_size_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLightTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: Get.find<FontSizeController>().selectedFont.value,
    scaffoldBackgroundColor: AppColors.scaffoldLightColor,
    // Fixed ColorScheme to avoid using deprecated 'background' property
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff17A2B8),
      surface: AppColors.white,
      // Using surfaceContainerLow instead of deprecated 'background'
      surfaceContainerLow: AppColors.scaffoldLightColor,
    ),
    useMaterial3: true,

    // Make sure these properties are consistently defined
    canvasColor: AppColors.scaffoldLightColor,

    // Updated InputDecorationTheme for light theme to explicitly remove underlines
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 13),
      hintStyle: const TextStyle(color: AppColors.darkGray),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      prefixIconColor: AppColors.darkGray,
      // Explicitly setting no underline
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),

    // Card theme with boxShadow, fixed deprecated withOpacity
    cardTheme: CardThemeData(
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      // Using Color.fromRGBO instead of deprecated withOpacity
      shadowColor:
          Colors.grey.withAlpha(128), // Alpha 128 is equivalent to 0.5 opacity
    ),

    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: AppColors.aquaBlue),
        ),
      ),
    ),
    dialogTheme: DialogThemeData(backgroundColor: AppColors.white),
  );
}

class AppDarkTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: Get.find<FontSizeController>().selectedFont.value,
    scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
    primaryColor: const Color(0xFF1B1E25),

    // Make sure these properties are consistently defined
    canvasColor: AppColors.scaffoldDarkColor,

    // Fixed ColorScheme to avoid using deprecated 'background' property
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.black,
      brightness: Brightness.dark,
      surface: AppColors.lightBlack,
      // Using surfaceContainerLow instead of deprecated 'background'
      surfaceContainerLow: AppColors.scaffoldDarkColor,
    ),

    // Comprehensive InputDecorationTheme for dark theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 13),
      hintStyle: const TextStyle(color: AppColors.lightGray),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      prefixIconColor: AppColors.lightGray,
    ),

    // Card theme with no shadow for dark mode
    cardTheme: CardThemeData(
      color: AppColors.lightBlack,
      surfaceTintColor: AppColors.lightBlack,
      shadowColor: Colors.transparent,
    
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: AppColors.aquaBlue),
        ),
      ),
    ),
  );
}
