import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_manager.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/admin_training_overview_resp.dart';
import 'package:salestable/models/over_details_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class TrainingOVerviewApi {
  Future<CustomResponse<TrainingOverviewResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'training_overview_api',
      apiUrl: buildUrl('/home/training/'),
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
            trainingOverviewResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
