import 'package:flutter/material.dart';
import 'package:salestable/components/notifications/notifications_count_model.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

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
