// To parse this JSON data, do
//
//     final trainingOverviewResponse = trainingOverviewResponseFromJson(jsonString);

import 'dart:convert';

TrainingOverviewResponse trainingOverviewResponseFromJson(String str) => TrainingOverviewResponse.fromJson(json.decode(str));

String trainingOverviewResponseToJson(TrainingOverviewResponse data) => json.encode(data.toJson());

class TrainingOverviewResponse {
    final Data data;
    final int statusCode;
    final String message;

    TrainingOverviewResponse({
        required this.data,
        required this.statusCode,
        required this.message,
    });

    factory TrainingOverviewResponse.fromJson(Map<String, dynamic> json) => TrainingOverviewResponse(
        data: Data.fromJson(json["data"]),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
    };
}

class Data {
    final bool setupComplete;
    final Progress progress;
    final double totalReadinessIndex;

    Data({
        required this.setupComplete,
        required this.progress,
        required this.totalReadinessIndex,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        setupComplete: json["setup_complete"],
        progress: Progress.fromJson(json["progress"]),
        totalReadinessIndex: json["total_readiness_index"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "setup_complete": setupComplete,
        "progress": progress.toJson(),
        "total_readiness_index": totalReadinessIndex,
    };
}

class Progress {
    final int totalModule;
    final int totalModuleOptional;
    final int completedCount;
    final int inProgressCount;
    final int yetToStartCount;
    final int totalPublishedModules;

    Progress({
        required this.totalModule,
        required this.totalModuleOptional,
        required this.completedCount,
        required this.inProgressCount,
        required this.yetToStartCount,
        required this.totalPublishedModules,
    });

    factory Progress.fromJson(Map<String, dynamic> json) => Progress(
        totalModule: json["total_module"],
        totalModuleOptional: json["total_module_optional"],
        completedCount: json["completed_count"],
        inProgressCount: json["in_progress_count"],
        yetToStartCount: json["yet_to_start_count"],
        totalPublishedModules: json["total_published_modules"],
    );

    Map<String, dynamic> toJson() => {
        "total_module": totalModule,
        "total_module_optional": totalModuleOptional,
        "completed_count": completedCount,
        "in_progress_count": inProgressCount,
        "yet_to_start_count": yetToStartCount,
        "total_published_modules": totalPublishedModules,
    };
}
