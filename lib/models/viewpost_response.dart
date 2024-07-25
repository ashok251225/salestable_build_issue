// To parse this JSON data, do
//
//     final viewPostResponse = viewPostResponseFromJson(jsonString);

import 'dart:convert';

ViewPostResponse viewPostResponseFromJson(String str) =>
    ViewPostResponse.fromJson(json.decode(str));

String viewPostResponseToJson(ViewPostResponse data) =>
    json.encode(data.toJson());

class ViewPostResponse {
  final List<CommentData> data;
  final int statusCode;
  final String message;

  ViewPostResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory ViewPostResponse.fromJson(Map<String, dynamic> json) =>
      ViewPostResponse(
        data: List<CommentData>.from(
            json["data"].map((x) => CommentData.fromJson(x))),
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "statusCode": statusCode,
        "message": message,
      };
}

class CommentData {
  final int id;
  final String comment;
  final User user;
  final String activeReacition;
  final int totalReactions;
  final int cheerCount;
  final int likeCount;
  final int loveCount;
  final List<dynamic> reactions;
  final DateTime createdAt;
  final DateTime updatedAt;

  CommentData({
    required this.id,
    required this.comment,
    required this.user,
    required this.activeReacition,
    required this.totalReactions,
    required this.cheerCount,
    required this.likeCount,
    required this.loveCount,
    required this.reactions,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CommentData.fromJson(Map<String, dynamic> json) => CommentData(
        id: json["id"],
        comment: json["comment"],
        user: User.fromJson(json["user"]),
        activeReacition: json["active_reacition"],
        totalReactions: json["total_reactions"],
        cheerCount: json["cheer_count"],
        likeCount: json["like_count"],
        loveCount: json["love_count"],
        reactions: List<dynamic>.from(json["reactions"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "user": user.toJson(),
        "active_reacition": activeReacition,
        "total_reactions": totalReactions,
        "cheer_count": cheerCount,
        "like_count": likeCount,
        "love_count": loveCount,
        "reactions": List<dynamic>.from(reactions.map((x) => x)),
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
        id: json["id"],
        uuid: json["uuid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        profilePic: json["profile_pic"],
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
