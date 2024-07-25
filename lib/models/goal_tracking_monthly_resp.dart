// To parse this JSON data, do
//
//     final goalTrackingMonthlyResponse = goalTrackingMonthlyResponseFromJson(jsonString);

import 'dart:convert';

GoalTrackingMonthlyResponse goalTrackingMonthlyResponseFromJson(String str) => GoalTrackingMonthlyResponse.fromJson(json.decode(str));

String goalTrackingMonthlyResponseToJson(GoalTrackingMonthlyResponse data) => json.encode(data.toJson());

class GoalTrackingMonthlyResponse {
    final GoalTrackingData data;
    final num statusCode;
    final String message;

    GoalTrackingMonthlyResponse({
        required this.data,
        required this.statusCode,
        required this.message,
    });

    factory GoalTrackingMonthlyResponse.fromJson(Map<String, dynamic> json) => GoalTrackingMonthlyResponse(
        data: GoalTrackingData.fromJson(json["data"]),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
    };
}

class GoalTrackingData {
    final DateTime publishedAt;
    final List<Overview> overview;

    GoalTrackingData({
        required this.publishedAt,
        required this.overview,
    });

    factory GoalTrackingData.fromJson(Map<String, dynamic> json) => GoalTrackingData(
        publishedAt: DateTime.parse(json["published_at"]),
        overview: List<Overview>.from(json["overview"].map((x) => Overview.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "published_at": publishedAt.toIso8601String(),
        "overview": List<dynamic>.from(overview.map((x) => x.toJson())),
    };
}

class Overview {
    final String name;
    final String description;
    final num frequency;
    final String frequencyText;
    final DateTime publishedDate;
    final List<String> headerDates;
    final List<Goal> goals;

    Overview({
        required this.name,
        required this.description,
        required this.frequency,
        required this.frequencyText,
        required this.publishedDate,
        required this.headerDates,
        required this.goals,
    });

    factory Overview.fromJson(Map<String, dynamic> json) => Overview(
        name: json["name"],
        description: json["description"],
        frequency: json["frequency"],
        frequencyText: json["frequency_text"],
        publishedDate: DateTime.parse(json["published_date"]),
        headerDates: List<String>.from(json["header_dates"].map((x) => x)),
        goals: List<Goal>.from(json["goals"].map((x) => Goal.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "frequency": frequency,
        "frequency_text": frequencyText,
        "published_date": publishedDate.toIso8601String(),
        "header_dates": List<dynamic>.from(headerDates.map((x) => x)),
        "goals": List<dynamic>.from(goals.map((x) => x.toJson())),
    };
}

class Goal {
    final String name;
    final num unit;
    final List<GoalDatum> goalData;

    Goal({
        required this.name,
        required this.unit,
        required this.goalData,
    });

    factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        name: json["name"],
        unit: json["unit"],
        goalData: List<GoalDatum>.from(json["goal_data"].map((x) => GoalDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "unit": unit,
        "goal_data": List<dynamic>.from(goalData.map((x) => x.toJson())),
    };
}

class GoalDatum {
    final bool current;
    final String headerText;
    final num totalUsersTarget;
    final num deltaValue;
    final String deltaValueText;
    final num expectedTarget;
    final String totalUsersTargetText;
    final String expectedTargetText;

    GoalDatum({
        required this.current,
        required this.headerText,
        required this.totalUsersTarget,
        required this.deltaValue,
        required this.deltaValueText,
        required this.expectedTarget,
        required this.totalUsersTargetText,
        required this.expectedTargetText,
    });

    factory GoalDatum.fromJson(Map<String, dynamic> json) => GoalDatum(
        current: json["current"],
        headerText: json["header_text"],
        totalUsersTarget: json["total_users_target"],
        deltaValue: json["delta_value"],
        deltaValueText: json["delta_value_text"],
        expectedTarget: json["expected_target"],
        totalUsersTargetText: json["total_users_target_text"],
        expectedTargetText: json["expected_target_text"],
    );

    Map<String, dynamic> toJson() => {
        "current": current,
        "header_text": headerText,
        "total_users_target": totalUsersTarget,
        "delta_value": deltaValue,
        "delta_value_text": deltaValueText,
        "expected_target": expectedTarget,
        "total_users_target_text": totalUsersTargetText,
        "expected_target_text": expectedTargetText,
    };
}
