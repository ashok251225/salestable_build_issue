import 'package:get/get.dart';

class CheckinController extends GetxController {
  bool isLoading = false;
  DateTime selectedDate = DateTime.now();

  void updateLoadingValue(bool isLoadingvalue) {
    isLoading = isLoadingvalue;
    update();
  }

  void updateSelectedDate(DateTime onDate) {
    selectedDate = onDate;
    update();
  }
}
