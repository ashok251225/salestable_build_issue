import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_manager.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/user_response.dart';

class SignInApi {
  Future<CustomResponse<UserResponse>> call(
      {required String email,
      required String password,
      required int rememberMe}) async {
    final body = '''
{
  "email": "$email",
  "password": "$password",
  "remember_me":$rememberMe
}''';
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'sign_in_api',
      apiUrl: buildUrl('/auth/login/'),
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
