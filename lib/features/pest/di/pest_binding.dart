

import 'package:agri_shop/features/pest/presentation/controller/pest_controller.dart';
import 'package:get/get.dart';

class PestBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PestController());
  }

}