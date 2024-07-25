// To parse this JSON data, do
//
//     final uploadFileResponse = uploadFileResponseFromJson(jsonString);

import 'dart:convert';

UploadFileResponse uploadFileResponseFromJson(String str) =>
    UploadFileResponse.fromJson(json.decode(str));

String uploadFileResponseToJson(UploadFileResponse data) =>
    json.encode(data.toJson());

class UploadFileResponse {
  final UploadedData data;
  final int statusCode;
  final String message;

  UploadFileResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) =>
      UploadFileResponse(
        data: UploadedData.fromJson(json["data"]),
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class UploadedData {
  final String path;
  final String url;

  UploadedData({
    required this.path,
    required this.url,
  });

  factory UploadedData.fromJson(Map<String, dynamic> json) => UploadedData(
        path: json["path"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "url": url,
      };
}
