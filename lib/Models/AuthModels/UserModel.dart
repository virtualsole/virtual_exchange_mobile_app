class User {
  String? avatar;
  String? nickname;
  String? name;
  String? surname;
  String? email;
  String? countryCode;
  String? phoneNumber;
  String? city;
  String? country;
  String? address;
  String? twofa;
  String? verificationStatus;

  User({
    this.avatar,
    this.nickname,
    this.name,
    this.surname,
    this.email,
    this.countryCode,
    this.phoneNumber,
    this.city,
    this.country,
    this.address,
    this.twofa,
    this.verificationStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        avatar: json["avatar"],
        nickname: json["nickname"],
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        countryCode: json["country_code"],
        phoneNumber: json["phone_number"],
        city: json["city"],
        country: json["country"],
        address: json["address"],
        twofa: json["twofa"],
        verificationStatus: json["verificationStatus"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "nickname": nickname,
        "name": name,
        "surname": surname,
        "email": email,
        "country_code": countryCode,
        "phone_number": phoneNumber,
        "city": city,
        "country": country,
        "address": address,
        "twofa": twofa,
        "verificationStatus": verificationStatus,
      };
}
