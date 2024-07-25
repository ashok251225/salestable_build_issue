import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_manager.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/select_organization_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class SelectOrgApi {
  Future<CustomResponse<SelectOrganizationResponse>> call(
      {required String orgId}) async {
    int rememberMe = GetHelper.getRememberMe();

    final body = '''
{
  "organisation_id": "$orgId",
 
  "remember_me":$rememberMe
}''';

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'sign_in_api',
      apiUrl: buildUrl('/organisation/select/'),
      callType: ApiCallType.POST,
      headers: {'Authorization': GetHelper.getAccessToken()},
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
            selectOrganizationResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
