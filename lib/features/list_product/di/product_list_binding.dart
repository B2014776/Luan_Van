
import 'package:agri_shop/features/list_product/presentation/controller/product_list_controller.dart';
import 'package:agri_shop/features/product/presentation/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ProductListController());
    // TODO: implement dependencies
  }
}