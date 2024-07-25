import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/list_users_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class ListUsersApi {
  Future<CustomResponse<ListusersResponse>> call({String page = ''}) async {
    Map<String, dynamic> queryparams = {};
    queryparams = {"status": "1", "page": page};
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_post_count_api',
      apiUrl: buildUrl('/users/', queryParams: queryparams),
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
        await compute(listusersResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
