import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:virtual_exchange/Providers/home_page_provider.dart';
import 'package:virtual_exchange/splash.dart';
import 'package:virtual_exchange/string_and_consts.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomePageProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "poppins",
          textTheme: const TextTheme(
            headlineLarge: TextStyle(fontSize: 18, color: Colors.white),
            headlineMedium: TextStyle(fontSize: 15, color: Colors.white),
            headlineSmall: TextStyle(fontSize: 12, color: Colors.white),
            bodySmall: TextStyle(fontSize: 12, color: Colors.white),
          ),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
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
            backgroundColor: AppColors.themeColor,
            elevation: 0,
            iconTheme: IconThemeData(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    ),
  );
}
