import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:virtual_exchange/Services/HttpServices/api_key.dart';
import 'package:virtual_exchange/Services/HttpServices/api_services.dart';
import 'package:virtual_exchange/Services/HttpServices/api_urls.dart';
import 'package:virtual_exchange/Services/StorageServices/get_storage.dart';
import 'package:virtual_exchange/Widgets/show_progress.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class AuthProvider extends ChangeNotifier {
  AppKeys appKeys = AppKeys();
  TextEditingController emailCtrl = TextEditingController(text: "khuramsalfi5@gmail.com");
  TextEditingController passwordCtrl = TextEditingController(text: "12345678");
  TextEditingController repeatPasswordCtrl = TextEditingController(text: "12345678");
  TextEditingController pinCtrl = TextEditingController();
  String authType = "email";
  String reason = "";

  void changeAuthType(String authType) {
    this.authType = authType;
  }

  void setReasonType(String reason) {
    this.reason = reason;
  }

  Future<bool> sendEMailOTPForRegistration() async {
    Future.delayed(Duration.zero, () {
      showProgress();
    });
    try {
      Map<String, String> bodyFields = {'api_key': appKeys.apiKey, 'email': emailCtrl.text};

      final response = await ApiService.getMethod(
        url: ApiUrls.SEND_MAIL_PIN,
        bodyFields: bodyFields,
      );
      stopProgress();

      showMessage(response);

      logger.i(response);
      if (response.contains("success")) {
        return true;
      }
    } on Exception catch (e) {
      stopProgress();

      logger.i(e);

      return false;
    }
    return false;
  }

  Future<bool> sendMailForReason() async {
    showProgress();
    try {
      final response = await ApiService.getMethod(
        url: ApiUrls.SEND_MAIL,
        bodyFields: {
          'api_key': appKeys.apiKey,
          'email': emailCtrl.text,
          'user_id': AppKeys().userID ?? "",
          'reason': reason,
        },
      );
      logger.i(response);
      // showMessage(response);
      stopProgress();
      if (response.isEmpty) return false;

      final jd = json.decode(response);
      if (jd["status"] != "success") return false;
      return true;
    } on Exception catch (e) {
      stopProgress();
      logger.e(e);
    }
    return false;
  }

  Future<bool> registerUser() async {
    showProgress();
    try {
      Map<String, String> bodyFields = {
        'api_key': appKeys.apiKey,
        'email': emailCtrl.text,
        'password': passwordCtrl.text,
        'pin': pinCtrl.text,
        'registerType': authType
      };
      final response =
          await ApiService.getMethod(url: ApiUrls.REGISTER_USER, bodyFields: bodyFields);
      logger.i(response);
      stopProgress();
      showMessage(response);
      final jd = json.decode(response);
      if (jd["status"] != "success") return false;
      await AppStorage.box.write(AppStorage.USER_ID, response);
      clearControllers();
      return true;
    } on Exception catch (e) {
      logger.e(e);
      stopProgress();
      return false;
    }
  }

  Future<bool> loginUser() async {
    showProgress();
    final response = await ApiService.getMethod(
      url: ApiUrls.LOGIN_USER,
      bodyFields: {
        'api_key': appKeys.apiKey,
        'email': emailCtrl.text,
        'password': passwordCtrl.text,
        'searchType': authType,
        'pin': pinCtrl.text,
      },
    );

    if (response.isEmpty) return false;
    return false;
  }

  void forgetPassword() async {
    showProgress();
    final response = await ApiService.getMethod(url: ApiUrls.FORGET_PASSWORD, bodyFields: {
      'api_key': appKeys.apiKey,
      'email': emailCtrl.text,
    });
    stopProgress();

    logger.i(response);
    if (response.isEmpty) return;
  }

  void getUserId() async {
    showProgress();
    final response = await ApiService.getMethod(
        url: ApiUrls.GET_USER_ID, bodyFields: {'api_key': appKeys.apiKey, 'email': emailCtrl.text});

    logger.i(response);
    if (response.isEmpty) return;
  }

  Future<bool> getUserInfoByID() async {
    if (appKeys.userID == null) {
      logger.i(appKeys.userID);

      return false;
    }

    final response = await ApiService.getMethod(
      url: ApiUrls.GET_USER_INFO,
      bodyFields: {'api_key': appKeys.apiKey, "user_id": appKeys.userID!},
    );
    logger.i(response);
    final jd = json.decode(response);

    if (jd["status"] != "success") return false;
    AppStorage.box.write(AppStorage.USER_DATA, response);
    return true;
  }

  /// Clear Controllers
  void clearControllers() {
    pinCtrl.clear();
    // emailCtrl.clear();
    // passwordCtrl.clear();
    // repeatPasswordCtrl.clear();
  }
}
