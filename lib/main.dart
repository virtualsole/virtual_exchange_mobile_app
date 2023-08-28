import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:virtual_exchange/app_theme.dart';
import 'package:virtual_exchange/src/utlis.dart';
import 'src/app.dart';

void main() async {
  await GetStorage.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
          builder: (BuildContext context, ThemeProvider value, Widget? child) {
        return GetMaterialApp(
          title: 'Virtual Exchange',
          debugShowCheckedModeBanner: false,
          theme: value.themeData,
          initialRoute: '/root',
          defaultTransition: Transition.native,
          locale: Locale('en', 'EN'),
          getPages: [
            GetPage(name: '/root', page: () => App()),
          ],
        );
      }),
    ),
  );
}
