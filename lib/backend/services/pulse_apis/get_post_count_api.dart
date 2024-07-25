import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/get_post_count_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class GetPostCountAPI {
  Future<CustomResponse<PulsePostCountResponse>> call() async {
    // Map<String, dynamic> queryparams = {};
    // queryparams = {"status": 0};

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_post_count_api',
      apiUrl: buildUrl('/home/stream/'),
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
            pulsePostCountResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
