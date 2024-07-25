// To parse this JSON data, do
//
//     final addCommentResponse = addCommentResponseFromJson(jsonString);

import 'dart:convert';

AddCommentResponse addCommentResponseFromJson(String str) {
  // Check if the decoded JSON is not null
  final dynamic decodedJson = json.decode(str);
  if (decodedJson == null) {
    throw FormatException("Invalid JSON format");
  }

  return AddCommentResponse.fromJson(decodedJson);
}

class AddCommentResponse {
  final AddCommentData data;
  final int statusCode;
  final String message;

  AddCommentResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory AddCommentResponse.fromJson(Map<String, dynamic> json) =>
      AddCommentResponse(
        data: AddCommentData.fromJson(json["data"]),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class AddCommentData {
  final int id;
  final String comment;
  final User user;
  final DateTime createdAt;
  final DateTime updatedAt;

  AddCommentData({
    required this.id,
    required this.comment,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });
  factory AddCommentData.fromJson(Map<String, dynamic> json) {
    return AddCommentData(
      id: json["id"] != null ? json["id"] as int : 0,
      comment: json["comment"] != null ? json["comment"] as String : '',
      user: json["user"] != null
          ? User.fromJson(json["user"] as Map<String, dynamic>)
          : User(
              id: 0,
              uuid: '',
              firstName: '',
              lastName: '',
              email: '',
              profilePic: '',
            ),
      createdAt: json["created_at"] != null
          ? DateTime.tryParse(json["created_at"] as String? ?? '') ??
              DateTime.now()
          : DateTime.now(),
      updatedAt: json["updated_at"] != null
          ? DateTime.tryParse(json["updated_at"] as String? ?? '') ??
              DateTime.now()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "user": user.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class User {
  final int id;
  final String uuid;
  final String firstName;
  final String lastName;
  final String email;
  final String profilePic;

  User({
    required this.id,
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profilePic,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        uuid: json["uuid"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        email: json["email"] ?? '',
        profilePic: json["profile_pic"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "profile_pic": profilePic,
      };
}
