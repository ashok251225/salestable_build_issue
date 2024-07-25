import 'package:get/get.dart';
import 'package:salestable/pages/training/training_content/read_content_response.dart';

class ReadContentCommentsController extends GetxController {
  var commentsData = List<CommentUser>.empty().obs;

  void setCommentData(List<CommentUser> data) {
    commentsData.assignAll(data.reversed);
  }
}
