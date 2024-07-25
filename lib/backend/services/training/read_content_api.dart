import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/pages/training/training_content/read_content_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class ReadContentAPI {
  Future<CustomResponse<ReadContentResponse>> call({String id = ''}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'read_content_api',
      apiUrl:
          buildUrl('/training/${GetHelper.getEachContentId()}/read-content/'),
      callType: ApiCallType.POST,
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
            readContentResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
