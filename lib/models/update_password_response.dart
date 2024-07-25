// To parse this JSON data, do
//
//     final resetPasswordResponse = resetPasswordResponseFromJson(jsonString);

import 'dart:convert';

ResetPasswordResponse resetPasswordResponseFromJson(String str) => ResetPasswordResponse.fromJson(json.decode(str));

String resetPasswordResponseToJson(ResetPasswordResponse data) => json.encode(data.toJson());

class ResetPasswordResponse {
    final int statusCode;
    final String message;

    ResetPasswordResponse({
        required this.statusCode,
        required this.message,
    });

    factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) => ResetPasswordResponse(
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
    };
}
