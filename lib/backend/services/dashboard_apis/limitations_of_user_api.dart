import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_manager.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/user_limits_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class UserLimitsAPI {
  Future<CustomResponse<UserLimitResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_user_limits_api',
      apiUrl: buildUrl('/category/details/'),
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
        await compute(userLimitResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
