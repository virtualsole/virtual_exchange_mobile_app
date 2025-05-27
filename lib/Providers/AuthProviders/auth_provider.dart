import 'dart:convert';

import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:virtual_exchange/Services/HttpServices/api_key.dart';
import 'package:virtual_exchange/Services/HttpServices/api_services.dart';
import 'package:virtual_exchange/Services/HttpServices/api_urls.dart';
import 'package:virtual_exchange/Services/StorageServices/storage_services.dart';
import 'package:virtual_exchange/Widgets/show_progress.dart';
import 'package:virtual_exchange/Models/AuthModels/get_user_id_response.dart';

import '../../utils.dart';

class AuthProvider extends ChangeNotifier {
  AppKeys appKeys = AppKeys();
  TextEditingController authIdCtrl =
      TextEditingController(text: "khuramsalfi5@gmail.com");

  // TextEditingController phoneNumber = TextEditingController(text: "khuramsalfi5@gmail.com");
  TextEditingController passwordCtrl = TextEditingController(text: "12345678");
  TextEditingController repeatPasswordCtrl =
      TextEditingController(text: "12345678");
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
      Map<String, String> bodyFields = {
        'api_key': appKeys.apiKey,
        'email': authIdCtrl.text
      };

      final response = await ApiService.getMethod(
        url: ApiUrls.instance.SEND_MAIL_PIN,
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
    String? res = await getUserId();
    if (res == null) {
      stopProgress();
      return false;
    }

    try {
      final response = await ApiService.getMethod(
        url: ApiUrls.instance.SEND_MAIL,
        bodyFields: {
          'api_key': appKeys.apiKey,
          'email': authIdCtrl.text,
          'user_id': res,
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
        'email': authIdCtrl.text,
        'password': passwordCtrl.text,
        'pin': pinCtrl.text,
        'registerType': authType
      };
      final response = await ApiService.getMethod(
          url: ApiUrls.instance.REGISTER_USER, bodyFields: bodyFields);
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
      url: ApiUrls.instance.LOGIN_USER,
      bodyFields: {
        'api_key': appKeys.apiKey,
        'email': authIdCtrl.text,
        'password': passwordCtrl.text,
        'searchType': authType,
        'pin': pinCtrl.text,
      },
    );
    stopProgress();
    if (response.isEmpty) return false;
    showMessage(response);
    return false;
  }

  Future<bool> forgetPassword() async {
    showProgress();
    final response = await ApiService.postMethod(
        url: ApiUrls.instance.FORGET_PASSWORD,
        bodyFields: {
          'api_key': appKeys.apiKey,
          'user_id': getUserIdResponse?.data?.first.userId ?? "",
          'password': passwordCtrl.text,
        });
    logger.i(response);

    stopProgress();
    final jd = json.decode(response);
    if (jd['status'] != 'success') return false;

    logger.i(response);
    showMessage(response);
    if (response.isEmpty) return false;
    return false;
  }

  GetUserIdResponse? getUserIdResponse;

  Future<String?> getUserId() async {
    final response = await ApiService.getMethod(
        url: ApiUrls.instance.GET_USER_ID,
        bodyFields: {'api_key': appKeys.apiKey, 'email': authIdCtrl.text});
    if (response.isEmpty) return null;
    getUserIdResponse = getUserIdResponseFromJson(response);

    if (getUserIdResponse?.status == "fail") {
      showMessage(response);
      return null;
    }

    return getUserIdResponse?.data?.first.userId;
  }

  Future<bool> getUserInfoByID() async {
    if (appKeys.userID == null) {
      logger.i(appKeys.userID);

      return false;
    }

    final response = await ApiService.getMethod(
      url: ApiUrls.instance.GET_USER_INFO,
      bodyFields: {'api_key': appKeys.apiKey, "user_id": appKeys.userID!},
    );
    logger.i(response);
    final jd = json.decode(response);

    if (jd["status"] != "success") return false;
    AppStorage.box.write(AppStorage.USER_DATA, response);
    return true;
  }

  Future<bool> update2fa() async {
    final response =
        await ApiService.getMethod(url: ApiUrls.instance.UPDATE_2_FA);
    if (response.isEmpty) return false;

    final jd = json.decode(response);
    if (jd["status"] != "success") return false;

    return true;
  }

  /// Clear Controllers
  void clearControllers() {
    pinCtrl.clear();
    // emailCtrl.clear();
    // passwordCtrl.clear();
    // repeatPasswordCtrl.clear();
  }
  // UserCredential? userCredential;
  Future<void> signInWithGoogle() async {
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
    // userCredential= await FirebaseAuth.instance.signInWithCredential(credential);
    // logger.i(userCredential);
  }
}
