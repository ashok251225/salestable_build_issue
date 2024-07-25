import 'package:get/get.dart';

class PulsePostController extends GetxController {
  bool notTappedLike = true;
  int likeCount = 0;
  String activeReaction = '';

  void toggleLike() {
    if (notTappedLike) {
      likeCount++;
    }
    update();
  }

  void updateTapStatus(bool value) {
    notTappedLike = value;
    update();
  }

  void setInitialLikeCount(int count) {
    likeCount = count;
    update();
  }

  void setInitialActiveReaction(String reaction) {
    activeReaction = reaction;
    update();
  }

  void updateCommentsCount() {
    update();
  }
}
