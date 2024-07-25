// To parse this JSON data, do
//
//     final createCommentResponse = createCommentResponseFromJson(jsonString);

import 'dart:convert';

CreateCommentResponse createCommentResponseFromJson(String str) => CreateCommentResponse.fromJson(json.decode(str));

String createCommentResponseToJson(CreateCommentResponse data) => json.encode(data.toJson());

class CreateCommentResponse {
    final CommentData data;
    final int statusCode;
    final String message;

    CreateCommentResponse({
        required this.data,
        required this.statusCode,
        required this.message,
    });

    factory CreateCommentResponse.fromJson(Map<String, dynamic> json) => CreateCommentResponse(
        data: CommentData.fromJson(json["data"]),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
    };
}

class CommentData {
    final int id;
    final String comment;
    final User user;
    final int likes;
    final int dislikes;
    final DateTime createdAt;
    final DateTime updatedAt;

    CommentData({
        required this.id,
        required this.comment,
        required this.user,
        required this.likes,
        required this.dislikes,
        required this.createdAt,
        required this.updatedAt,
    });

    factory CommentData.fromJson(Map<String, dynamic> json) => CommentData(
        id: json["id"],
        comment: json["comment"],
        user: User.fromJson(json["user"]),
        likes: json["likes"],
        dislikes: json["dislikes"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "user": user.toJson(),
        "likes": likes,
        "dislikes": dislikes,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class User {
    final int id;
    final String uuid;
    final String firstName;
    final String lastName;
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
        id: json["id"],
        uuid: json["uuid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        profilePic: json["profile_pic"],
        emailVerified: json["email_verified"],
        timezone: json["timezone"],
        isSocialLogin: json["is_social_login"],
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
