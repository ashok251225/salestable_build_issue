import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/reaction_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class AddReactionAPI {
  Future<CustomResponse<ReactionResponse>> call(
      {required String reactionType, required String postId}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_pulse_list_api',
      apiUrl: buildUrl('/stream/post/$postId/reaction/$reactionType/'),
      callType: ApiCallType.POST,
      headers: {'Authorization': GetHelper.getOrgAccessToken()},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(reactionResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
