import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/viewpost_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class getviewpostapi {
  Future<CustomResponse<ViewPostResponse>> call(
      {required String postId}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_pulse_list_api',
      apiUrl: buildUrl('/stream/post/$postId/comment/'),
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
        await compute(viewPostResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
