import 'package:flutter/material.dart';
import 'package:virtual_exchange/Providers/providers.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDarkMode,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor.withOpacity(.5),
    primarySwatch: Colors.grey,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 1,
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
    ),
  );
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLightMode,
    primaryColor: AppColors.primaryColor,
    primarySwatch: Colors.grey,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 1,
    ),
    primaryColorLight: AppColors.primaryColor.withOpacity(.5),
  );
}

class AppColors {
  static Color scaffoldBackgroundColorLightMode = Colors.white;

  static Color scaffoldBackgroundColorDarkMode = const Color(0xFF1e1e1e);
  static Color primaryColor = const Color(0xFFFFD500);
}
