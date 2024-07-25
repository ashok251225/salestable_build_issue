import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_manager.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/forgot_password_response.dart';
import 'package:salestable/models/user_response.dart';

class ForgotPasswordAPI {
  Future<CustomResponse<ForgotPasswordResponse>> call(
      { String email = '',
      }) async {
    final body = '''
{
  "email": "$email"
  
}''';
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'forgot_password_api',
      apiUrl: buildUrl('/auth/forgot-password/'),
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
        await compute(forgotPasswordResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
