// To parse this JSON data, do
//
//     final deletePostResponse = deletePostResponseFromJson(jsonString);

import 'dart:convert';

DeletePostResponse deletePostResponseFromJson(String str) =>
    DeletePostResponse.fromJson(json.decode(str));

String deletePostResponseToJson(DeletePostResponse data) =>
    json.encode(data.toJson());

class DeletePostResponse {
  final int statusCode;
  final String message;

  DeletePostResponse({
    required this.statusCode,
    required this.message,
  });

  factory DeletePostResponse.fromJson(Map<String, dynamic> json) =>
      DeletePostResponse(
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
      };
}
