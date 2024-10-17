

import 'package:agri_shop/features/expanded/farming_technique/details/presentation/controller/detail_controller.dart';
import 'package:agri_shop/features/navigation/shop/presentation/controller/shop_controller.dart';
import 'package:get/get.dart';

class DetailsBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>DetailController());
  }

}