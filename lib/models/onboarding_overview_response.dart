// To parse this JSON data, do
//
//     final onboardingOverviewRespone = onboardingOverviewResponeFromJson(jsonString);

import 'dart:convert';

OnboardingOverviewRespone onboardingOverviewResponeFromJson(String str) => OnboardingOverviewRespone.fromJson(json.decode(str));

String onboardingOverviewResponeToJson(OnboardingOverviewRespone data) => json.encode(data.toJson());

class OnboardingOverviewRespone {
    final OverViewData data;
    final int statusCode;
    final String message;

    OnboardingOverviewRespone({
        required this.data,
        required this.statusCode,
        required this.message,
    });

    factory OnboardingOverviewRespone.fromJson(Map<String, dynamic> json) => OnboardingOverviewRespone(
        data: OverViewData.fromJson(json["data"]),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
    };
}

class OverViewData {
    final DateTime publishedAt;
    final int totalSteps;
    final Progress progress;

    OverViewData({
        required this.publishedAt,
        required this.totalSteps,
        required this.progress,
    });

    factory OverViewData.fromJson(Map<String, dynamic> json) => OverViewData(
        publishedAt: DateTime.parse(json["published_at"]),
        totalSteps: json["total_steps"],
        progress: Progress.fromJson(json["progress"]),
    );

    Map<String, dynamic> toJson() => {
        "published_at": publishedAt.toIso8601String(),
        "total_steps": totalSteps,
        "progress": progress.toJson(),
    };
}

class Progress {
    final int onboardedUsersCount;
    final int completedUsersCount;
    final int inProgressUsersCount;
    final int yetToStartUsersCount;
    final List<CompletedUser> completedUser;

    Progress({
        required this.onboardedUsersCount,
        required this.completedUsersCount,
        required this.inProgressUsersCount,
        required this.yetToStartUsersCount,
        required this.completedUser,
    });

    factory Progress.fromJson(Map<String, dynamic> json) => Progress(
        onboardedUsersCount: json["onboarded_users_count"],
        completedUsersCount: json["completed_users_count"],
        inProgressUsersCount: json["in_progress_users_count"],
        yetToStartUsersCount: json["yet_to_start_users_count"],
        completedUser: List<CompletedUser>.from(json["completed_user"].map((x) => CompletedUser.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "onboarded_users_count": onboardedUsersCount,
        "completed_users_count": completedUsersCount,
        "in_progress_users_count": inProgressUsersCount,
        "yet_to_start_users_count": yetToStartUsersCount,
        "completed_user": List<dynamic>.from(completedUser.map((x) => x.toJson())),
    };
}

class CompletedUser {
    final String uuid;
    final String firstName;
    final String lastName;
    final String firstLetter;
    final String email;
    final String profilePic;

    CompletedUser({
        required this.uuid,
        required this.firstName,
        required this.lastName,
        required this.firstLetter,
        required this.email,
        required this.profilePic,
    });

    factory CompletedUser.fromJson(Map<String, dynamic> json) => CompletedUser(
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
