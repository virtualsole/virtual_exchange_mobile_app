// ignore_for_file: constant_identifier_names

class ApiUrls {
  static const String BASE_URL = "https://server.vzsolution.com/";

  // static const String BASE_URL = "https://64a0-182-185-202-134.ngrok-free.app/";

  /// Auth
  static const String SEND_MAIL_PIN = "${BASE_URL}sendMailPin";
  static const String SEND_MAIL = "${BASE_URL}sendMail";
  static const String REGISTER_USER = "${BASE_URL}register";
  static const String LOGIN_USER = "${BASE_URL}login";
  static const String FORGET_PASSWORD = "${BASE_URL}forgetPassword";
  static const String GET_USER_ID = "${BASE_URL}getUserId";
  static const String GET_USER_INFO = "${BASE_URL}getUserInfo";
  static const String UPDATE_2_FA = "${BASE_URL}update2fa";
}
