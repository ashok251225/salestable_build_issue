import 'package:get/get.dart';
import 'package:salestable/models/notifications_count_response.dart';

class NotificationsCountController extends GetxController {
  final Rx<NotificationCountResponse> _notificationsCount =
      NotificationCountResponse(data: 0, statusCode: 0, message: "").obs;

  NotificationCountResponse get notificationsCountData =>
      _notificationsCount.value;

  void setNotificationsCountData(NotificationCountResponse notificationsCount) {
    _notificationsCount.value = notificationsCount;
  }
}
