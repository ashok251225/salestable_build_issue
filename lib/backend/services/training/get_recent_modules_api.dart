import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/get_list_all_modules_response.dart';
import 'package:salestable/models/list_post_category_response.dart';
import 'package:salestable/models/recent_modules_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class RecentModulesAPI {
  Future<CustomResponse<RecentModulesResponse>> call() async {
    // Map<String, dynamic> queryparams = {};
    // queryparams = {"status": 0};

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_recent_modules_api',
      apiUrl: buildUrl('/training/recent-modules/'),
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
            recentModulesResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
