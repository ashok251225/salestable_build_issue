// To parse this JSON data, do
//
//     final readContentResponse = readContentResponseFromJson(jsonString);

import 'dart:convert';

ReadContentResponse readContentResponseFromJson(String str) => ReadContentResponse.fromJson(json.decode(str));

String readContentResponseToJson(ReadContentResponse data) => json.encode(data.toJson());

class ReadContentResponse {
    final ContentData data;
    final int statusCode;
    final dynamic message;

    ReadContentResponse({
        required this.data,
        required this.statusCode,
        required this.message,
    });

    factory ReadContentResponse.fromJson(Map<String, dynamic> json) => ReadContentResponse(
        data: ContentData.fromJson(json["data"]),
        statusCode: json["statusCode"],
        message: json["message"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
    };
}

class ContentData {
    final dynamic uuid;
    final dynamic name;
    final dynamic description;
    final dynamic content;
    final int contentType;
    final int inputType;
    final int status;
    final int order;
    final List<dynamic> tags;
    final bool isRequired;
    final CreatedBy createdBy;
    final DateTime updatedAt;
    final int likes;
    final int dislikes;
    final List<CommentUser> comments;
    final int contentSize;
    final bool disableEdition;
    final bool isRetake;
    final int frequency;
    final int interval;
    final int numberOfRetakes;
    final dynamic startDate;
    final dynamic nextDate;
    final dynamic untilDate;
    final int suggestDuration;
    final int contentRead;
    final DateTime completedAt;
    final bool isNew;
    final dynamic startDateByUser;
    final dynamic nextDateByUser;
    final int numberOfRetakesByUser;
    final int timeDuration;
    final bool minDuration;
    final int likeStatus;

    ContentData({
        required this.uuid,
        required this.name,
        required this.description,
        required this.content,
        required this.contentType,
        required this.inputType,
        required this.status,
        required this.order,
        required this.tags,
        required this.isRequired,
        required this.createdBy,
        required this.updatedAt,
        required this.likes,
        required this.dislikes,
        required this.comments,
        required this.contentSize,
        required this.disableEdition,
        required this.isRetake,
        required this.frequency,
        required this.interval,
        required this.numberOfRetakes,
        required this.startDate,
        required this.nextDate,
        required this.untilDate,
        required this.suggestDuration,
        required this.contentRead,
        required this.completedAt,
        required this.isNew,
        required this.startDateByUser,
        required this.nextDateByUser,
        required this.numberOfRetakesByUser,
        required this.timeDuration,
        required this.minDuration,
        required this.likeStatus,
    });

