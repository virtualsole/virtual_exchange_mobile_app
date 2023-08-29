import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDarkMode,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor.withOpacity(.5),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
    ),
  );
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLightMode,
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    primaryColorLight: AppColors.primaryColor.withOpacity(.5),
  );
}

class AppColors {
  static Color scaffoldBackgroundColorLightMode = Colors.white;

  static Color scaffoldBackgroundColorDarkMode = const Color(0xFF1e1e1e);
  static Color primaryColor = const Color(0xFFFFD500);
}
