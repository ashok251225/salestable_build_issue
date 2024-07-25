import 'dart:convert';

DeleteNotificationResponse deleteNotificationResponseFromJson(String str) =>
    DeleteNotificationResponse.fromJson(json.decode(str));

String deleteNotificationResponseToJson(DeleteNotificationResponse data) =>
    json.encode(data.toJson());

class DeleteNotificationResponse {
  final int statusCode;
  final String message;

  DeleteNotificationResponse({
    required this.statusCode,
    required this.message,
  });

  factory DeleteNotificationResponse.fromJson(Map<String, dynamic> json) =>
      DeleteNotificationResponse(
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
      };
}
