// To parse this JSON data, do
//
//     final pluspostresponse = pluspostresponseFromJson(jsonString);

import 'dart:convert';

Pluspostresponse pluspostresponseFromJson(String str) =>
    Pluspostresponse.fromJson(json.decode(str));

String pluspostresponseToJson(Pluspostresponse data) =>
    json.encode(data.toJson());

class Pluspostresponse {
  final PulsePostData data;
  final num statusCode;
  final String message;

  Pluspostresponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory Pluspostresponse.fromJson(Map<String, dynamic> json) =>
      Pluspostresponse(
        data: PulsePostData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class PulsePostData {
  final List<ListElement> list;
  final Pagination pagination;

  PulsePostData({
    required this.list,
    required this.pagination,
  });

  factory PulsePostData.fromJson(Map<String, dynamic> json) => PulsePostData(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x)) ?? []),
        pagination: Pagination.fromJson(json["pagination"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class ListElement {
  final num id;
  final String post;
  final bool featured;
  final User user;
  final Category category;
  final AdditionalFile additionalFile;
  num totalComments;
  final List<Comment> comments;
  final String activeReacition;
  final num totalReactions;
  num cheerCount;
  num likeCount;
  num loveCount;
  final List<Reaction> reactions;
  final String createdAt;
  final String updatedAt;

  ListElement({
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

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"] ?? 0,
        post: json["post"] ?? "",
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
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
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
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  copyWith({required num cheerCount}) {}
}

class AdditionalFile {
  AdditionalFile();

  factory AdditionalFile.fromJson(Map<String, dynamic> json) =>
      AdditionalFile();

  Map<String, dynamic> toJson() => {};
}

class Category {
  final num id;
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
        uuid: json["uuid"] ?? "",
        name: json["name"] ?? "",
        pictureIcon: json["picture_icon"] ?? "",
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
  final num id;
  final String comment;
  final User user;
  final String activeReacition;
  final num totalReactions;
  final num cheerCount;
  final num likeCount;
  final num loveCount;
  final List<Reaction> reactions;
  final String createdAt;
  final String updatedAt;

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
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
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
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Reaction {
  final num id;
  final User user;
  final String reaction;
  final String createdAt;
  final String updatedAt;

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
        reaction: json["reaction"] ?? "",
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "reaction": reaction,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class User {
  final num id;
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

class Pagination {
  final num total;
  final num numberOfPages;
  final num currentPage;
  final num perPage;

  Pagination({
    required this.total,
    required this.numberOfPages,
    required this.currentPage,
    required this.perPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"] ?? 0,
        numberOfPages: json["number_of_pages"] ?? 0,
        currentPage: json["current_page"] ?? 0,
        perPage: json["per_page"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "number_of_pages": numberOfPages,
        "current_page": currentPage,
        "per_page": perPage,
      };
}
