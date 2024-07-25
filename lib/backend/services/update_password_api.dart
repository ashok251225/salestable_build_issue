import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_manager.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/forgot_password_response.dart';
import 'package:salestable/models/update_password_response.dart';
import 'package:salestable/models/user_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class ResetPasswordAPI {
  Future<CustomResponse<ResetPasswordResponse>> call(
      {required String currentPassword, required String newPassword}) async {
    final body = '''
{
  "current_password": "$currentPassword",
  "new_password": "$newPassword"
  
}''';
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'update_password_api',
      apiUrl: buildUrl('/change-password/'),
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
            resetPasswordResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
