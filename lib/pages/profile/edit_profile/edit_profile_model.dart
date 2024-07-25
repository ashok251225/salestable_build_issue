import 'package:salestable/backend/custom_response.dart';

import 'package:salestable/backend/services/edit_profile_api.dart';
import 'package:salestable/models/edit_profile_response.dart';
import 'package:salestable/models/user_response.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  TextEditingController? textfirstNameController;
  TextEditingController? textlastNameController;
  TextEditingController? textEmailController;
  TextEditingController? textTimeZoneController;
  TextEditingController? textDesignationController;
  late UpdatedData updatedData;

  String message = '';
  bool error = false;
  var statusCode;

  bool? checkboxValue;
  int checkboxValueNum = 0;

  bool isVisible = false;

  String firstName = '';
  String lastName = '';
  bool isValidation = false;
  List<Organisation> orgList = [];

  FocusNode unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for EditProfileInput component.

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  Future<void> fetchEditProfile(
      {required String firstName,
      required String lastName,
      required String email,
      required String timezone,
      required String designation}) async {
    CustomResponse<EditProfileResponse> response = await EditProfileAPI().call(
        firstName: firstName,
        lastName: lastName,
        email: email,
        timezone: timezone,
        designation: designation);

    switch (response.statusCode) {
      case 200:
      case 201:
        statusCode = response.statusCode;
        updatedData = response.data!.data;
        message = response.data!.message.toString();

        break;

      default:
        error = true;
        message = response.data!.message.toString();
    }
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
