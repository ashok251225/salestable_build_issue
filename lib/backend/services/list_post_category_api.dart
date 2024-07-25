import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/list_post_category_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class GetListPostCategoryAPI {
  Future<CustomResponse<ListPostCategoryResponse>> call() async {
    // Map<String, dynamic> queryparams = {};
    // queryparams = {"status": 0};

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_list_post_category_api',
      apiUrl: buildUrl('/stream/category/post'),
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
            listPostCategoryResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
