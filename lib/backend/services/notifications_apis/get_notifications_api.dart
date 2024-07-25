import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import 'package:salestable/models/notifications_response.dart';

class GetNotificationsApi {
  Future<CustomResponse<NotificationsResponse>> call(
      {required String page}) async {
    Map<String, dynamic> queryparams = {};
    queryparams = {"page": page};

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_notifications_api',
      apiUrl: buildUrl('/notifications/', queryParams: queryparams),
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
            notificationsResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
