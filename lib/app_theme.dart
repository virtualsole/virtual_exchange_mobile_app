import 'package:flutter/material.dart';
import 'package:virtual_exchange/Services/storage_services.dart';
import 'package:virtual_exchange/utlis.dart';

class AppTheme {
  static final darkTheme = ThemeData(
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
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLightMode,
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    primaryColorLight: AppColors.primaryColor.withOpacity(.5),
  );
}

class AppColors {
  static Color scaffoldBackgroundColorDarkMode = const Color(0xFF1e1e1e);
  static Color primaryColor = const Color(0xFFFFD500);
  static Color scaffoldBackgroundColorLightMode = Colors.white;
}

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = AppTheme.darkTheme;
  bool darkMode = true;

  void getTheme() async {
    bool? res = AppStorage.box.read(AppStorage.THEME_MODE);
    if (res == true) {
      darkMode = true;
    } else {
      darkMode = false;
    }

    darkMode ? themeData = AppTheme.darkTheme : AppTheme.lightTheme;
    logger.i(darkMode);
    notifyListeners();
  }

  void changeTheme() async {
    await AppStorage.box.write(AppStorage.THEME_MODE, darkMode ? false : true);
    getTheme();
  }
}
