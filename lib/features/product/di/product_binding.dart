
import 'package:agri_shop/features/product/presentation/controller/product_controller.dart';
import 'package:get/get.dart';

class Productbinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ProductController());
    // TODO: implement dependencies
  }
}