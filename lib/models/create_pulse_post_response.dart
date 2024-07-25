// To parse this JSON data, do
//
//     final createPulsePostResponse = createPulsePostResponseFromJson(jsonString);

import 'dart:convert';

CreatePulsePostResponse createPulsePostResponseFromJson(String str) =>
    CreatePulsePostResponse.fromJson(json.decode(str));

String createPulsePostResponseToJson(CreatePulsePostResponse data) =>
    json.encode(data.toJson());

class CreatePulsePostResponse {
  final CreatedData data;
  final int statusCode;
  final String message;

  CreatePulsePostResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory CreatePulsePostResponse.fromJson(Map<String, dynamic> json) =>
      CreatePulsePostResponse(
        data: CreatedData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  get errors => null;

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class CreatedData {
  final int id;
  final String post;
  final User user;
  final Category category;

  final List<dynamic> reactions;
  final DateTime createdAt;
  final DateTime updatedAt;

  CreatedData({
    required this.id,
    required this.post,
    required this.user,
    required this.category,
    required this.reactions,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CreatedData.fromJson(Map<String, dynamic> json) => CreatedData(
        id: json["id"] ?? 0,
        post: json["post"] ?? '',
        user: User.fromJson(json["user"] ?? {}),
        category: Category.fromJson(json["category"] ?? {}),
        reactions: List<dynamic>.from(json["reactions"].map((x) => x) ?? []),
        createdAt: DateTime.parse(json["created_at"] ?? DateTime.now()),
        updatedAt: DateTime.parse(json["updated_at"] ?? DateTime.now()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "post": post,
        "user": user.toJson(),
        "category": category.toJson(),
        "reactions": List<dynamic>.from(reactions.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Category {
  final int id;
  final String uuid;
  final String name;
  final String pictureIcon;
  final String colorCode;

  Category({
    required this.id,
    required this.uuid,
    required this.name,
    required this.pictureIcon,
    required this.colorCode,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? 0,
        uuid: json["uuid"] ?? '',
        name: json["name"] ?? '',
        pictureIcon: json["picture_icon"] ?? '',
        colorCode: json["color_code"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "picture_icon": pictureIcon,
        "color_code": colorCode,
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
