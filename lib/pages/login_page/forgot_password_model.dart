import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/forgot_password_api.dart';
import 'package:salestable/models/forgot_password_response.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? resetEmailController;
  String? Function(BuildContext, String?)? resetEmailControllerValidator;

  String? message;
  int? statusCode;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    resetEmailController?.dispose();
  }

  Future<void> forgotPassword({
    String email = '',
  }) async {
    CustomResponse<ForgotPasswordResponse> response =
        await ForgotPasswordAPI().call(email: email);

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
}
