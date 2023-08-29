import 'dart:convert';

UserIdResponse userIdModelFromJson(String str) => UserIdResponse.fromJson(json.decode(str));

class UserIdResponse {
  String status;
  String showAbleMessage;
  UserID? data;

  UserIdResponse({
    this.status = '',
    this.showAbleMessage = '',
    this.data,
  });

  factory UserIdResponse.fromJson(Map<String, dynamic> json) => UserIdResponse(
        status: json["status"],
        showAbleMessage: json["showableMessage"],
        data: json["data"] != null ? UserID.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "showableMessage": showAbleMessage,
        "data": data?.toJson(),
      };
}

class UserID {
  String? userId;
  String? refCode;
  String? id;
  DateTime? createdAt;
  int? v;

  UserID({
    this.userId,
    this.refCode,
    this.id,
    this.createdAt,
    this.v,
  });

  factory UserID.fromJson(Map<String, dynamic> json) => UserID(
        userId: json["user_id"],
        refCode: json["refCode"],
        id: json["_id"],
        createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "refCode": refCode,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "__v": v,
      };
}
