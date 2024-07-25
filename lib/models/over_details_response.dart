// To parse this JSON data, do
//
//     final overalldetailsResponse = overalldetailsResponseFromJson(jsonString);

import 'dart:convert';

OveralldetailsResponse overalldetailsResponseFromJson(String str) =>
    OveralldetailsResponse.fromJson(json.decode(str));

String overalldetailsResponseToJson(OveralldetailsResponse data) =>
    json.encode(data.toJson());

class OveralldetailsResponse {
  final OverallData data;
  final int statusCode;
  final String message;

  OveralldetailsResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory OveralldetailsResponse.fromJson(Map<String, dynamic> json) =>
      OveralldetailsResponse(
        data: OverallData.fromJson(json["data"] ?? {}),
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class OverallData {
  final double trainingCompletionRate;
  final int customerWinRate;
  final int averageContractValue;
  final String rampTime;

  OverallData({
    required this.trainingCompletionRate,
    required this.customerWinRate,
    required this.averageContractValue,
    required this.rampTime,
  });

  factory OverallData.fromJson(Map<String, dynamic> json) => OverallData(
        trainingCompletionRate:
            json["training_completion_rate"]?.toDouble() ?? 0,
        customerWinRate: json["customer_win_rate"] ?? 0,
        averageContractValue: json["average_contract_value"] ?? 0,
        rampTime: json["ramp_time"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "training_completion_rate": trainingCompletionRate,
        "customer_win_rate": customerWinRate,
        "average_contract_value": averageContractValue,
        "ramp_time": rampTime,
      };
}
