// To parse this JSON data, do
//
//     final getSalesGoalsResponse = getSalesGoalsResponseFromJson(jsonString);

import 'dart:convert';

GetSalesGoalsResponse getSalesGoalsResponseFromJson(String str) =>
    GetSalesGoalsResponse.fromJson(json.decode(str));

String getSalesGoalsResponseToJson(GetSalesGoalsResponse data) =>
    json.encode(data.toJson());

class GetSalesGoalsResponse {
  GoalsData? data;
  int? statusCode;
  String? message;

  GetSalesGoalsResponse({
    this.data,
    this.statusCode,
    this.message,
  });

  factory GetSalesGoalsResponse.fromJson(Map<String, dynamic> json) =>
      GetSalesGoalsResponse(
        data: GoalsData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class GoalsData {
  String? publishedAt;
  List<GoalCategory>? categories;

  GoalsData({
    this.publishedAt,
    this.categories,
  });

  factory GoalsData.fromJson(Map<String, dynamic> json) => GoalsData(
        publishedAt: json["published_at"],
        categories: List<GoalCategory>.from(
            json["categories"]!.map((x) => GoalCategory.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() =>
      {"published_at": publishedAt, "categories": categories};
}

class GoalCategory {
  int? id;
  String? name;
  String description;
  int? frequency;
  List<DataOFGoal>? goals;
  bool? isContentAdded;
  bool? isOrganisation;

  GoalCategory({
    this.id,
    this.name,
    required this.description,
    this.frequency,
    this.goals,
    this.isContentAdded,
    this.isOrganisation,
  });

  factory GoalCategory.fromJson(Map<String, dynamic> json) => GoalCategory(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        frequency: json["frequency"] ?? 0,
        goals: List<DataOFGoal>.from(
            json["goals"]!.map((x) => DataOFGoal.fromJson(x)) ?? []),
        isContentAdded: json["is_content_added"] ?? false,
        isOrganisation: json["is_organisation"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "frequency": frequency,
        "goals": goals,
        "is_content_added": isContentAdded,
        "is_organisation": isOrganisation,
      };
}

class DataOFGoal {
  String? uuid;
  String? name;
  int? unit;
  double? target;
  int? status;
  int? metric;
  int? order;
  String? description;
  int? frequency;
  bool? isCustom;
  CreatedBy? createdBy;
  String? checkinMessage;

  DataOFGoal({
    this.uuid,
    this.name,
    this.unit,
    this.target,
    this.status,
    this.metric,
    this.order,
    this.description,
    this.frequency,
    this.isCustom,
    this.createdBy,
    this.checkinMessage,
  });

  factory DataOFGoal.fromJson(Map<String, dynamic> json) => DataOFGoal(
        uuid: json["uuid"] ?? '',
        name: json["name"] ?? '',
        unit: json["unit"] ?? 0,
        target: json["target"] ?? 0.0,
        status: json["status"] ?? 0,
        metric: json["metric"] ?? 0,
        order: json["order"] ?? 0,
        description: json["description"] ?? '',
        frequency: json["frequency"] ?? 0,
        isCustom: json["is_custom"] ?? false,
        createdBy: CreatedBy.fromJson(json["created_by"] ?? {}),
        checkinMessage: json["checkin_message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "unit": unit,
        "target": target,
        "status": status,
        "metric": metric,
        "order": order,
        "description": description,
        "frequency": frequency,
        "is_custom": isCustom,
        "created_by": createdBy?.toJson(),
        "checkin_message": checkinMessage,
      };
}

class CreatedBy {
  String? uuid;
  String? firstName;
  String? lastName;
  String? firstLetter;
  String? email;
  String? profilePic;

  CreatedBy({
    this.uuid,
    this.firstName,
    this.lastName,
    this.firstLetter,
    this.email,
    this.profilePic,
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
