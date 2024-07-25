import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/module_response_model.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class ModuleContentAPI {
  Future<CustomResponse<ModuleResponseModel>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_each_module_content_api',
      apiUrl: buildUrl('/training/module/${GetHelper.getModuleId()}/'),
      callType: ApiCallType.GET,
      headers: {'Authorization': GetHelper.getOrgAccessToken()},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(
            moduleResponseModelFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
