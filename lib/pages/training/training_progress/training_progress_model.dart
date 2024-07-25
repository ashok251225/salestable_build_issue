import '../../../components/notifications/notifications_count_widget.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import '../../../core/flutter_flow/form_field_controller.dart';
import 'training_progress_widget.dart' show TrainingProgressWidget;
import 'package:flutter/material.dart';

class TrainingProgressModel extends FlutterFlowModel<TrainingProgressWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NotificationBell component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
