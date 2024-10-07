import 'package:agri_shop/core/configs/enum.dart';
import 'package:agri_shop/core/data/model/user_model.dart';
import 'package:agri_shop/core/data/user_data.dart';
import 'package:agri_shop/core/routers/routes.dart';
import 'package:agri_shop/core/ui/snackbar_util/snackbar_util.dart';
import 'package:get/get.dart';



class RegisterController extends GetxController {

  var isLoading = false.obs;
  var selectedValue = "M".obs;
  UserModel userModel = UserModel.defaultData();

  Future<void> handleLogin() async{
    isLoading.value=true;
    userModel.gender= selectedValue.value;
    if(userModel.password==userModel.password2){
      var result = await UserData.register(userModel: userModel);
      if(result.status== Status.success){
        SnackbarUtil.showSuccess("dang ky thanh cong");
        Get.toNamed(Routes.login);
      }else{
        print("that bai");
      }
    isLoading.value=false;
  }
  }
}
