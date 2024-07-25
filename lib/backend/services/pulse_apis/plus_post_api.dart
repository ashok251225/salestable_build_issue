import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/plus_post_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class getpluslistpostapi {
  Future<CustomResponse<Pluspostresponse>> call(
      {required String page,
      required String user,
      required String category}) async {
    Map<String, dynamic> queryParams = {};
    if (category == "0") {
      queryParams = {"user": user, "page": page};
    } else {
      queryParams = {"user": user, "page": page, "category": category};
    }

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_pulse_list_api',
      apiUrl: buildUrl('/stream/post/v2/', queryParams: queryParams),
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
        await compute(pluspostresponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
