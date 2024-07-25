import 'package:get/get.dart';
import 'package:salestable/models/viewpost_response.dart';

class CommentsController extends GetxController {
  var commentsData = List<CommentData>.empty().obs;

  void setCommentsData(List<CommentData> data) {
    commentsData.assignAll(data.reversed);
  }
}
