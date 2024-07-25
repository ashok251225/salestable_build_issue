// To parse this JSON data, do
//
//     final reactionResponse = reactionResponseFromJson(jsonString);

import 'dart:convert';

ReactionResponse reactionResponseFromJson(String str) =>
    ReactionResponse.fromJson(json.decode(str));

String reactionResponseToJson(ReactionResponse data) =>
    json.encode(data.toJson());

class ReactionResponse {
  final ReactionData data;
  final int statusCode;
  final String message;

  ReactionResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory ReactionResponse.fromJson(Map<String, dynamic> json) =>
      ReactionResponse(
        data: ReactionData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class ReactionData {
  final UpdatedPost updatedPost;
  final String myReaction;

  ReactionData({
    required this.updatedPost,
    required this.myReaction,
  });

  factory ReactionData.fromJson(Map<String, dynamic> json) => ReactionData(
        updatedPost: UpdatedPost.fromJson(json["updated_post"] ?? {}),
        myReaction: json["my_reaction"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "updated_post": updatedPost.toJson(),
        "my_reaction": myReaction,
      };
}

class UpdatedPost {
  final int id;
  final String post;
  final bool featured;
  final User user;
  final Category category;
  final AdditionalFile additionalFile;
  final int totalComments;
  final List<Comment> comments;
  final String activeReacition;
  final int totalReactions;
  final int cheerCount;
  final int likeCount;
  final int loveCount;
  final List<Reaction> reactions;
  final DateTime createdAt;
  final DateTime updatedAt;

  UpdatedPost({
    required this.id,
    required this.post,
    required this.featured,
    required this.user,
    required this.category,
    required this.additionalFile,
    required this.totalComments,
    required this.comments,
    required this.activeReacition,
    required this.totalReactions,
    required this.cheerCount,
    required this.likeCount,
    required this.loveCount,
    required this.reactions,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UpdatedPost.fromJson(Map<String, dynamic> json) => UpdatedPost(
        id: json["id"] ?? 0,
        post: json["post"] ?? '',
        featured: json["featured"] ?? false,
        user: User.fromJson(json["user"] ?? {}),
        category: Category.fromJson(json["category"] ?? {}),
        additionalFile: AdditionalFile.fromJson(json["additional_file"] ?? {}),
        totalComments: json["total_comments"] ?? 0,
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x)) ?? []),
        activeReacition: json["active_reacition"] ?? '',
        totalReactions: json["total_reactions"] ?? 0,
        cheerCount: json["cheer_count"] ?? 0,
        likeCount: json["like_count"] ?? 0,
        loveCount: json["love_count"] ?? 0,
        reactions: List<Reaction>.from(
            json["reactions"].map((x) => Reaction.fromJson(x)) ?? []),
        createdAt: DateTime.parse(json["created_at"] ?? {}),
        updatedAt: DateTime.parse(json["updated_at"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "post": post,
        "featured": featured,
        "user": user.toJson(),
        "category": category.toJson(),
        "additional_file": additionalFile.toJson(),
        "total_comments": totalComments,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "active_reacition": activeReacition,
        "total_reactions": totalReactions,
        "cheer_count": cheerCount,
        "like_count": likeCount,
        "love_count": loveCount,
        "reactions": List<dynamic>.from(reactions.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class AdditionalFile {
  AdditionalFile();

  factory AdditionalFile.fromJson(Map<String, dynamic> json) =>
      AdditionalFile();

  Map<String, dynamic> toJson() => {};
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

class Comment {
  final int id;
  final String comment;
  final User user;
  final String activeReacition;
  final int totalReactions;
  final int cheerCount;
  final int likeCount;
  final int loveCount;
  final List<Reaction> reactions;
  final DateTime createdAt;
  final DateTime updatedAt;

  Comment({
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

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"] ?? 0,
        comment: json["comment"] ?? '',
        user: User.fromJson(json["user"] ?? {}),
        activeReacition: json["active_reacition"] ?? '',
        totalReactions: json["total_reactions"] ?? 0,
        cheerCount: json["cheer_count"] ?? 0,
        likeCount: json["like_count"] ?? 0,
        loveCount: json["love_count"] ?? 0,
        reactions: List<Reaction>.from(
            json["reactions"].map((x) => Reaction.fromJson(x)) ?? []),
        createdAt: DateTime.parse(json["created_at"] ?? {}),
        updatedAt: DateTime.parse(json["updated_at"] ?? {}),
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
        "reactions": List<dynamic>.from(reactions.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Reaction {
  final int id;
  final User user;
  final String reaction;
  final DateTime createdAt;
  final DateTime updatedAt;

  Reaction({
    required this.id,
    required this.user,
    required this.reaction,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) => Reaction(
        id: json["id"] ?? 0,
        user: User.fromJson(json["user"] ?? {}),
        reaction: json["reaction"] ?? '',
        createdAt: DateTime.parse(json["created_at"] ?? {}),
        updatedAt: DateTime.parse(json["updated_at"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "reaction": reaction,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class User {
  final int id;
  final String uuid;
  final String? firstName;
  final String? lastName;
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
