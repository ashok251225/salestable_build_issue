import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/update_password_api.dart';
import 'package:salestable/models/update_password_response.dart';
import 'package:salestable/pages/profile/update_password_widget.dart';

import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import '../../core/flutter_flow/flutter_flow_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordModel extends FlutterFlowModel<ResetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  late bool passwordVisibility3;
  String? Function(BuildContext, String?)? textController3Validator;

  String? message;
  int? statusCode;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
    passwordVisibility3 = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }

  Future<void> resetPassword(
      {required String currentPassword, required String newPassword}) async {
    CustomResponse<ResetPasswordResponse> response = await ResetPasswordAPI()
        .call(currentPassword: currentPassword, newPassword: newPassword);

    // error = false;
    // isValidation = false;
    // message = '';
    // appResponse = new AppResponse(response: response);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        statusCode = response.data!.statusCode;

        break;

      default:
        message = response.message.toString();
    }
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
