// To parse this JSON data, do
//
//     final currentCheckInResponse = currentCheckInResponseFromJson(jsonString);

import 'dart:convert';

CurrentCheckInResponse currentCheckInResponseFromJson(String str) =>
    CurrentCheckInResponse.fromJson(json.decode(str));

String currentCheckInResponseToJson(CurrentCheckInResponse data) =>
    json.encode(data.toJson());

class CurrentCheckInResponse {
  final CurrentCheckInData data;
  final num statusCode;
  final String message;

  CurrentCheckInResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory CurrentCheckInResponse.fromJson(Map<String, dynamic> json) =>
      CurrentCheckInResponse(
        data: CurrentCheckInData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class CurrentCheckInData {
  final String date;
  final bool needCustomerAttention;
  final String remarks;
  final String lessonsLearned;
  final String bestPractices;
  final dynamic additionalFile;
  final List<Category> categories;
  final bool checkinExists;
  final String lastCheckin;
  final PreviousCheckin previousCheckin;

  CurrentCheckInData({
    required this.date,
    required this.needCustomerAttention,
    required this.remarks,
    required this.lessonsLearned,
    required this.bestPractices,
    required this.additionalFile,
    required this.categories,
    required this.checkinExists,
    required this.lastCheckin,
    required this.previousCheckin,
  });

  factory CurrentCheckInData.fromJson(Map<String, dynamic> json) =>
      CurrentCheckInData(
        date: json["date"] ?? '',
        needCustomerAttention: json["need_customer_attention"] ?? false,
        remarks: json["remarks"] ?? '',
        lessonsLearned: json["lessons_learned"] ?? '',
        bestPractices: json["best_practices"] ?? '',
        additionalFile: json["additional_file"] ?? '',
        categories: (json["categories"] as List<dynamic>?)
                ?.map((categoryJson) => Category.fromJson(categoryJson))
                .toList() ??
            [],
        checkinExists: json["checkin_exists"] ?? false,
        lastCheckin: json["last_checkin"] ?? '',
        previousCheckin:
            PreviousCheckin.fromJson(json["previous_checkin"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "need_customer_attention": needCustomerAttention,
        "remarks": remarks,
        "lessons_learned": lessonsLearned,
        "best_practices": bestPractices,
        "additional_file": additionalFile,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "checkin_exists": checkinExists,
        "last_checkin": lastCheckin,
        "previous_checkin": previousCheckin.toJson(),
      };
}

class Category {
  final num id;
  final String name;
  final bool isOrganisation;
  final String description;
  final num frequency;
  final String? checkinUuid;
  final List<Goal> goals;

  Category({
    required this.id,
    required this.name,
    required this.isOrganisation,
    required this.description,
    required this.frequency,
    this.checkinUuid,
    required this.goals,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        isOrganisation: json["is_organisation"] ?? false,
        description: json["description"] ?? '',
        frequency: json["frequency"] ?? 0,
        checkinUuid: json["checkin_uuid"] ?? '',
        goals:
            List<Goal>.from(json["goals"].map((x) => Goal.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_organisation": isOrganisation,
        "description": description,
        "frequency": frequency,
        "checkin_uuid": checkinUuid,
        "goals": List<dynamic>.from(goals.map((x) => x.toJson())),
      };
}

class Goal {
  final num? previousTarget;
  final String name;
  final String? description;
  final num order;
  final String? checkinMessage;
  final num unit;
  final num metric;
  final String uuid;
  final num? target;
  final num expectedTarget;
  final String? updatedAt;
  final num? delta;

  Goal({
    this.previousTarget,
    required this.name,
    required this.description,
    required this.order,
    required this.checkinMessage,
    required this.unit,
    required this.metric,
    required this.uuid,
    required this.target,
    required this.expectedTarget,
    this.updatedAt,
    this.delta,
  });

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        previousTarget: json["previous_target"] ?? 0,
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        order: json["order"] ?? 0,
        checkinMessage: json["checkin_message"] ?? '',
        unit: json["unit"] ?? 0,
        metric: json["metric"] ?? 0,
        uuid: json["uuid"] ?? '',
        target: json["target"] ?? 0,
        expectedTarget: json["expected_target"] ?? 0,
        updatedAt: json["updated_at"] ?? '',
        delta: json["delta"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "previous_target": previousTarget,
        "name": name,
        "description": description,
        "order": order,
        "checkin_message": checkinMessage,
        "unit": unit,
        "metric": metric,
        "uuid": uuid,
        "target": target,
        "expected_target": expectedTarget,
        "updated_at": updatedAt,
        "delta": delta,
      };
}

class PreviousCheckin {
  final String uuid;
  final String date;

  PreviousCheckin({
    required this.uuid,
    required this.date,
  });

  factory PreviousCheckin.fromJson(Map<String, dynamic> json) =>
      PreviousCheckin(
        uuid: json["uuid"] ?? '',
        date: json["date"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "date": date,
      };
}
