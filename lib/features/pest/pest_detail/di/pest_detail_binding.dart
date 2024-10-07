
import 'package:agri_shop/features/pest/pest_detail/presentation/controller/pest_detail_controller.dart';
import 'package:get/get.dart';

class PestDetailBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PestDetailController());
  }

}