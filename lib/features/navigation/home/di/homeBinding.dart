
import 'package:agri_shop/features/navigation/home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeController());
    // TODO: implement dependencies
  }

}