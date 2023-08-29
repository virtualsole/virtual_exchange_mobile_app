import 'dart:convert';

GetUserIdResponse getUserIdResponseFromJson(String str) =>
    GetUserIdResponse.fromJson(json.decode(str));

class GetUserIdResponse {
  String status;
  String showableMessage;
  List<UserID>? data;

  GetUserIdResponse({
    this.status = "",
    this.showableMessage = '',
    this.data,
  });

  factory GetUserIdResponse.fromJson(Map<String, dynamic> json) => GetUserIdResponse(
        status: json["status"],
        showableMessage: json["showableMessage"],
        data: json["data"] != null
            ? List<UserID>.from(json["data"].map((x) => UserID.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "showableMessage": showableMessage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class UserID {
  String? response;
  String? userId;
  String? email;
  String? phone;

  UserID({
    this.response,
    this.userId,
    this.email,
    this.phone,
  });

  factory UserID.fromJson(Map<String, dynamic> json) => UserID(
        response: json["response"],
        userId: json["user_id"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "user_id": userId,
        "email": email,
        "phone": phone,
      };
}
