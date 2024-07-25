import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/get_goals_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class GetGoalsApi {
  Future<CustomResponse<GetSalesGoalsResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_goals_api',
      apiUrl: buildUrl('/tracking/goal-categories/'),
      callType: ApiCallType.GET,
      headers: {'Authorization': GetHelper.getOrgAccessToken()},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(
            getSalesGoalsResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
