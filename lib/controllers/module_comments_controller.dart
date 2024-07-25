import 'package:get/get.dart';
import 'package:salestable/models/module_response_model.dart'; // Import UserCommentData

class ModuleCommentsController extends GetxController {
  var commentsData = List<UserCommentData>.empty().obs;

  void setCommentData(List<UserCommentData> data) {
    commentsData.assignAll(data.reversed);
  }
}
