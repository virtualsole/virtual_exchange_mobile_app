// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class ApiUrls {

  ApiUrls._();

  static final ApiUrls instance = ApiUrls._();

  factory ApiUrls() {
    return instance;
  }
  static const String BASE_URL = "https://server.vzsolution.com/";

  /// Auth
  final String SEND_MAIL_PIN = "${BASE_URL}sendMailPin";
  final String SEND_MAIL = "${BASE_URL}sendMail";
  final String REGISTER_USER = "${BASE_URL}register";
  final String LOGIN_USER = "${BASE_URL}login";
  final String FORGET_PASSWORD = "${BASE_URL}forgetPassword";
  final String GET_USER_ID = "${BASE_URL}getUserId";
  final String GET_USER_INFO = "${BASE_URL}getUserInfo";
  final String UPDATE_2_FA = "${BASE_URL}update2fa";
}
