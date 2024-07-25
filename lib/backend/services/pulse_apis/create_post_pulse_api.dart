import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/core/Dto/add_post_dto.dart';
import 'package:salestable/backend/api_manager.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/create_pulse_post_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class CreatePulsePostAPI {
  Future<CustomResponse<CreatePulsePostResponse>> call(
      {required AddPostDTO postDTO}) async {
    final body = jsonEncode(postDTO);

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'create_pulse_post_api',
      apiUrl: buildUrl(
          '/stream/category/${GetHelper.getCategoryId()}/post/create/'),
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
            createPulsePostResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
