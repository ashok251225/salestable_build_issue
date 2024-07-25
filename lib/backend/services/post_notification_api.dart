import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/update_notification_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class PostUpdateNotificationApi {
  Future<CustomResponse<UpdateNotificationsResponse>> call(
      {required num notfication_id, required num status}) async {
    String body = """ {
    "notification_id": $notfication_id, 
    "status": $status
}""";
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'Update_notification_api',
      apiUrl: buildUrl('/update-notification/'),
      // Map<String, dynamic> queryparams = {};
      // queryparams = {"page": page};
      callType: ApiCallType.POST,
      body: body,
      params: {},
      headers: {'Authorization': GetHelper.getOrgAccessToken()},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(
            updateNotificationsResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
