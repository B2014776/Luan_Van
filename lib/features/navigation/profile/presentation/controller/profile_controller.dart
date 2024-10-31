

import 'package:agri_shop/core/configs/prefs_contants.dart';
import 'package:agri_shop/core/data/prefs/Prefs.dart';
import 'package:agri_shop/core/routers/routes.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ProfileController extends GetxController{
  Prefs prefs = Prefs();

  Map<String,dynamic>  ? profileValue;

  var isLoading=false.obs;


  @override
  void onInit() async{
    super.onInit();
    isLoading.value=true;
    final token  =await prefs.get(PrefsConstants.token);
    profileValue = JwtDecoder.decode(token);
    isLoading.value=false;
  }

  Future<void> logOut () async {
    prefs.logout();
    Get.offAllNamed(Routes.splash);
  }
}