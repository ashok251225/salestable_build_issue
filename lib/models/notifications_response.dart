// To parse this JSON data, do
//
//     final notificationsResponse = notificationsResponseFromJson(jsonString);

import 'dart:convert';

NotificationsResponse notificationsResponseFromJson(String str) =>
    NotificationsResponse.fromJson(json.decode(str));

String notificationsResponseToJson(NotificationsResponse data) =>
    json.encode(data.toJson());

class NotificationsResponse {
  final NotificationData data;
  final int statusCode;
  final String message;

  NotificationsResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      NotificationsResponse(
        data: NotificationData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class NotificationData {
  final List<ListElement> list;
  final Pagination pagination;

  NotificationData({
    required this.list,
    required this.pagination,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
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
  final String message;
  final int status;
  final DateTime createdAt;
  final FromUser fromUser;
  final int objectId;
  final String type;
  final String redirect;
  final dynamic redirectId;

  ListElement({
    required this.id,
    required this.message,
    required this.status,
    required this.createdAt,
    required this.fromUser,
    required this.objectId,
    required this.type,
    required this.redirect,
    required this.redirectId,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"] ?? 0,
        message: json["message"] ?? '',
        status: json["status"] ?? 0,
        createdAt: DateTime.parse(json["created_at"] ?? {}),
        fromUser: FromUser.fromJson(json["from_user"] ?? {}),
        objectId: json["object_id"] ?? 0,
        type: json["type"] ?? '', // Use helper method to parse "type"
        redirect: json["redirect"] ?? '',
        redirectId: json["redirect_id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "from_user": fromUser.toJson(),
        "object_id": objectId,
        "type": type,
        "redirect": redirect,
        "redirect_id": redirectId,
      };

  // Helper method to parse "type"
}

class FromUser {
  final String uuid;
  final String firstName;
  final String lastName;
  final String firstLetter;
  final String email;
  final String profilePic;

  FromUser({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.firstLetter,
    required this.email,
    required this.profilePic,
  });

  factory FromUser.fromJson(Map<String, dynamic> json) => FromUser(
        uuid: json["uuid"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        firstLetter: json["first_letter"] ?? '',
        email: json["email"] ?? '',
        profilePic: json["profile_pic"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "first_name": firstName,
        "last_name": lastName,
        "first_letter": firstLetter,
        "email": email,
        "profile_pic": profilePic,
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
