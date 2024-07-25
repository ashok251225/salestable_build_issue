import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Color color = const Color(0xFF0494FD); // Regular variable for color
  bool isitWork = true; // Regular variable for attention value

  void updateButtonSatus() {
    color = Colors.grey;
    isitWork = false;

    update(); // Call update() method to notify listeners manually
  }
}
