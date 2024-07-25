import 'package:flutter/material.dart';
import 'package:get/get.dart';

void errorSnackBar(String message) {
  Get.showSnackbar(
    GetSnackBar(
      duration: Duration(seconds: 5),
      backgroundColor: Color.fromARGB(255, 240, 77, 59),
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
      progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      overlayBlur: 0,
      overlayColor: Colors.transparent,
    ),
  );
}
