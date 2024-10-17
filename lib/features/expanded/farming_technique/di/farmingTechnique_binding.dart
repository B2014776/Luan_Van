

import 'package:agri_shop/features/expanded/farming_technique/presentation/controller/farmingtechnique_controller.dart';
import 'package:agri_shop/features/navigation/shop/presentation/controller/shop_controller.dart';
import 'package:get/get.dart';

class FarmingtechniqueBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>FarmingtechniqueController());
  }

}