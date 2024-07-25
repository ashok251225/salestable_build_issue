// To parse this JSON data, do
//
//     final editProfileResponse = editProfileResponseFromJson(jsonString);

import 'dart:convert';

EditProfileResponse editProfileResponseFromJson(String str) =>
    EditProfileResponse.fromJson(json.decode(str));

String editProfileResponseToJson(EditProfileResponse data) =>
    json.encode(data.toJson());

class EditProfileResponse {
  final UpdatedData data;
  final int statusCode;
  final String message;

  EditProfileResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      EditProfileResponse(
        data: UpdatedData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class UpdatedData {
  final int id;
  final String uuid;
  final String firstName;
  final String lastName;
  final String email;
  final String profilePic;
  final bool emailVerified;
  final String timezone;
  final bool isSocialLogin;
  final String designation;

  UpdatedData({
    required this.id,
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profilePic,
    required this.emailVerified,
    required this.timezone,
    required this.isSocialLogin,
    required this.designation,
  });

  factory UpdatedData.fromJson(Map<String, dynamic> json) => UpdatedData(
        id: json["id"] ?? 0,
        uuid: json["uuid"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        email: json["email"] ?? '',
        profilePic: json["profile_pic"] ?? '',
        emailVerified: json["email_verified"] ?? false,
        timezone: json["timezone"] ?? '',
        isSocialLogin: json["is_social_login"] ?? false,
        designation: json["designation"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "profile_pic": profilePic,
        "email_verified": emailVerified,
        "timezone": timezone,
        "is_social_login": isSocialLogin,
        "designation": designation,
      };
}
