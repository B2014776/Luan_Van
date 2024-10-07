import 'package:agri_shop/features/splash/presentation/controller/splash_controller.dart';
import 'package:get/get.dart';

import '../../../core/data/prefs/Prefs.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => Prefs(),
    //     fenix:
    //         true); // khởi tạo đối tượng SharedPreferences, xóa khi không dùng và tự động tạo lại khi dùng dựa vào fenix: true

    //cách 1 : khởi tạo trong lần đầu được gọi
    // sử dụng tối ưu hiệu năng không pải load api nhiều lần
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => Prefs(), fenix: true);

    // cách 2: tạo đối tượng ngay lập tưc bắt kể là dùng hay hông dùng
    // dùng trong trường hợp cần sử dụng ngay controller
    // Get.put(SplashController());
  }
}
