

import 'package:agri_shop/features/navigation/blogs/presentation/controller/blogs_controller.dart';
import 'package:get/get.dart';

class BlogsBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>BlogsController());
  }

}