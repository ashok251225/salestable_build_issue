import 'dart:convert';

HomeCheckInResponse homeCheckInResponseFromJson(String str) =>
    HomeCheckInResponse.fromJson(json.decode(str));

String homeCheckInResponseToJson(HomeCheckInResponse data) =>
    json.encode(data.toJson());

class HomeCheckInResponse {
  final HomeCheckData data;
  final num statusCode;
  final String message;

  HomeCheckInResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory HomeCheckInResponse.fromJson(Map<String, dynamic> json) =>
      HomeCheckInResponse(
        data: HomeCheckData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class HomeCheckData {
  final String publishedAt;
  final Checkin? checkin;
  final DataPreviousCheckin previousCheckin;

  HomeCheckData({
    required this.publishedAt,
    required this.checkin,
    required this.previousCheckin,
  });

  factory HomeCheckData.fromJson(Map<String, dynamic> json) => HomeCheckData(
        publishedAt: json["published_at"] ?? '',
        checkin:
            json["checkin"] != null ? Checkin.fromJson(json["checkin"]) : null,
        previousCheckin:
            DataPreviousCheckin.fromJson(json["previous_checkin"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "published_at": publishedAt,
        "checkin": checkin?.toJson(),
        "previous_checkin": previousCheckin.toJson(),
      };
}

class Checkin {
  final String date;
  final bool needCustomerAttention;
  final String remarks;
  final String lessonsLearned;
  final String bestPractices;
  final dynamic additionalFile;
  final List<CheckinCategory>? categories;
  final bool checkinExists;
  final String lastCheckin;
  final CheckinPreviousCheckin previousCheckin;

  Checkin({
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

  factory Checkin.fromJson(Map<String, dynamic> json) => Checkin(
        date: json["date"] ?? '',
        needCustomerAttention: json["need_customer_attention"] ?? false,
        remarks: json["remarks"] ?? "",
        lessonsLearned: json["lessons_learned"] ?? '',
        bestPractices: json["best_practices"] ?? '',
        additionalFile: json["additional_file"] ?? '',
        categories: json["categories"] != null
            ? List<CheckinCategory>.from(
                json["categories"].map((x) => CheckinCategory.fromJson(x)) ??
                    [])
            : null,
        checkinExists: json["checkin_exists"] ?? false,
        lastCheckin: json["last_checkin"] ?? '',
        previousCheckin:
            CheckinPreviousCheckin.fromJson(json["previous_checkin"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "need_customer_attention": needCustomerAttention,
        "remarks": remarks,
        "lessons_learned": lessonsLearned,
        "best_practices": bestPractices,
        "additional_file": additionalFile,
        "categories": categories != null
            ? List<dynamic>.from(categories!.map((x) => x.toJson()))
            : null,
        "checkin_exists": checkinExists,
        "last_checkin": lastCheckin,
        "previous_checkin": previousCheckin.toJson(),
      };
}

class CheckinCategory {
  final num id;
  final String name;
  final bool isOrganisation;
  final String description;
  final num frequency;
  final String? checkinUuid;
  final List<HomeGoal>? goals;

  CheckinCategory({
    required this.id,
    required this.name,
    required this.isOrganisation,
    required this.description,
    required this.frequency,
    this.checkinUuid,
    required this.goals,
  });

  factory CheckinCategory.fromJson(Map<String, dynamic> json) =>
      CheckinCategory(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        isOrganisation: json["is_organisation"] ?? false,
        description: json["description"] ?? '',
        frequency: json["frequency"] ?? 0,
        checkinUuid: json["checkin_uuid"] ?? '',
        goals: json["goals"] != null
            ? List<HomeGoal>.from(
                json["goals"].map((x) => HomeGoal.fromJson(x)) ?? [],
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_organisation": isOrganisation,
        "description": description,
        "frequency": frequency,
        "checkin_uuid": checkinUuid,
        "goals": goals != null
            ? List<dynamic>.from(goals!.map((x) => x.toJson()))
            : null,
      };
}

class HomeGoal {
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

  HomeGoal({
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

  factory HomeGoal.fromJson(Map<String, dynamic> json) => HomeGoal(
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
        updatedAt: json["updated_at"] ?? "",
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

class CheckinPreviousCheckin {
  final String uuid;
  final String date;

  CheckinPreviousCheckin({
    required this.uuid,
    required this.date,
  });

  factory CheckinPreviousCheckin.fromJson(Map<String, dynamic> json) =>
      CheckinPreviousCheckin(
        uuid: json["uuid"] ?? '',
        date: json["date"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "date": date,
      };
}

class DataPreviousCheckin {
  final String date;
  final List<PreviousCheckinCategory>? categories;
  final bool checkinExists;
  final String lastCheckin;
  final PreviousCheckinPreviousCheckin previousCheckin;

  DataPreviousCheckin({
    required this.date,
    required this.categories,
    required this.checkinExists,
    required this.lastCheckin,
    required this.previousCheckin,
  });

  factory DataPreviousCheckin.fromJson(Map<String, dynamic> json) =>
      DataPreviousCheckin(
        date: json["date"] ?? '',
        categories: json["categories"] != null
            ? List<PreviousCheckinCategory>.from(
                json["categories"]
                        .map((x) => PreviousCheckinCategory.fromJson(x)) ??
                    [],
              )
            : null,
        checkinExists: json["checkin_exists"] ?? false,
        lastCheckin: json["last_checkin"] ?? '',
        previousCheckin: PreviousCheckinPreviousCheckin.fromJson(
          json["previous_checkin"] ?? {},
        ),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "categories": categories != null
            ? List<dynamic>.from(categories!.map((x) => x.toJson()))
            : null,
        "checkin_exists": checkinExists,
        "last_checkin": lastCheckin,
        "previous_checkin": previousCheckin.toJson(),
      };
}

class PreviousCheckinCategory {
  final num id;
  final String name;
  final bool isOrganisation;
  final String description;
  final num frequency;
  final List<HomeGoal>? goals;

  PreviousCheckinCategory({
    required this.id,
    required this.name,
    required this.isOrganisation,
    required this.description,
    required this.frequency,
    required this.goals,
  });

  factory PreviousCheckinCategory.fromJson(Map<String, dynamic> json) =>
      PreviousCheckinCategory(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        isOrganisation: json["is_organisation"] ?? false,
        description: json["description"] ?? '',
        frequency: json["frequency"] ?? 0,
        goals: json["goals"] != null
            ? List<HomeGoal>.from(
                json["goals"].map((x) => HomeGoal.fromJson(x)) ?? [],
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_organisation": isOrganisation,
        "description": description,
        "frequency": frequency,
        "goals": goals != null
            ? List<dynamic>.from(goals!.map((x) => x.toJson()))
            : null,
      };
}

class PreviousCheckinPreviousCheckin {
  PreviousCheckinPreviousCheckin();

  factory PreviousCheckinPreviousCheckin.fromJson(Map<String, dynamic> json) =>
      PreviousCheckinPreviousCheckin();

  Map<String, dynamic> toJson() => {};
}
