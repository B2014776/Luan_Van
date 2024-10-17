
import 'package:agri_shop/features/expanded/change_passwd/presentation/controller/change_passwd_controller.dart';
import 'package:get/get.dart';


class ChangePasswordBinding extends Bindings{
  @override
  void dependencies() {

    //cách 1 : khởi tạo trong lần đầu được gọi
    // sử dụng tối ưu hiệu năng không pải load api nhiều lần
    Get.lazyPut(()=> ChangePasswordController());

    // cách 2: tạo đối tượng ngay lập tưc bắt kể là dùng hay hông dùng
    // dùng trong trường hợp cần sử dụng ngay controller
    // Get.put(ProfileController());
  }
}