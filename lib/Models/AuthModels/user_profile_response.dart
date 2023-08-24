import 'dart:convert';

import 'package:virtual_exchange/Models/AuthModels/UserModel.dart';

UserProfileResponse userProfileResponseFromJson(String str) =>
    UserProfileResponse.fromJson(json.decode(str));

class UserProfileResponse {
  String status;
  User? userData;

  UserProfileResponse({
    this.status = '',
    this.userData,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) => UserProfileResponse(
        status: json["status"],
        userData: json["data"] != null ? User.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": userData?.toJson(),
      };
}
