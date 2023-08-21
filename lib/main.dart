import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:virtual_exchange/Providers/global_provider.dart';
import 'package:virtual_exchange/Providers/home_page_provider.dart';
import 'package:virtual_exchange/splash.dart';

void main() async {
  await GetStorage.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomePageProvider()),
        ChangeNotifierProvider.value(value: GlobalProvider()),
      ],
      child: Consumer<GlobalProvider>(
        builder: (BuildContext context, value, Widget? child) {
          final globalProvider = Provider.of<GlobalProvider>(context, listen: false);

          globalProvider.getThemeFormLocal();

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: globalProvider.themeData,
            home: const SplashScreen(),
          );
        },
      ),
    ),
  );
}
