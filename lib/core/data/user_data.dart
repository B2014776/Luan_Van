import 'package:agri_shop/core/configs/enum.dart';
import 'package:agri_shop/core/data/dto/response/user_response.dart';
import 'package:agri_shop/core/data/model/result.dart';
import 'package:dio/dio.dart';

import 'model/user_model.dart';

class UserData {
  final Dio dio;

  UserData(this.dio);

  Future<Result<UserResponse>> callRegister({required UserModel userModel}) async {
    try {
      var response = await dio.post(
        "https://api-luan-v1.onrender.com/api/v1/users/register/",
        data: userModel.toJson(),
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      if (response.statusCode == 201) {
        return Result.success(UserResponse.fromJson(response.data));
      }

      if (response.statusCode == 400) {
        return Result.error(ApiError.badRequest);
      } else if (response.statusCode == 409) {
        return Result.error(ApiError.badRequest);
      } else {
        return Result.error(ApiError.unknown); // Hoặc bạn có thể tạo thêm các loại lỗi khác
      }
    } catch (e) {
      print(userModel.toJson());
     print(e);
      return Result.error(ApiError.unknown); // Lỗi không xác định
    }
  }
  
  Future<Result<String>> callLogin ({required String userName, required String password})async{
    try{
      print('-------------------start---------');
      var response = await dio.post("https://api-luan-v1.onrender.com/api/v1/users/login/",data: {
        "username": userName,
        "password": password
      },
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      print("------------------${response.data}-----------------------------");
      if(response.statusCode== 200 ){
        return Result.success(response.data["access"]);
      }
      return Result.error(ApiError.badRequest);
    }catch (e){
      return Result.error(ApiError.badRequest);
    }
  }

  static Future<Result<UserResponse>> register({required UserModel userModel}) {
    var dataRemote = UserData(Dio());
    return dataRemote.callRegister(userModel: userModel);
  }
  static Future<Result<String>> login ({required String userName,required String password}){
    var dataRemote = UserData(Dio());
    return dataRemote.callLogin(userName: userName,password: password);
  }
}
