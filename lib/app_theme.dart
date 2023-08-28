import 'package:flutter/material.dart';
import 'package:virtual_exchange/src/Services/storage_services.dart';
import 'package:virtual_exchange/src/utlis.dart';

class AppTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDarkMode,
      primaryColor: Color(0xFFFFD500),
      primaryColorLight: Color(0xFFFFD500).withOpacity(.5));
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLightMode,
      primaryColor: Color(0xFFFFD500),
      primaryColorLight: Color(0xFFFFD500).withOpacity(.5));
}

class AppColors {
  static Color scaffoldBackgroundColorDarkMode = Color(0xFF1e1e1e);
  static Color scaffoldBackgroundColorLightMode = Colors.white;
}

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = AppTheme.darkTheme;
  bool darkMode = true;

  void getTheme() async {
    bool? res = await AppStorage.box.read(AppStorage.THEME_MODE);
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
