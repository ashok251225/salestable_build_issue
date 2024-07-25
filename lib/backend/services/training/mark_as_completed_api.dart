import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/mark_as_completed_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class MarkAsCompleteAPI {
  Future<CustomResponse<MarkAsCompletedResponse>> call(
      {required num timeDuration}) async {
    String body = """ {
      "time_duration": $timeDuration
}""";
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'mark_as_completed_api',
      apiUrl: buildUrl(
          '/training/1c98b07f-3677-4d99-97fa-f79021e9cf08/mark-complete/'),
      callType: ApiCallType.POST,
      body: body,
      params: {},
      headers: {'Authorization': GetHelper.getOrgAccessToken()},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(
            markAsCompletedResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
