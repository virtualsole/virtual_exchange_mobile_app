import 'package:flutter/cupertino.dart';
import 'package:virtual_exchange/Services/HttpServices/api_key.dart';
import 'package:virtual_exchange/Services/HttpServices/api_services.dart';
import 'package:virtual_exchange/Services/HttpServices/api_urls.dart';
import 'package:virtual_exchange/Widgets/show_progress.dart';
import 'package:virtual_exchange/string_and_consts.dart';

/// 1... Send Otp to corresponding email;
/// 2... Register User With OTP;
/// 3... For Login should send Otp
/// 4... ask to user for enter email
/// 5... send Otp to server to Login..

class AuthProvider extends ChangeNotifier {
  AppKeys appKeys = AppKeys();
  TextEditingController emailCtrl = TextEditingController(text: "khruam@gmail.com");
  TextEditingController passwordCtrl = TextEditingController(text: "12345678");
  TextEditingController repeatPasswordCtrl = TextEditingController(text: "12345678");
  TextEditingController pinCtrl = TextEditingController();
  String authType = "email";
  String userID = '';

  void changeAuthType(String authType) {
    this.authType = authType;
  }

  void setUserId(String userID) {
    this.userID = userID;
  }

  Future<bool> sendEMailOTP() async {
    notifyListeners();
    Future.delayed(Duration.zero, () {
      showProgress();
    });
    try {
      final response = await ApiService.getMethod(
          url: ApiUrls.SEND_MAIL_PIN,
          bodyFields: {'api_key': appKeys.apiKey, 'email': emailCtrl.text});
      stopProgress();

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

  Future<void> registerUser() async {
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
    } on Exception catch (e) {
      stopProgress();
    }
  }

  void loginUser() async {
    showProgress();
    final response = await ApiService.getMethod(
      url: ApiUrls.LOGIN_USER,
      bodyFields: {
        'api_key': appKeys.apiKey,
        'email': emailCtrl.text,
        'password': passwordCtrl.text,
        'pin': pinCtrl.text,
        'searchType': authType,
      },
    );

    logger.i(response);

    if (response.isEmpty) return;
  }

  void forgetPassword() async {
    showProgress();
    final response = await ApiService.getMethod(url: ApiUrls.FORGET_PASSWORD, bodyFields: {
      'api_key': appKeys.apiKey,
      'user_id': '645b4586aca1c61f69f93c50',
      'password': passwordCtrl.text
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

  void getUserInfo() async {
    final response = await ApiService.getMethod(
        url: ApiUrls.GET_USER_INFO, bodyFields: {'api_key': appKeys.apiKey, "user_id": userID});
  }
}
