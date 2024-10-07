

import 'package:agri_shop/features/navigation/shop/presentation/controller/shop_controller.dart';
import 'package:get/get.dart';

class ShopBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ShopController());
  }

}