// To parse this JSON data, do
//
//     final recentModulesResponse = recentModulesResponseFromJson(jsonString);

import 'dart:convert';

RecentModulesResponse recentModulesResponseFromJson(String str) => RecentModulesResponse.fromJson(json.decode(str));

String recentModulesResponseToJson(RecentModulesResponse data) => json.encode(data.toJson());

class RecentModulesResponse {
    final List<RecentModulesData> data;
    final int statusCode;
    final String message;

    RecentModulesResponse({
        required this.data,
        required this.statusCode,
        required this.message,
    });

    factory RecentModulesResponse.fromJson(Map<String, dynamic> json) => RecentModulesResponse(
        data: List<RecentModulesData>.from(json["data"].map((x) => RecentModulesData.fromJson(x))),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "statusCode": statusCode,
        "message": message,
    };
}

class RecentModulesData {
    final String uuid;
    final String title;
    final String description;
    final int status;
    final DateTime publishedAt;
    final CreatedBy createdBy;
    final bool isCustom;
    final int order;
    final bool isPredefined;
    final int contentCount;
    final String icon;
    final String? colorCode;
    final bool readOnly;
    final bool disableEdition;
    final int totalContentsSchedule;
    final bool isNew;
    final int completedCount;
    final bool isCompleted;

    RecentModulesData({
        required this.uuid,
        required this.title,
        required this.description,
        required this.status,
        required this.publishedAt,
        required this.createdBy,
        required this.isCustom,
        required this.order,
        required this.isPredefined,
        required this.contentCount,
        required this.icon,
        required this.colorCode,
        required this.readOnly,
        required this.disableEdition,
        required this.totalContentsSchedule,
        required this.isNew,
        required this.completedCount,
        required this.isCompleted,
    });

    factory RecentModulesData.fromJson(Map<String, dynamic> json) => RecentModulesData(
        uuid: json["uuid"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdBy: CreatedBy.fromJson(json["created_by"]),
        isCustom: json["is_custom"],
        order: json["order"],
        isPredefined: json["is_predefined"],
        contentCount: json["content_count"],
        icon: json["icon"],
        colorCode: json["color_code"],
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
        "created_by": createdBy.toJson(),
        "is_custom": isCustom,
        "order": order,
        "is_predefined": isPredefined,
        "content_count": contentCount,
        "icon": icon,
        "color_code": colorCode,
        "read_only": readOnly,
        "disable_edition": disableEdition,
        "total_contents_schedule": totalContentsSchedule,
        "is_new": isNew,
        "completed_count": completedCount,
        "is_completed": isCompleted,
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
