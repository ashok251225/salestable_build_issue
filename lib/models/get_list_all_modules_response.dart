// To parse this JSON data, do
//
//     final listAllModulesResponse = listAllModulesResponseFromJson(jsonString);

import 'dart:convert';

ListAllModulesResponse listAllModulesResponseFromJson(String str) =>
    ListAllModulesResponse.fromJson(json.decode(str));

String listAllModulesResponseToJson(ListAllModulesResponse data) =>
    json.encode(data.toJson());

class ListAllModulesResponse {
  final ModulesData data;
  final int statusCode;
  final String message;

  ListAllModulesResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory ListAllModulesResponse.fromJson(Map<String, dynamic> json) =>
      ListAllModulesResponse(
        data: ModulesData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class ModulesData {
  final int readinessIndex;
  final int completedCount;
  final int totalModulesRequired;
  final bool isCompletedForAssessment;
  final int totalPublishedModules;
  final int assessmentStatus;
  final List<ListElement> list;
  final bool ratingGiven;
  final bool assessmentAdded;

  ModulesData({
    required this.readinessIndex,
    required this.completedCount,
    required this.totalModulesRequired,
    required this.isCompletedForAssessment,
    required this.totalPublishedModules,
    required this.assessmentStatus,
    required this.list,
    required this.ratingGiven,
    required this.assessmentAdded,
  });

  factory ModulesData.fromJson(Map<String, dynamic> json) => ModulesData(
        readinessIndex: json["readiness_index"] ?? 0,
        completedCount: json["completed_count"] ?? 0,
        totalModulesRequired: json["total_modules_required"] ?? 0,
        isCompletedForAssessment: json["is_completed_for_assessment"] ?? false,
        totalPublishedModules: json["total_published_modules"] ?? 0,
        assessmentStatus: json["assessment_status"] ?? 0,
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x)) ?? []),
        ratingGiven: json["rating_given"] ?? false,
        assessmentAdded: json["assessment_added"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "readiness_index": readinessIndex,
        "completed_count": completedCount,
        "total_modules_required": totalModulesRequired,
        "is_completed_for_assessment": isCompletedForAssessment,
        "total_published_modules": totalPublishedModules,
        "assessment_status": assessmentStatus,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "rating_given": ratingGiven,
        "assessment_added": assessmentAdded,
      };
}

class ListElement {
  final String uuid;
  final String title;
  final String description;
  final num status;
  final DateTime publishedAt;
  final String icon;
  final String? colorCode;
  final bool isCustom;
  final int order;
  final bool isPredefined;
  final int contentCount;
  final List<Content> contents;
  final DateTime updatedAt;
  final CreatedBy createdBy;
  final bool readOnly;
  final bool disableEdition;
  final int totalContentsSchedule;
  final bool isNew;
  final int completedCount;
  final bool isCompleted;
  final int totalContents;
  final int? weekly;

