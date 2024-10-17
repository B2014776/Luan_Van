
import 'package:agri_shop/features/expanded/custom_interface/presentation/controller/custom_interface_controller.dart';
import 'package:get/get.dart';


class CustomInterfaceBinding extends Bindings{
  @override
  void dependencies() {

    //cách 1 : khởi tạo trong lần đầu được gọi
    // sử dụng tối ưu hiệu năng không pải load api nhiều lần
    Get.lazyPut(()=> CustomInterfaceController());

    // cách 2: tạo đối tượng ngay lập tưc bắt kể là dùng hay hông dùng
    // dùng trong trường hợp cần sử dụng ngay controller
    // Get.put(ProfileController());
  }
}