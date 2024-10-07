

import 'package:agri_shop/features/farming_technique/details/presentation/controller/detail_controller.dart';
import 'package:agri_shop/features/farming_technique/presentation/controller/farmingtechnique_controller.dart';
import 'package:agri_shop/features/navigation/shop/presentation/controller/shop_controller.dart';
import 'package:agri_shop/features/pest/presentation/controller/pest_controller.dart';
import 'package:get/get.dart';

class PestBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PestController());
  }

}