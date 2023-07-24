import 'dart:convert';

class UserData {
  final String? id;
  final String? name;
  final String? email;
  final String? photourl;
  final String? location;
  final String? fcmtoken;
  final DateTime? addtime;

  UserData({
    this.id,
    this.name,
    this.email,
    this.photourl,
    this.location,
    this.fcmtoken,
    this.addtime,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      photourl: json["photourl"],
      location: json["location"],
      fcmtoken: json["fcmtoken"],
      addtime: json["addtime"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "photourl": photourl,
        "location": location,
        "fcmtoken": fcmtoken,
        "addtime": addtime,
      };
}

UserLoginResponseEntity userLoginResponseEntityFromJson(String str) => UserLoginResponseEntity.fromJson(jsonDecode(str));
String userLoginResponseEntityToJson(UserLoginResponseEntity data) => json.encode(data.toJson());

class UserLoginResponseEntity {
  String accessToken;
  String displayName;
  String email;
  String photoUrl;

  UserLoginResponseEntity({
    required this.accessToken,
    required this.displayName,
    required this.email,
    required this.photoUrl,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
    UserLoginResponseEntity(
      accessToken: json["access_token"],
      displayName: json["display_name"],
      email: json["email"],
      photoUrl: json["photoUrl"],
    );
  //}
  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "display_name": displayName,
        "email": email,
        "photoUrl": photoUrl,
      };
}