  ListElement({
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
    required this.totalContents,
    this.weekly,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        uuid: json["uuid"] ?? '',
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        status: json["status"] ?? 0,
        publishedAt: DateTime.parse(json["published_at"] ?? ''),
        icon: json["icon"] ?? '',
        colorCode: json["color_code"] ?? '',
        isCustom: json["is_custom"] ?? false,
        order: json["order"] ?? 0,
        isPredefined: json["is_predefined"] ?? false,
        contentCount: json["content_count"] ?? 0,
        contents: List<Content>.from(
            json["contents"].map((x) => Content.fromJson(x))),
        updatedAt: DateTime.parse(json["updated_at"] ?? ''),
        createdBy: CreatedBy.fromJson(json["created_by"] ?? {}),
        readOnly: json["read_only"] ?? false,
        disableEdition: json["disable_edition"] ?? false,
        totalContentsSchedule: json["total_contents_schedule"] ?? 0,
        isNew: json["is_new"] ?? false,
        completedCount: json["completed_count"] ?? 0,
        isCompleted: json["is_completed"] ?? false,
        totalContents: json["total_contents"] ?? 0,
        weekly: json["weekly"] ?? 0,
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
        "total_contents": totalContents,
        "weekly": weekly,
      };
}

class Content {
  final String uuid;
  final String name;
  final String description;
  final String content;
  final int contentType;
  final int inputType;
  final int status;
  final int order;
  final List<Tag> tags;
  final bool isRequired;
  final CreatedBy createdBy;
  final DateTime updatedAt;
  final int likes;
  final int dislikes;
  final List<Comment> comments;
  final int contentSize;
  final bool disableEdition;
  final bool isRetake;
  final int frequency;
  final int interval;
  final int numberOfRetakes;
  final DateTime? startDate;
  final DateTime? nextDate;
  final dynamic untilDate;
  final int suggestDuration;
  final dynamic contentRead;
  final DateTime? completedAt;
  final bool isNew;
  final DateTime? startDateByUser;
  final DateTime? nextDateByUser;
  final int? numberOfRetakesByUser;
  final int? timeDuration;
  final bool? minDuration;
  final int likeStatus;

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
        uuid: json["uuid"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        content: json["content"] ?? '',
        contentType: json["content_type"] ?? 0,
        inputType: json["input_type"] ?? 0,
        status: json["status"] ?? 0,
        order: json["order"] ?? 0,
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        isRequired: json["is_required"] ?? false,
        createdBy: CreatedBy.fromJson(json["created_by"] ?? {}),
        updatedAt: DateTime.parse(json["updated_at"] ?? ''),
        likes: json["likes"] ?? 0,
        dislikes: json["dislikes"] ?? 0,
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        contentSize: json["content_size"] ?? 0,
        disableEdition: json["disable_edition"] ?? false,
        isRetake: json["is_retake"] ?? false,
        frequency: json["frequency"] ?? 0,
        interval: json["interval"] ?? 0,
        numberOfRetakes: json["number_of_retakes"] ?? 0,
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        nextDate: json["next_date"] == null
            ? null
            : DateTime.parse(json["next_date"]),
        untilDate: json["until_date"],
        suggestDuration: json["suggest_duration"],
        contentRead: json["content_read"],
        completedAt: json["completed_at"] == null
            ? null
            : DateTime.parse(json["completed_at"]),
        isNew: json["is_new"] ?? false,
        startDateByUser: json["start_date_by_user"] == null
            ? null
            : DateTime.parse(json["start_date_by_user"]),
        nextDateByUser: json["next_date_by_user"] == null
            ? null
            : DateTime.parse(json["next_date_by_user"]),
        numberOfRetakesByUser: json["number_of_retakes_by_user"] ?? 0,
        timeDuration: json["time_duration"] ?? 0,
        minDuration: json["min_duration"] ?? false,
        likeStatus: json["like_status"] ?? 0,
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
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
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
        "start_date": startDate?.toIso8601String(),
        "next_date": nextDate?.toIso8601String(),
        "until_date": untilDate,
        "suggest_duration": suggestDuration,
        "content_read": contentRead,
        "completed_at": completedAt?.toIso8601String(),
        "is_new": isNew,
        "start_date_by_user": startDateByUser?.toIso8601String(),
        "next_date_by_user": nextDateByUser?.toIso8601String(),
        "number_of_retakes_by_user": numberOfRetakesByUser,
        "time_duration": timeDuration,
        "min_duration": minDuration,
        "like_status": likeStatus,
      };
}

class Comment {
  final int id;
  final String comment;
  final User user;
  final int likes;
  final int dislikes;
  final dynamic createdAt;
  final dynamic updatedAt;

  Comment({
    required this.id,
    required this.comment,
    required this.user,
    required this.likes,
    required this.dislikes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"] ?? 0,
        comment: json["comment"] ?? '',
        user: User.fromJson(json["user"] ?? {}),
        likes: json["likes"] ?? 0,
        dislikes: json["dislikes"] ?? 0,
        createdAt: DateTime.parse(json["created_at"]) ?? '',
        updatedAt: DateTime.parse(json["updated_at"]) ?? '',
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
        id: json["id"] ?? 0,
        uuid: json["uuid"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        email: json["email"] ?? '',
        profilePic: json["profile_pic"] ?? '',
        emailVerified: json["email_verified"] ?? false,
        timezone: json["timezone"] ?? '',
        isSocialLogin: json["is_social_login"] ?? false,
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

class Tag {
  final int id;
  final String name;

  Tag({
    required this.id,
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
