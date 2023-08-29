import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:virtual_exchange/app_theme.dart';
import '/Providers/AuthProviders/auth_provider.dart';
import 'app.dart';

void main() async {
  await GetStorage.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeProvider()),
        ChangeNotifierProvider.value(value: AuthProvider()),
      ],
      child: Consumer<ThemeProvider>(
          builder: (BuildContext context, ThemeProvider value, Widget? child) {
        return GetMaterialApp(
          title: 'Virtual Exchange',
          debugShowCheckedModeBanner: false,
          theme: value.themeData,
          initialRoute: '/root',
          defaultTransition: Transition.native,
          locale: const Locale('en', 'EN'),
          getPages: [
            GetPage(name: '/root', page: () => const App()),
          ],
        );
      }),
    ),
  );
}
