import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http; // Import the http package
import 'package:flutter/foundation.dart';
import 'package:salestable/backend/api_services.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/models/edit_profile_response.dart';
import 'package:salestable/models/upload_file_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class UploadFileAPI {
  Future<CustomResponse<UploadFileResponse>> call({
    required File file,
  }) async {
    // Create a FormData object for the request
    var formData =
        http.MultipartRequest('POST', Uri.parse(buildUrl('/file/upload/v2/')));
    formData.headers['Authorization'] = GetHelper.getOrgAccessToken();

    // Add fields to the form data
    formData.files.add(await http.MultipartFile.fromPath('file', file.path));

    // Send the request and await the response
    http.Response response =
        await http.Response.fromStream(await formData.send());

    return CustomResponse.completed(
        await compute(
            uploadFileResponseFromJson, jsonEncode(json.decode(response.body))),
        response.statusCode);
  }
}
