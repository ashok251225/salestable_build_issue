import 'package:salestable/core/Dto/add_post_dto.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/pulse_apis/create_post_pulse_api.dart';
import 'package:salestable/backend/services/list_post_category_api.dart';
import 'package:salestable/models/create_pulse_post_response.dart';
import 'package:salestable/models/list_post_category_response.dart';

import '../../../core/flutter_flow/flutter_flow_model.dart';
import 'add_pulse_widget.dart' show AddPulseWidget;
import 'package:flutter/material.dart';

class AddPulseModel extends FlutterFlowModel<AddPulseWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textControllerValidator2;
  String message = '';
  bool error = false;
  dynamic errorInstance;
  num statusCode = 0;
  late CreatedData createdData;
  List<CategoryData>? categoryData;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    categoryData = [];
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  Future<void> fetchAddPulsePost({required String post}) async {
    AddPostDTO postDTO = AddPostDTO(post: post);
    CustomResponse<CreatePulsePostResponse> response =
        await CreatePulsePostAPI().call(postDTO: postDTO);

    message = '';
    switch (response.statusCode) {
      case 200:
      case 201:
        createdData = response.data!.data;
        statusCode = response.data!.statusCode;

        message = response.data!.message.toString();
        break;

      default:
        error = true;
        message = response.data!.message.toString();
    }
  }

  Future<void> fetchListPostCategory() async {
    CustomResponse<ListPostCategoryResponse> response =
        await GetListPostCategoryAPI().call();

    if (response.statusCode == 200) {
      categoryData = response.data!.data;
    }
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
