// ignore_for_file: constant_identifier_names

import 'package:get_storage/get_storage.dart';

class AppStorage {
  static const String THEME_MODE = "themeMode";
  static const String USER_ID = "userId";
  static const String USER_DATA = "userData";

  static final box = GetStorage();
}
