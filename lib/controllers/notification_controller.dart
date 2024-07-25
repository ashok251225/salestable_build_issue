import 'package:get/get.dart';
import 'package:salestable/models/notifications_response.dart';

class NotificationController extends GetxController {
  int page = 1;

  bool isLoading = false,
      ishasMoreLoading = false,
      refreshindicator = false,
      isFetchingData = false;

  List<ListElement> newNotification = [];

  void updatehasMoreLoading(bool value) {
    ishasMoreLoading = value;
    update();
  }

  void updaterefreshindicator(bool value) {
    refreshindicator = value;
    update();
  }

  void updateisFetchingData(bool value) {
    isFetchingData = value;
    update();
  }

  void updateisLoading(bool value) {
    isLoading = value;
    update();
  }

  void updatePageValue(int value) {
    page = value;
    update();
  }

  void updateNewNotifications(List<ListElement> newNotifications) {
    newNotification.addAll(newNotifications);
    update();
  }

  void clearNewpulseData() {
    newNotification.clear();
    update();
  }
}
