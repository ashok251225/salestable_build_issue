import 'package:flutter/material.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/notifications_apis/delete_notification_api.dart';
import 'package:salestable/backend/services/notifications_apis/notifications_count_api.dart';
import 'package:salestable/backend/services/post_notification_api.dart';
import 'package:salestable/components/notifications/notification_card_widget.dart';
import 'package:salestable/models/delete_notification_response.dart';
import 'package:salestable/models/notifications_count_response.dart';
import 'package:salestable/models/update_notification_response.dart';

import '../../core/flutter_flow/flutter_flow_util.dart';

class NotificationModel extends FlutterFlowModel<NotificationCard> {
  /// Initialization and disposal methods.
  int statusCode = 0;

  String message = '';
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  Future<void> deleteNotification({required String id}) async {
    CustomResponse<DeleteNotificationResponse> response =
        await DeleteNotificatrionApi().call(id: id);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        statusCode = response.data!.statusCode;

        break;

      default:
        message = response.data!.message.toString();
    }
  }

  Future<void> makeAsReadNotification(
      {required num notification_id, required num status}) async {
    CustomResponse<UpdateNotificationsResponse> response =
        await PostUpdateNotificationApi()
            .call(notfication_id: notification_id, status: status);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        statusCode = response.data!.statusCode;

        break;

      default:
        message = response.data!.message.toString();
    }
  }

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
