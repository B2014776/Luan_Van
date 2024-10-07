import 'dart:async';

import 'package:agri_shop/core/configs/prefs_contants.dart';
import 'package:agri_shop/core/data/prefs/Prefs.dart';
import 'package:agri_shop/core/routers/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  final Prefs prefs = Prefs();

  RxDouble loadingProgress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    simulateLoading();
  }

  void simulateLoading() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (loadingProgress.value < 1.0) {
        loadingProgress.value += 0.1;
      } else {
        timer.cancel();
        navigateToNextScreen();
      }
    });
  }

  void navigateToNextScreen() async {
    try {
      var token = await prefs.get(PrefsConstants.token);
      if (token != null) {
        Get.toNamed(Routes.main);
      } else {
        Get.toNamed(Routes.login);
      }
    } catch (e) {
      Get.toNamed(Routes.login);
    }
  }
}
