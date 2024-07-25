// To parse this JSON data, do
//
//     final checkInOverviewResponse = checkInOverviewResponseFromJson(jsonString);

import 'dart:convert';

CheckInOverviewResponse checkInOverviewResponseFromJson(String str) =>
    CheckInOverviewResponse.fromJson(json.decode(str));

String checkInOverviewResponseToJson(CheckInOverviewResponse data) =>
    json.encode(data.toJson());

class CheckInOverviewResponse {
  final List<FilteredData> data;
  final num statusCode;
  final String message;

  CheckInOverviewResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory CheckInOverviewResponse.fromJson(Map<String, dynamic> json) =>
      CheckInOverviewResponse(
        data: List<FilteredData>.from(
            json["data"].map((x) => FilteredData.fromJson(x)) ?? []),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "statusCode": statusCode,
        "message": message,
      };
}

class FilteredData {
  final String name;
  final String description;
  final num totalRep;
  final num frequency;
  final String frequencyText;
  final List<FilteredGoal> goals;
  final String publishedDate;

  FilteredData({
    required this.name,
    required this.description,
    required this.totalRep,
    required this.frequency,
    required this.frequencyText,
    required this.goals,
    required this.publishedDate,
  });

  factory FilteredData.fromJson(Map<String, dynamic> json) => FilteredData(
      name: json["name"] ?? '',
      description: json["description"] ?? '',
      totalRep: json["total_rep"] ?? 0,
      frequency: json["frequency"] ?? 0,
      frequencyText: json["frequency_text"] ?? '',
      goals: List<FilteredGoal>.from(
          json["goals"].map((x) => FilteredGoal.fromJson(x)) ?? []),
      publishedDate: json["published_date"] ?? '');

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "total_rep": totalRep,
        "frequency": frequency,
        "frequency_text": frequencyText,
        "goals": List<dynamic>.from(goals.map((x) => x.toJson())),
        "published_date": publishedDate,
      };
}

class FilteredGoal {
  final String uuid;
  final String name;
  final num unit;
  final GoalData goalData;

  FilteredGoal({
    required this.uuid,
    required this.name,
    required this.unit,
    required this.goalData,
  });

  factory FilteredGoal.fromJson(Map<String, dynamic> json) => FilteredGoal(
        uuid: json["uuid"] ?? '',
        name: json["name"] ?? '',
        unit: json["unit"] ?? 0,
        goalData: GoalData.fromJson(json["goal_data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "unit": unit,
        "goal_data": goalData.toJson(),
      };
}

class GoalData {
  final num metric;
  final num totalUsersTarget;
  final num expectedTarget;
  final String totalUsersTargetText;
  final String expectedTargetText;
  final num deltaValue;
  final dynamic deltaValueText;
  final num progress;
  final List<TopUser> topUsers;
  final num avgTeamProgress;

  GoalData({
    required this.metric,
    required this.totalUsersTarget,
    required this.expectedTarget,
    required this.totalUsersTargetText,
    required this.expectedTargetText,
    required this.deltaValue,
    required this.deltaValueText,
    required this.progress,
    required this.topUsers,
    required this.avgTeamProgress,
  });

  factory GoalData.fromJson(Map<String, dynamic> json) => GoalData(
        metric: json["metric"] ?? 0,
        totalUsersTarget: json["total_users_target"] ?? 0,
        expectedTarget: json["expected_target"] ?? 0,
        totalUsersTargetText: json["total_users_target_text"] ?? '',
        expectedTargetText: json["expected_target_text"] ?? '',
        deltaValue: json["delta_value"] ?? 0,
        deltaValueText: json["delta_value_text"] ?? '',
        progress: json["progress"] ?? 0,
        topUsers: List<TopUser>.from(
            json["top_users"].map((x) => TopUser.fromJson(x)) ?? []),
        avgTeamProgress: json["avg_team_progress"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "metric": metric,
        "total_users_target": totalUsersTarget,
        "expected_target": expectedTarget,
        "total_users_target_text": totalUsersTargetText,
        "expected_target_text": expectedTargetText,
        "delta_value": deltaValue,
        "delta_value_text": deltaValueText,
        "progress": progress,
        "top_users": List<dynamic>.from(topUsers.map((x) => x.toJson())),
        "avg_team_progress": avgTeamProgress,
      };
}

class TopUser {
  final String uuid;
  final String fullName;
  final String profilePic;

  TopUser({
    required this.uuid,
    required this.fullName,
    required this.profilePic,
  });

  factory TopUser.fromJson(Map<String, dynamic> json) => TopUser(
        uuid: json["uuid"] ?? '',
        fullName: json["full_name"] ?? '',
        profilePic: json["profile_pic"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "full_name": fullName,
        "profile_pic": profilePic,
      };
}
