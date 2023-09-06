// ignore_for_file: non_constant_identifier_names

import 'package:virtual_exchange/Models/AuthModels/registration_response.dart';
import 'package:virtual_exchange/Models/AuthModels/user_model.dart';

import 'package:virtual_exchange/Services/StorageServices/storage_services.dart';
import 'package:virtual_exchange/models/AuthModels/user_profile_response.dart';

class AppKeys {
  String get apiKey {
    return "28b4b56939b14fdf30bcefeb3e935193b0f07ce22523ab5d32afcf3f4151edc0";
  }

  String? get userID {
    return userIdModelFromJson(AppStorage.box.read(AppStorage.USER_ID)).data?.userId;
  }

  User? get userData {
    return userProfileResponseFromJson(AppStorage.box.read(AppStorage.USER_DATA)).userData;
  }

  String LOGIN_VERIFICATION = 'login_verification';
}
