import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/training/get_each_module_api.dart';
import 'package:salestable/backend/services/training/mark_as_completed_api.dart';
import 'package:salestable/backend/services/training/read_content_api.dart';
import 'package:salestable/backend/services/training/training_create_comment_api.dart';
import 'package:salestable/models/mark_as_completed_response.dart';
import 'package:salestable/models/module_response_model.dart';
import 'package:salestable/pages/training/training_content/read_content_response.dart';
import 'package:salestable/pages/training/training_content/training_create_comment_response.dart';
import 'package:salestable/pages/training/training_progress/training_progress_widget.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import '../../../core/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class TrainingProgressModel extends FlutterFlowModel<TrainingProgressWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  TextEditingController? commentTextController;

  ModuleData? eachModuleContent;

  String? message;
  num? statusCode;
  CommentData? commentContentData;
  ContentData? readContentData;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    eachModuleContent;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  Future<void> fetchEachModuleContent() async {
    CustomResponse<ModuleResponseModel> response =
        await ModuleContentAPI().call();
    if (response.statusCode == 200) {
      eachModuleContent = response.data!.data;
    }
  }

  Future<void> markAsCompleted({required num timeDuration}) async {
    CustomResponse<MarkAsCompletedResponse> response =
        await MarkAsCompleteAPI().call(timeDuration: timeDuration);

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

  Future<void> addComment({required String commentData}) async {
    CustomResponse<CreateCommentResponse> response =
        await TrainingCommentAPI().call(commentData: commentData);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        statusCode = response.data!.statusCode;
        commentContentData = response.data!.data;

        break;

      default:
        message = response.message.toString();
    }
  }

  Future<void> readContent({String id = ''}) async {
    CustomResponse<ReadContentResponse> response =
        await ReadContentAPI().call(id: id);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        statusCode = response.data!.statusCode;
        readContentData = response.data!.data;

        break;

      default:
        message = response.message.toString();
    }
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
