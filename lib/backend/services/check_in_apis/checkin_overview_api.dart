import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/checkin_overview_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class CheckinOverviewAPI {
  Future<CustomResponse<CheckInOverviewResponse>> call(
      {required String selectedDate}) async {
    String userIdd = GetHelper.getUserId();

    Map<String, dynamic> queryParams = {};
    queryParams = {
      "start_date": selectedDate,
      "end_date": selectedDate,
      "user": userIdd
    };

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_filtered_checkin_api',
      apiUrl: buildUrl('/tracking/overview/', queryParams: queryParams),
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
            checkInOverviewResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
