// To parse this JSON data, do
//
//     final notificationCountResponse = notificationCountResponseFromJson(jsonString);

import 'dart:convert';

NotificationCountResponse notificationCountResponseFromJson(String str) =>
    NotificationCountResponse.fromJson(json.decode(str));

String notificationCountResponseToJson(NotificationCountResponse data) =>
    json.encode(data.toJson());

class NotificationCountResponse {
  final int data;
  final int statusCode;
  final String message;

  NotificationCountResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory NotificationCountResponse.fromJson(Map<String, dynamic> json) =>
      NotificationCountResponse(
        data: json["data"],
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "statusCode": statusCode,
        "message": message,
      };
}
