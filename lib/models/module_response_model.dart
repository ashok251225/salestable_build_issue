// To parse this JSON data, do
//
//     final moduleResponseModel = moduleResponseModelFromJson(jsonString);

import 'dart:convert';

ModuleResponseModel moduleResponseModelFromJson(String str) => ModuleResponseModel.fromJson(json.decode(str));

String moduleResponseModelToJson(ModuleResponseModel data) => json.encode(data.toJson());

class ModuleResponseModel {
    final ModuleData data;
    final int statusCode;
    final String message;

    ModuleResponseModel({
        required this.data,
        required this.statusCode,
        required this.message,
    });

    factory ModuleResponseModel.fromJson(Map<String, dynamic> json) => ModuleResponseModel(
        data: ModuleData.fromJson(json["data"]),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
    };
}

class ModuleData {
    final String uuid;
    final String title;
    final String description;
    final dynamic status;
    final DateTime publishedAt;
    final String icon;
    final dynamic colorCode;
    final dynamic isCustom;
    final dynamic order;
    final dynamic isPredefined;
    final dynamic contentCount;
    final List<Content> contents;
    final DateTime updatedAt;
    final CreatedBy createdBy;
    final dynamic readOnly;
    final dynamic disableEdition;
    final dynamic totalContentsSchedule;
    final dynamic isNew;
    final dynamic completedCount;
    final dynamic isCompleted;

    ModuleData({
        required this.uuid,
        required this.title,
        required this.description,
        required this.status,
        required this.publishedAt,
        required this.icon,
        required this.colorCode,
        required this.isCustom,
        required this.order,
        required this.isPredefined,
        required this.contentCount,
        required this.contents,
        required this.updatedAt,
        required this.createdBy,
        required this.readOnly,
        required this.disableEdition,
        required this.totalContentsSchedule,
        required this.isNew,
        required this.completedCount,
        required this.isCompleted,
    });

    factory ModuleData.fromJson(Map<String, dynamic> json) => ModuleData(
        uuid: json["uuid"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        publishedAt: DateTime.parse(json["published_at"]),
        icon: json["icon"],
        colorCode: json["color_code"],
        isCustom: json["is_custom"],
        order: json["order"],
        isPredefined: json["is_predefined"],
        contentCount: json["content_count"],
        contents: List<Content>.from(json["contents"].map((x) => Content.fromJson(x))),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: CreatedBy.fromJson(json["created_by"]),
        readOnly: json["read_only"],
        disableEdition: json["disable_edition"],
        totalContentsSchedule: json["total_contents_schedule"],
        isNew: json["is_new"],
        completedCount: json["completed_count"],
        isCompleted: json["is_completed"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "title": title,
        "description": description,
        "status": status,
        "published_at": publishedAt.toIso8601String(),
        "icon": icon,
        "color_code": colorCode,
        "is_custom": isCustom,
        "order": order,
        "is_predefined": isPredefined,
        "content_count": contentCount,
        "contents": List<dynamic>.from(contents.map((x) => x.toJson())),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy.toJson(),
        "read_only": readOnly,
        "disable_edition": disableEdition,
        "total_contents_schedule": totalContentsSchedule,
        "is_new": isNew,
        "completed_count": completedCount,
        "is_completed": isCompleted,
    };
}

class Content {
    final String uuid;
    final String name;
    final String description;
    final String content;
    final dynamic contentType;
    final dynamic inputType;
    final dynamic status;
    final dynamic order;
    final List<dynamic> tags;
    final dynamic isRequired;
    final CreatedBy createdBy;
    final DateTime updatedAt;
    final dynamic likes;
    final dynamic dislikes;
    final List<UserCommentData> comments;
    final dynamic contentSize;
    final dynamic disableEdition;
    final dynamic isRetake;
    final dynamic frequency;
    final dynamic interval;
    final dynamic numberOfRetakes;
    final DateTime? startDate;
    final DateTime? nextDate;
    final dynamic untilDate;
    final dynamic suggestDuration;
    final dynamic contentRead;
    final dynamic completedAt;
    final dynamic isNew;
    final dynamic startDateByUser;
    final dynamic nextDateByUser;
    final dynamic numberOfRetakesByUser;
    final dynamic timeDuration;
    final dynamic minDuration;
    final dynamic likeStatus;

    Content({
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

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        uuid: json["uuid"],
        name: json["name"],
        description: json["description"],
        content: json["content"],
        contentType: json["content_type"],
        inputType: json["input_type"],
        status: json["status"],
        order: json["order"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        isRequired: json["is_required"],
        createdBy: CreatedBy.fromJson(json["created_by"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        likes: json["likes"],
        dislikes: json["dislikes"],
        comments: List<UserCommentData>.from(json["comments"].map((x) => UserCommentData.fromJson(x))),
        contentSize: json["content_size"],
        disableEdition: json["disable_edition"],
        isRetake: json["is_retake"],
        frequency: json["frequency"],
        interval: json["interval"],
        numberOfRetakes: json["number_of_retakes"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        nextDate: json["next_date"] == null ? null : DateTime.parse(json["next_date"]),
        untilDate: json["until_date"],
        suggestDuration: json["suggest_duration"],
        contentRead: json["content_read"],
        completedAt: json["completed_at"],
        isNew: json["is_new"],
        startDateByUser: json["start_date_by_user"],
        nextDateByUser: json["next_date_by_user"],
        numberOfRetakesByUser: json["number_of_retakes_by_user"],
        timeDuration: json["time_duration"],
        minDuration: json["min_duration"],
        likeStatus: json["like_status"],
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
        "comments": List<UserCommentData>.from(comments.map((x) => x.toJson())),
        "content_size": contentSize,
        "disable_edition": disableEdition,
        "is_retake": isRetake,
        "frequency": frequency,
        "interval": interval,
        "number_of_retakes": numberOfRetakes,
        "start_date": startDate?.toIso8601String(),
        "next_date": nextDate?.toIso8601String(),
        "until_date": untilDate,
        "suggest_duration": suggestDuration,
        "content_read": contentRead,
        "completed_at": completedAt,
        "is_new": isNew,
        "start_date_by_user": startDateByUser,
        "next_date_by_user": nextDateByUser,
        "number_of_retakes_by_user": numberOfRetakesByUser,
        "time_duration": timeDuration,
        "min_duration": minDuration,
        "like_status": likeStatus,
    };
}

class CreatedBy {
    final String uuid;
    final String firstName;
    final String lastName;
    final String firstLetter;
    final String email;
    final String profilePic;

    CreatedBy({
        required this.uuid,
        required this.firstName,
        required this.lastName,
        required this.firstLetter,
        required this.email,
        required this.profilePic,
    });

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        uuid: json["uuid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        firstLetter: json["first_letter"],
        email: json["email"],
        profilePic: json["profile_pic"],
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

class UserCommentData {
  final int id;
  final String comment;
  final User user;
  final int likes;
  final int dislikes;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserCommentData({
    required this.id,
    required this.comment,
    required this.user,
    required this.likes,
    required this.dislikes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserCommentData.fromJson(Map<String, dynamic> json) => UserCommentData(
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
