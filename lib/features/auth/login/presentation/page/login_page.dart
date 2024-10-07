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
            () => controller.isLoading.value
            ? const Loading()
            : _BuildLoginBody(),
      ),
    );
  }

  Stack _BuildLoginBody() {
    return Stack(
      children: [
        Opacity(
          opacity: 1, // Điều chỉnh độ mờ ở đây (giá trị từ 0.0 đến 1.0)
          child: Image.asset(
            'assets/Images/background_login2.jpg', // Đường dẫn ảnh nền
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, // Đảm bảo ảnh bao phủ toàn bộ màn hình
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Yellowtail',  // Tên family đã khai báo trong pubspec.yaml
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                    fontSize: 60, // Sử dụng trọng lượng Bold
                  ),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Email',
                  controller: controller.emailController, // Sử dụng controller từ LoginController
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Password',
                  controller: controller.passwordController, // Sử dụng controller từ LoginController
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(() => Checkbox(
                          value: controller.isChecked.value,
                          checkColor: Colors.white,
                          activeColor: Colors.orange,
                          onChanged: (bool? value) {
                            controller.isChecked.value = value ?? false;
                          },
                        )),
                        Text(
                          'Remember Me',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child:
                    Center(
                      child: InkWell(
                        onTap: ()async{
                          await controller.login();
                          },
                        child: Text(
                            'Login',
                          style: TextSize.size20,
                        ),
                      ),
                    ),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'you don\'t have account?',
                      style:
                      TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(Routes.register);
                      },
                      child: Text(
                          'Sign in',
                        style:
                        TextStyle(
                            fontSize: 16,
                            color: Colors.orange
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0,),
                Center(child: Text('-----------Or----------',style: TextStyle(fontSize: 18, color: Colors.white),)),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
