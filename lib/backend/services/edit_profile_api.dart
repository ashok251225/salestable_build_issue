import 'dart:convert';
import 'package:http/http.dart' as http; // Import the http package
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/edit_profile_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class EditProfileAPI {
  Future<CustomResponse<EditProfileResponse>> call({
    required String firstName,
    required String lastName,
    required String email,
    required String timezone,
    required String designation,
  }) async {
    // Create a FormData object for the request
    var formData =
        http.MultipartRequest('POST', Uri.parse(buildUrl('/profile-update/')));
    formData.headers['Authorization'] = GetHelper.getOrgAccessToken();

    // Add fields to the form data
    formData.fields.addAll({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'timezone': timezone,
      'designation': designation,
    });

    // Send the request and await the response
    http.Response response =
        await http.Response.fromStream(await formData.send());

    return CustomResponse.completed(
        await compute(editProfileResponseFromJson,
            jsonEncode(json.decode(response.body))),
        response.statusCode);
  }
}
