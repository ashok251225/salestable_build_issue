import 'package:flutter/material.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/notifications_apis/notifications_count_api.dart';
import 'package:salestable/models/notifications_count_response.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'notifications_count_widget.dart' show NotificationsCountWidget;

class NotificationCountModel
    extends FlutterFlowModel<NotificationsCountWidget> {
  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
  Future<NotificationCountResponse> fetchNotificationCount() async {
    try {
      CustomResponse<NotificationCountResponse> response =
          await NotificationCountApi().call();

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception(
            'Failed to fetch notification count: ${response.message}');
      }
    } catch (e) {
      print('Error fetching notification count: $e');
      throw Exception('Failed to fetch notification count');
    }

    /// Action blocks are added here.

    /// Additional helper methods are added here.
  }
}
