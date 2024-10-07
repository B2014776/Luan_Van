import 'package:get/get.dart';


import '../presentation/controller/wellcome_controller.dart';


class Welllcomebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<wellcomeController>(() => wellcomeController());
  }
}