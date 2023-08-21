import 'package:flutter/material.dart';

import 'package:virtual_exchange/Services/StorageServices/get_storage.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class GlobalProvider extends ChangeNotifier {
  bool isDarkMode = false;

  late ThemeData themeData;

  void setThemeData(bool dark) {
    if (dark) {
      ///Dark Theme
      themeData = ThemeData(
        fontFamily: "poppins",
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 18, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 15, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 12, color: Colors.white),
          bodySmall: TextStyle(fontSize: 12, color: Colors.white),
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        primaryColorLight: const Color(0xff1D2129),
        dividerColor: Colors.white,
        cardColor: Colors.white,
        primarySwatch: MaterialColor(AppColors.primaryColorCode, const {
          50: Color(0xffFDE2E5),
          100: Color(0xffF8B5BD),
          200: Color(0xffF08692),
          300: Color(0xffEB5970),
          400: Color(0xffE52F55),
          500: Color(0xffDC042B),
          600: Color(0xffD90229),
          700: Color(0xffCF0026),
          800: Color(0xffC60123),
          900: Color(0xffBB001E),
        }),
        appBarTheme: AppBarTheme(
          centerTitle: false,
          // backgroundColor: themeColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.primaryColor,
          ),
        ),
      );
      return;
    }

    ///Light Theme

    themeData = ThemeData(
      fontFamily: "poppins",
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 18, color: Colors.black),
        headlineMedium: TextStyle(fontSize: 15, color: Colors.black),
        headlineSmall: TextStyle(fontSize: 12, color: Colors.black),
        bodySmall: TextStyle(fontSize: 12, color: Colors.black),
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColorLight: Colors.white,
      dividerColor: Colors.black,
      cardColor: Colors.green,
      primarySwatch: MaterialColor(AppColors.primaryColorCode, const {
        50: Color(0xffFDE2E5),
        100: Color(0xffF8B5BD),
        200: Color(0xffF08692),
        300: Color(0xffEB5970),
        400: Color(0xffE52F55),
        500: Color(0xffDC042B),
        600: Color(0xffD90229),
        700: Color(0xffCF0026),
        800: Color(0xffC60123),
        900: Color(0xffBB001E),
      }),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }

  void getThemeFormLocal() {
    isDarkMode = AppStorage.box.read(AppStorage.darkMode) ?? false;
    setThemeData(isDarkMode);

    Future.delayed(Duration.zero, () {});
  }

  void changeTheme() {
    if (isDarkMode == false) {
      AppStorage.box.write(AppStorage.darkMode, true);
    } else {
      // themeColor = Colors.grey.withOpacity(.2);
      AppStorage.box.write(AppStorage.darkMode, false);
    }
    getThemeFormLocal();
    notifyListeners();
  }
}
