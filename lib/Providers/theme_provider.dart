import 'package:flutter/material.dart';
import 'package:virtual_exchange/app_theme.dart';
import 'package:virtual_exchange/utlis.dart';

import '../Services/storage_services.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = AppTheme.darkTheme;
  bool darkMode = true;

  Future<void> getTheme() async {
    bool res = AppStorage.box.read(AppStorage.THEME_MODE) ?? false;
    if (res == true) {
      darkMode = true;
    } else {
      darkMode = false;
    }

    darkMode ? themeData = AppTheme.darkTheme : themeData = AppTheme.lightTheme;
    Future.delayed(Duration.zero, () => notifyListeners());
  }

  void changeTheme() async {
    await AppStorage.box.write(AppStorage.THEME_MODE, darkMode ? false : true);

    darkMode = await AppStorage.box.read(AppStorage.THEME_MODE);

    darkMode ? themeData = AppTheme.darkTheme : themeData = AppTheme.lightTheme;
    notifyListeners();
  }
}
