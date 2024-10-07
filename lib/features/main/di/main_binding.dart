import 'package:agri_shop/features/main/presentation/controller/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>MainController());
  }

}