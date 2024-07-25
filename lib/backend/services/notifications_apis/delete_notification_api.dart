import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/delete_notification_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class DeleteNotificatrionApi {
  Future<CustomResponse<DeleteNotificationResponse>> call(
      {required String id}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'delet_pulse_post_api',
      apiUrl: buildUrl('/notification/$id/delete/'),
      callType: ApiCallType.DELETE,
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
            deleteNotificationResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
