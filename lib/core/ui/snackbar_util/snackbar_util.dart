import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtil {
  static show(String message) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Text(
          message.tr,
          style: Theme.of(Get.context!)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        ),
        snackStyle: SnackStyle.GROUNDED,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static showSuccess (String message ){
    Get.snackbar("thanh cong", message);
  }
  static showError (String message ){
    Get.snackbar("that bai", message);
  }
  // static showWarning (String message ){
  //   Get.snackbar(AppContents.warningTag, message);
  // }
  // static showInfo(String message ){
  //   Get.snackbar(AppContents.infoTag, message);
  // }
}