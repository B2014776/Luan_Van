import 'package:agri_shop/core/configs/enum.dart';
import 'package:agri_shop/core/configs/prefs_contants.dart';
import 'package:agri_shop/core/data/prefs/Prefs.dart';
import 'package:agri_shop/core/data/user_data.dart';
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

  bool isValidEmail(String email) {

    return GetUtils.isEmail(email);

  }

  bool isValidPassword(String password) {

    return password.length >= 6;

  }

  Future<void> login() async {

    isLoading.value= true;

    try {

      emailController.text="user1";

      passwordController.text="123@abcd";

      var result  = await UserData.login(userName: emailController.text.trim(), password: passwordController.text.trim());

      if(result.status== Status.success){

        prefs.set(PrefsConstants.token, result.data.toString());

        Get.toNamed(Routes.main);

      }else{
        SnackbarUtil.showError("That bai, tai khoan k ton tai !!!");
      }
    } catch (e) {
      Get.snackbar("Error", "Login failed. Please try again.");
    } finally {
      isLoading.value = false;
    }
    isLoading.value=false;
  }
}
