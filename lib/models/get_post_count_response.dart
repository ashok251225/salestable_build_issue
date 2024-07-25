// To parse this JSON data, do
//
//     final pulsePostCountResponse = pulsePostCountResponseFromJson(jsonString);

import 'dart:convert';

PulsePostCountResponse pulsePostCountResponseFromJson(String str) =>
    PulsePostCountResponse.fromJson(json.decode(str));

String pulsePostCountResponseToJson(PulsePostCountResponse data) =>
    json.encode(data.toJson());

class PulsePostCountResponse {
  final CountData data;
  final int statusCode;
  final String message;

  PulsePostCountResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory PulsePostCountResponse.fromJson(Map<String, dynamic> json) =>
      PulsePostCountResponse(
        data: CountData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class CountData {
  final int totalPosts;
  final int totalUserPosts;
  final List<CategoryElement> categories;

  CountData({
    required this.totalPosts,
    required this.totalUserPosts,
    required this.categories,
  });

  factory CountData.fromJson(Map<String, dynamic> json) {
    return CountData(
      totalPosts: json["total_posts"] ?? 0,
      totalUserPosts: json["total_user_posts"] ?? 0,
      categories: (json["categories"] as List<dynamic>?)
              ?.map((x) => CategoryElement.fromJson(x))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        "total_posts": totalPosts,
        "total_user_posts": totalUserPosts,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class CategoryElement {
  final int postCount;
  final int userPostCount;
  final CategoryCategory category;

  CategoryElement({
    required this.postCount,
    required this.userPostCount,
    required this.category,
  });

  factory CategoryElement.fromJson(Map<String, dynamic> json) =>
      CategoryElement(
        postCount: json["post_count"] ?? 0,
        userPostCount: json["user_post_count"] ?? 0,
        category: CategoryCategory.fromJson(json["category"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "post_count": postCount,
        "user_post_count": userPostCount,
        "category": category.toJson(),
      };
}

class CategoryCategory {
  final String uuid;
  final String name;
  final String pictureIcon;
  final String colorCode;

  CategoryCategory({
    required this.uuid,
    required this.name,
    required this.pictureIcon,
    required this.colorCode,
  });

  factory CategoryCategory.fromJson(Map<String, dynamic> json) =>
      CategoryCategory(
        uuid: json["uuid"] ?? "",
        name: json["name"] ?? "",
        pictureIcon: json["picture_icon"] ?? "",
        colorCode: json["color_code"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "picture_icon": pictureIcon,
        "color_code": colorCode,
      };
}
