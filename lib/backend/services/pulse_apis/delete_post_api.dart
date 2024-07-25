import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_manager.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/delete_post_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class DeletePostAPI {
  Future<CustomResponse<DeletePostResponse>> call(
      {required String postId}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'delet_pulse_post_api',
      apiUrl: buildUrl('/stream/$postId/delete-post/'),
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
            deletePostResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
