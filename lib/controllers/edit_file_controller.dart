import 'dart:io';

import 'package:get/get.dart';

class EditFileController extends GetxController {
  bool uploading = false;
  File? additionalFile;

  void setadditionalFile(File? file) {
    additionalFile = file;
    update(); // Notify listeners manually
  }

  void setUploading(bool value) {
    uploading = value;
    update(); // Notify listeners manually
  }

  void clearadditionalFile() {
    additionalFile = File('');

    update();
  }
}
