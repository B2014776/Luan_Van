import 'package:agri_shop/features/splash/presentation/controller/login_request_splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginRequestSplashPage extends GetView<LoginRequestSplashController> {
  const LoginRequestSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Đăng nhập để tiếp tục đọc"),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
