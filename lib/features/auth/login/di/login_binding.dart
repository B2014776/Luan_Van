import 'package:get/get.dart';

import '../../../../core/data/prefs/Prefs.dart';
import '../presentation/controller/login_controller.dart';


class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.lazyPut(() => Prefs(), fenix: true);
  }
}