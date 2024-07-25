import 'package:get/get.dart';

class MarkAsReadController extends GetxController {
  bool isContentWatched = false;
  bool isImgtWatched  = false;

  void updateIsContentWatched(bool isContentWatchedVal){
    isContentWatched = isContentWatchedVal;
    update();
  }
   void updateIsImageWatched(bool isImgWatchedVal){
    isImgtWatched = isImgWatchedVal;
    update();
  }

 
}
