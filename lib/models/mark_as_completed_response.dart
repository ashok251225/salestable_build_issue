// To parse this JSON data, do
//
//     final markAsCompletedResponse = markAsCompletedResponseFromJson(jsonString);

import 'dart:convert';

MarkAsCompletedResponse markAsCompletedResponseFromJson(String str) => MarkAsCompletedResponse.fromJson(json.decode(str));

String markAsCompletedResponseToJson(MarkAsCompletedResponse data) => json.encode(data.toJson());

class MarkAsCompletedResponse {
    final MarkedData data;
    final int statusCode;
    final String message;

    MarkAsCompletedResponse({
        required this.data,
        required this.statusCode,
        required this.message,
    });

    factory MarkAsCompletedResponse.fromJson(Map<String, dynamic> json) => MarkAsCompletedResponse(
        data: MarkedData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
    };
}

class MarkedData {
    final String uuid;
    final String name;
    final String description;
    final String content;
    final int contentType;
    final int inputType;
    final int status;
    final int order;
    final List<dynamic> tags;
    final bool isRequired;
    final CreatedBy createdBy;
    final String updatedAt;
    final int likes;
    final int dislikes;
    final List<dynamic> comments;
    final int contentSize;
    final bool disableEdition;
    final bool isRetake;
    final int frequency;
    final int interval;
    final int numberOfRetakes;
    final String startDate;
    final String nextDate;
    final dynamic untilDate;
    final int suggestDuration;
    final int contentRead;
    final String completedAt;
    final bool isNew;
    final String startDateByUser;
    final String nextDateByUser;
    final int numberOfRetakesByUser;
    final int timeDuration;
    final bool minDuration;
    final int likeStatus;

    MarkedData({
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

    factory MarkedData.fromJson(Map<String, dynamic> json) => MarkedData(
        uuid: json["uuid"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        content: json["content"] ?? '',
        contentType: json["content_type"] ?? 0,
        inputType: json["input_type"] ?? 0,
        status: json["status"] ?? 0,
        order: json["order"] ?? 0,
        tags: (json["tags"] != null) ? List<dynamic>.from(json["tags"].map((x) => x) ?? []) : [],
        isRequired: json["is_required"] ?? false,
        createdBy: CreatedBy.fromJson(json["created_by"] ?? {}),
        updatedAt: json["updated_at"] ?? '',
        likes: json["likes"] ?? 0,
        dislikes: json["dislikes"] ?? 0,
     
comments: (json["comments"] != null) ? List<dynamic>.from(json["comments"].map((x) => x) ?? []) : [],

        contentSize: json["content_size"] ?? 0,
        disableEdition: json["disable_edition"] ?? false,
        isRetake: json["is_retake"] ?? false,
        frequency: json["frequency"] ?? 0,
        interval: json["interval"] ?? 0,
        numberOfRetakes: json["number_of_retakes"] ?? 0,
        startDate: json["start_date"] ?? '',
        nextDate: json["next_date"] ?? '',
        untilDate:json["until_date"] ?? '',
        suggestDuration: json["suggest_duration"] ?? 0,
        contentRead: json["content_read"] ?? 0,
        completedAt: json["completed_at"] ?? '',
        isNew: json["is_new"] ?? false,
        startDateByUser: json["start_date_by_user"] ?? '',
        nextDateByUser: json["next_date_by_user"] ?? '',
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
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "is_required": isRequired,
        "created_by": createdBy.toJson(),
        "updated_at": updatedAt,
        "likes": likes,
        "dislikes": dislikes,
        "comments": List<dynamic>.from(comments.map((x) => x)),
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
        uuid: json["uuid"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        firstLetter: json["first_letter"] ?? '',
        email: json["email"] ?? '',
        profilePic: json["profile_pic"] ?? ''
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
