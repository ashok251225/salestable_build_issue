// To parse this JSON data, do
//
//     final updateNotificationsResponse = updateNotificationsResponseFromJson(jsonString);

import 'dart:convert';

UpdateNotificationsResponse updateNotificationsResponseFromJson(String str) =>
    UpdateNotificationsResponse.fromJson(json.decode(str));

String updateNotificationsResponseToJson(UpdateNotificationsResponse data) =>
    json.encode(data.toJson());

class UpdateNotificationsResponse {
  final int data;
  final int statusCode;
  final String message;

  UpdateNotificationsResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory UpdateNotificationsResponse.fromJson(Map<String, dynamic> json) =>
      UpdateNotificationsResponse(
        data: json["data"] ?? 0,
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "statusCode": statusCode,
        "message": message,
      };
}