    factory ContentData.fromJson(Map<String, dynamic> json) => ContentData(
  uuid: json["uuid"] ?? '',
  name: json["name"] ?? '',
  description: json["description"] ?? '',
  content: json["content"] ?? '',
  contentType: json["content_type"] ?? 0, // Assign a default value if it's null
  inputType: json["input_type"] ?? 0, // Assign a default value if it's null
  status: json["status"] ?? 0, // Assign a default value if it's null
  order: json["order"] ?? 0, // Assign a default value if it's null
  tags: List<dynamic>.from(json["tags"] ?? []), // Assign an empty list if it's null
  isRequired: json["is_required"] ?? false, // Assign false if it's null
  createdBy: CreatedBy.fromJson(json["created_by"] ?? {}), // Assign an empty map if it's null
  updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(), // Assign current time if it's null
  likes: json["likes"] ?? 0, // Assign a default value if it's null
  dislikes: json["dislikes"] ?? 0, // Assign a default value if it's null
  comments: List<CommentUser>.from((json["comments"] ?? []).map((x) => CommentUser.fromJson(x))), // Assign an empty list if it's null
  contentSize: json["content_size"] ?? 0, // Assign a default value if it's null
  disableEdition: json["disable_edition"] ?? false, // Assign false if it's null
  isRetake: json["is_retake"] ?? false, // Assign false if it's null
  frequency: json["frequency"] ?? 0, // Assign a default value if it's null
  interval: json["interval"] ?? 0, // Assign a default value if it's null
  numberOfRetakes: json["number_of_retakes"] ?? 0, // Assign a default value if it's null
  startDate: json["start_date"] ?? null, // Keep it nullable if it's null
  nextDate: json["next_date"] ?? null, // Keep it nullable if it's null
  untilDate: json["until_date"] ?? null, // Keep it nullable if it's null
  suggestDuration: json["suggest_duration"] ?? 0, // Assign a default value if it's null
  contentRead: json["content_read"] ?? 0, // Assign a default value if it's null
  completedAt: json["completed_at"] != null ? DateTime.parse(json["completed_at"]) : DateTime.now(), // Assign current time if it's null
  isNew: json["is_new"] ?? false, // Assign false if it's null
  startDateByUser: json["start_date_by_user"] ?? null, // Keep it nullable if it's null
  nextDateByUser: json["next_date_by_user"] ?? null, // Keep it nullable if it's null
  numberOfRetakesByUser: json["number_of_retakes_by_user"] ?? 0, // Assign a default value if it's null
  timeDuration: json["time_duration"] ?? 0, // Assign a default value if it's null
  minDuration: json["min_duration"] ?? false, // Assign false if it's null
  likeStatus: json["like_status"] ?? 0, // Assign a default value if it's null
);

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "description": description,
        "content": content,
        "content_type": contentType,
        "input_type": inputType,
        "status": status,
        "order": order,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "is_required": isRequired,
        "created_by": createdBy.toJson(),
        "updated_at": updatedAt.toIso8601String(),
        "likes": likes,
        "dislikes": dislikes,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "content_size": contentSize,
        "disable_edition": disableEdition,
        "is_retake": isRetake,
        "frequency": frequency,
        "interval": interval,
        "number_of_retakes": numberOfRetakes,
        "start_date": startDate,
        "next_date": nextDate,
        "until_date": untilDate,
        "suggest_duration": suggestDuration,
        "content_read": contentRead,
        "completed_at": completedAt.toIso8601String(),
        "is_new": isNew,
        "start_date_by_user": startDateByUser,
        "next_date_by_user": nextDateByUser,
        "number_of_retakes_by_user": numberOfRetakesByUser,
        "time_duration": timeDuration,
        "min_duration": minDuration,
        "like_status": likeStatus,
    };
}

class CommentUser {
    final int id;
    final dynamic comment;
    final User user;
    final int likes;
    final int dislikes;
    final DateTime createdAt;
    final DateTime updatedAt;

    CommentUser({
        required this.id,
        required this.comment,
        required this.user,
        required this.likes,
        required this.dislikes,
        required this.createdAt,
        required this.updatedAt,
    });

    factory CommentUser.fromJson(Map<String, dynamic> json) => CommentUser(
        id: json["id"],
        comment: json["comment"] ?? '',
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
    final dynamic uuid;
    final dynamic firstName;
    final dynamic lastName;
    final dynamic email;
    final dynamic profilePic;
    final bool emailVerified;
    final dynamic timezone;
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
        uuid: json["uuid"]?? '',
        firstName: json["first_name"]?? '',
        lastName: json["last_name"]?? '',
        email: json["email"]?? '',
        profilePic: json["profile_pic"]?? '',
        emailVerified: json["email_verified"],
        timezone: json["timezone"]?? '',
        isSocialLogin: json["is_social_login"],
        designation: json["designation"] ?? '',
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

class CreatedBy {
    final dynamic uuid;
    final dynamic firstName;
    final dynamic lastName;
    final dynamic firstLetter;
    final dynamic email;
    final dynamic profilePic;

    CreatedBy({
        required this.uuid,
        required this.firstName,
        required this.lastName,
        required this.firstLetter,
        required this.email,
        required this.profilePic,
    });

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        uuid: json["uuid"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"],
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
