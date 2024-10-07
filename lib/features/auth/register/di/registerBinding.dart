import 'package:get/get.dart';

import '../presentation/controller/register_controller.dart';




class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}