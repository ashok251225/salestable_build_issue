import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salestable/core/Dto/check_in_DTO.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/edit_check_in_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class UpdateCheckInApi {
  Future<CustomResponse<EditCheckInResponse>> call(
      {required CheckinDTO checkinDto}) async {
    final String body = jsonEncode(checkinDto);

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'post_check_ins_api',
      apiUrl: buildUrl('/tracking/update-checkin/'),
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
    // checkinDto.categories.clear();

    return CustomResponse.completed(
        await compute(
            editCheckInResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
