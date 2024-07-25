// To parse this JSON data, do
//
//     final addCheckInResponse = addCheckInResponseFromJson(jsonString);

import 'dart:convert';

AddCheckInResponse addCheckInResponseFromJson(String str) =>
    AddCheckInResponse.fromJson(json.decode(str));

String addCheckInResponseToJson(AddCheckInResponse data) =>
    json.encode(data.toJson());

class AddCheckInResponse {
  final AddCheckInData data;
  final int statusCode;
  final String message;

  AddCheckInResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory AddCheckInResponse.fromJson(Map<String, dynamic> json) =>
      AddCheckInResponse(
        data: AddCheckInData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class AddCheckInData {
  final dynamic date;
  final List<Category> categories;
  final bool checkinExists;
  final String lastCheckin;
  final PreviousCheckin previousCheckin;

  AddCheckInData({
    required this.date,
    required this.categories,
    required this.checkinExists,
    required this.lastCheckin,
    required this.previousCheckin,
  });

  factory AddCheckInData.fromJson(Map<String, dynamic> json) => AddCheckInData(
        date: json["date"] ?? '',
        categories: (json["categories"] != null)
            ? List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x)) ?? [],
              )
            : [],
        checkinExists: json["checkin_exists"] ?? false,
        lastCheckin: json["last_checkin"] ?? '',
        previousCheckin:
            PreviousCheckin.fromJson(json["previous_checkin"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "checkin_exists": checkinExists,
        "last_checkin": lastCheckin,
        "previous_checkin": previousCheckin.toJson(),
      };
}

class Category {
  final int id;
  final String name;
  final bool isOrganisation;
  final String description;
  final int frequency;
  final List<Goal> goals;

  Category({
    required this.id,
    required this.name,
    required this.isOrganisation,
    required this.description,
    required this.frequency,
    required this.goals,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        isOrganisation: json["is_organisation"] ?? false,
        description: json["description"] ?? '',
        frequency: json["frequency"] ?? 0,
        goals:
            List<Goal>.from(json["goals"].map((x) => Goal.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_organisation": isOrganisation,
        "description": description,
        "frequency": frequency,
        "goals": List<dynamic>.from(goals.map((x) => x.toJson())),
      };
}

class Goal {
  final String uuid;
  final num target;
  final String name;
  final String description;
  final int order;
  final String checkinMessage;
  final int unit;
  final int metric;
  final num expectedTarget;
  final num previousTarget;

  Goal({
    required this.uuid,
    required this.target,
    required this.name,
    required this.description,
    required this.order,
    required this.checkinMessage,
    required this.unit,
    required this.metric,
    required this.expectedTarget,
    required this.previousTarget,
  });

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        uuid: json["uuid"] ?? '',
        target: json["target"] ?? 0,
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        order: json["order"] ?? 0,
        checkinMessage: json["checkin_message"] ?? '',
        unit: json["unit"] ?? 0,
        metric: json["metric"] ?? 0,
        expectedTarget: json["expected_target"] ?? 0,
        previousTarget: json["previous_target"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "target": target,
        "name": name,
        "description": description,
        "order": order,
        "checkin_message": checkinMessage,
        "unit": unit,
        "metric": metric,
        "expected_target": expectedTarget,
        "previous_target": previousTarget,
      };
}

class PreviousCheckin {
  final String uuid;
  final String? date;

  PreviousCheckin({
    required this.uuid,
    required this.date,
  });

  factory PreviousCheckin.fromJson(Map<String, dynamic> json) {
    return PreviousCheckin(
      uuid: json["uuid"] ?? "",
      date: json["date"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "date": date,
      };
}
