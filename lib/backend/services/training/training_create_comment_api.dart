import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/pages/training/training_content/training_create_comment_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class TrainingCommentAPI {
  Future<CustomResponse<CreateCommentResponse>> call(
      {required String commentData}) async {
    String body = '''{
      "comment" : "$commentData"
    }           
''';

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'add_training_comment_api',
      apiUrl: buildUrl('/training/${GetHelper.getContentId()}/comment/create/'),
      callType: ApiCallType.POST,
      headers: {'Authorization': GetHelper.getOrgAccessToken()},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(
            createCommentResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
