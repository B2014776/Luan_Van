import 'package:agri_shop/core/configs/enum.dart';
import 'package:agri_shop/core/data/dto/request/login_request_model.dart';
import 'package:agri_shop/core/data/prefs/Prefs.dart';
import 'package:agri_shop/core/data/service/apis/user_service.dart';
import 'package:agri_shop/core/data/use_case/auth_use_case.dart';
import 'package:agri_shop/core/routers/routes.dart';
import 'package:agri_shop/core/ui/snackbar_util/snackbar_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Prefs prefs = Prefs();

  var email = ''.obs;

  var password = ''.obs;

  var isLoading = false.obs;

  var isChecked = false.obs;

  UserService userService = UserService();

  bool isValidEmail(String email) {
    return GetUtils.isEmail(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 6;
  }

  Future<void> login() async {
    isLoading.value = true;

    try {
      var result = await userService.login(
          request: LoginRequestModel(
              username: emailController.text.trim(),
              password: passwordController.text.trim()));
      if (result.status == Status.success) {
        await AuthUseCase.setAuthToken(result.data?.access ?? "");
        Get.toNamed(Routes.main);
      } else {
        SnackbarUtil.showError("That bai, tai khoan k ton tai !!!");
      }
    } catch (e) {
      Get.snackbar("Error", "Login failed. Please try again.");
    } finally {
      isLoading.value = false;
    }
    isLoading.value = false;
  }
}
