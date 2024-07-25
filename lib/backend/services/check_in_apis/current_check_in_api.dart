import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_manager.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/current_check_in_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class GetCurrentCheckInsApi {
  Future<CustomResponse<CurrentCheckInResponse>> call(
      {String onDate = ''}) async {
    Map<String, dynamic> queryparams = {};
    queryparams = {"date": onDate};
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_current_check_ins_api',
      apiUrl: buildUrl('/tracking/checkin/current/', queryParams: queryparams),
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
            currentCheckInResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
