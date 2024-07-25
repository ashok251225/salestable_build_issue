import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/core/Dto/add_comment_dto.dart';
import 'package:salestable/backend/api_manager.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/add_comment_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class AddCommentAPI {
  Future<CustomResponse<AddCommentResponse>> call(
      {required addCommentDto commentDto, required String postId}) async {
    String body = jsonEncode(commentDto);

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'add_comment_to_pulse_api',
      apiUrl: buildUrl('/stream/post/$postId/comment/create/'),
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
            addCommentResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
