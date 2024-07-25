import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_manager.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/user_response.dart';

class SocialSignInApi {
  Future<CustomResponse<UserResponse>> call({
    required String accessToken,
    required String socialType,
  }) async {
    final body = '''
{
  "access_token": "${accessToken}",
    "social_type": "${socialType}",
    "redirect_uri": "https://app.staging.salestable.ai/signin"
}''';
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'social_sign_in_api',
      apiUrl: buildUrl('/auth/social/signup/'),
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(userResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
