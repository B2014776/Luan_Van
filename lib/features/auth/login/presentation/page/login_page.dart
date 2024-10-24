import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/routers/routes.dart';
import 'package:agri_shop/core/ui/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/configs/text_size.dart';
import '../../../../../core/ui/text_input/textField_login.dart';
import '../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value ? const Loading() : _BuildLoginBody(),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Stack _BuildLoginBody() {
    return Stack(
      children: [
        Opacity(
          opacity: 1,
          child: Image.asset(
            'assets/Images/background_login2.jpg', // Đường dẫn ảnh nền
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, // Đảm bảo ảnh bao phủ toàn bộ màn hình
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: Container(
              height: Get.height * .6,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black.withOpacity(.5), blurRadius: 15)
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white.withOpacity(.15)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontFamily:
                            'Yellowtail', // Tên family đã khai báo trong pubspec.yaml
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[800],
                        fontSize: 60, // Sử dụng trọng lượng Bold
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      hintText: 'Email',
                      controller: controller
                          .emailController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Password',
                      controller: controller
                          .passwordController,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(() => Checkbox(
                                  value: controller.isChecked.value,
                                  checkColor: Colors.white,
                                  activeColor: Colors.orange,
                                  side: const BorderSide(
                                      width: 0, color: AppColors.primary),
                                  onChanged: (bool? value) {
                                    controller.isChecked.value = value ?? false;
                                  },
                                )),
                            const Text(
                              'Remember Me',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: InkWell(
                          onTap: () async {
                            await controller.login();
                          },
                          child: const Text(
                            'Login',
                            style: TextSize.size20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'you don\'t have account?',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.register);
                          },
                          child: const Text(
                            'Sign in',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.orange),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    const Center(
                        child: const Text(
                      '-----------Or----------',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
