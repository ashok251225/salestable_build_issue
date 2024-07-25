import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/pulse_pinnedpost_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class GetPinnedPostApi {
  Future<CustomResponse<PinnedPostResponse>> call() async {
    // Map<String, dynamic> queryparams = {};
    // queryparams = {"status": 0};

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_pinned_post_api',
      apiUrl: buildUrl('/stream/featured-posts/'),
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
            pinnedPostResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
