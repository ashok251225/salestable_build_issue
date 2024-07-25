import 'package:flutter/material.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/notifications_apis/get_notifications_api.dart';
import 'package:salestable/models/notifications_response.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'notifications_widget.dart' show NotificationsWidget;

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  State fields for stateful widgets in this page.
  late List<ListElement> notificationList;

  num filter_total_pages = 0;
  num filter_per_page = 0;
  num filter_current_page = 0;
  num filter_total_items = 0;
  final unfocusNode = FocusNode();
  num total_pages = 0;
  num per_page = 0;
  num current_page = 0;
  num total_items = 0;
  // NotificationData? notificationData;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    notificationList = [];
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  Future<List<ListElement>> fetchNotificationDetails(
      {required String page}) async {
    CustomResponse<NotificationsResponse> response =
        await GetNotificationsApi().call(page: page);
    if (response.statusCode == 200) {
      notificationList = response.data!.data.list;
      total_pages = response.data!.data.pagination.numberOfPages;
      per_page = response.data!.data.pagination.perPage;
      current_page = response.data!.data.pagination.currentPage;
      total_items = response.data!.data.pagination.total;
    }
    return notificationList;
  }
}
