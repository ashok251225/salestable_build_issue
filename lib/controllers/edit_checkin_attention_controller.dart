import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCheckInAttentionController extends GetxController {
  Color color = Colors.green; // Regular variable for color
  bool attentionValue = false; // Regular variable for attention value

  void updateSelection(Set<Color> newSelection) {
    if (newSelection.contains(Colors.green)) {
      color = newSelection.first;
      attentionValue = true;
    } else {
      color = Colors.red;
      attentionValue = false;
    }
    update(); // Call update() method to notify listeners manually
  }
}
