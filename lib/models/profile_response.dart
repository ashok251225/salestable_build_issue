// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

class ProfileResponse {
  final ProfileData data;
  final int statusCode;
  final String message;

  ProfileResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        data: ProfileData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class ProfileData {
  final List<ListElement> list;
  final Pagination pagination;

  ProfileData({
    required this.list,
    required this.pagination,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
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
  final int id;
  final User user;
  final DateTime joinedAt;
  final String status;
  final int userRole;
  final String role;
  final String? designation;
  final dynamic lastCheckin;
  final bool silentMode;
  final bool isOnboardingEnabled;
  final bool isTrainingEnabled;

  ListElement({
    required this.id,
    required this.user,
    required this.joinedAt,
    required this.status,
    required this.userRole,
    required this.role,
    required this.designation,
    required this.lastCheckin,
    required this.silentMode,
    required this.isOnboardingEnabled,
    required this.isTrainingEnabled,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"] ?? 0,
        user: User.fromJson(json["user"] ?? {}),
        joinedAt: DateTime.parse(json["joined_at"] ?? {}),
        status: json["status"] ?? '',
        userRole: json["user_role"] ?? 0,
        role: json["role"] ?? '',
        designation: json["designation"] ?? '',
        lastCheckin: json["last_checkin"],
        silentMode: json["silent_mode"] ?? false,
        isOnboardingEnabled: json["is_onboarding_enabled"] ?? false,
        isTrainingEnabled: json["is_training_enabled"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "joined_at": joinedAt.toIso8601String(),
        "status": status,
        "user_role": userRole,
        "role": role,
        "designation": designation,
        "last_checkin": lastCheckin,
        "silent_mode": silentMode,
        "is_onboarding_enabled": isOnboardingEnabled,
        "is_training_enabled": isTrainingEnabled,
      };
}

class User {
  final int id;
  final String uuid;
  final String? firstName;
  final String? lastName;
  final String email;
  final String profilePic;
  final bool emailVerified;
  final String timezone;
  final bool isSocialLogin;
  final dynamic designation;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        uuid: json["uuid"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        email: json["email"] ?? '',
        profilePic: json["profile_pic"] ?? '',
        emailVerified: json["email_verified"] ?? false,
        timezone: json["timezone"] ?? '',
        isSocialLogin: json["is_social_login"] ?? false,
        designation: json["designation"],
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

class Pagination {
  final int total;
  final int numberOfPages;
  final int currentPage;
  final int perPage;

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
