// To parse this JSON data, do
//
//     final userLimitResponse = userLimitResponseFromJson(jsonString);

import 'dart:convert';

UserLimitResponse userLimitResponseFromJson(String str) =>
    UserLimitResponse.fromJson(json.decode(str));

String userLimitResponseToJson(UserLimitResponse data) =>
    json.encode(data.toJson());

class UserLimitResponse {
  final UserLimitsData data;
  final num statusCode;
  final String message;

  UserLimitResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory UserLimitResponse.fromJson(Map<String, dynamic> json) =>
      UserLimitResponse(
        data: UserLimitsData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class UserLimitsData {
  final Ing onboarding;
  final Ing training;
  final Tracking tracking;

  UserLimitsData({
    required this.onboarding,
    required this.training,
    required this.tracking,
  });

  factory UserLimitsData.fromJson(Map<String, dynamic> json) => UserLimitsData(
        onboarding: Ing.fromJson(json["onboarding"] ?? {}),
        training: Ing.fromJson(json["training"] ?? {}),
        tracking: Tracking.fromJson(json["tracking"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "onboarding": onboarding.toJson(),
        "training": training.toJson(),
        "tracking": tracking.toJson(),
      };
}

class Ing {
  final bool required;
  final bool completed;

  Ing({
    required this.required,
    required this.completed,
  });

  factory Ing.fromJson(Map<String, dynamic> json) => Ing(
        required: json["required"] ?? false,
        completed: json["completed"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "required": required,
        "completed": completed,
      };
}

class Tracking {
  final bool isPublished;
  final bool required;

  Tracking({
    required this.isPublished,
    required this.required,
  });

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
        isPublished: json["is_published"] ?? false,
        required: json["required"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "is_published": isPublished,
        "required": required,
      };
}
