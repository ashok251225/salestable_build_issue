import 'package:flutter/material.dart';
import 'package:get/get.dart';

void successSnackBar(String message) {
  Get.showSnackbar(
    GetSnackBar(
      duration: const Duration(seconds: 5),
      backgroundColor: const Color(0xFF39D099),
      // title: 'Error',
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),

      snackPosition: SnackPosition.TOP,
      barBlur: 20,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      showProgressIndicator: false,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      progressIndicatorValueColor:
          const AlwaysStoppedAnimation<Color>(Colors.green),
      overlayBlur: 0,
      overlayColor: Colors.transparent,
    ),
  );
}
