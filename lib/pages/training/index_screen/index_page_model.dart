import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/training/get_each_module_api.dart';
import 'package:salestable/models/module_response_model.dart';
import 'package:salestable/pages/training/index_screen/index_page_widget.dart';

import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import '../../../core/flutter_flow/flutter_flow_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IndexModel extends FlutterFlowModel<IndexWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  ModuleData? eachModuleData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  Future<void> fetchEachModule() async {
    CustomResponse<ModuleResponseModel> response =
        await ModuleContentAPI().call();
    if (response.statusCode == 200) {
      eachModuleData = response.data!.data;

      // REVIEW: Remove useless prints
    }
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
