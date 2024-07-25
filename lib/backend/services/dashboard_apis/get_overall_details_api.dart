import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_manager.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/over_details_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class GetOverallDetailsApi {
  Future<CustomResponse<OveralldetailsResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_over_details_api',
      apiUrl: buildUrl('/overall/details/'),
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
            overalldetailsResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
