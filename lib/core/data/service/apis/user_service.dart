import 'package:agri_shop/core/data/dto/request/login_request_model.dart';
import 'package:agri_shop/core/data/dto/response/login_response_model.dart';
import 'package:agri_shop/core/data/dto/response/my_info_response_model.dart';
import 'package:agri_shop/core/data/dto/response/user_response.dart';
import 'package:agri_shop/core/data/model/result.dart';
import 'package:agri_shop/core/data/service/core_service.dart';

import '../../model/user_model.dart';

class UserService extends CoreService {
  Future<Result<UserResponse>> register({required UserModel request}) async {
    final body = request.toJson();
    return await postData(
        endpoint: "users/register/",
        parse: (data) => UserResponse.fromJson(data),
        data: body);
  }

  Future<Result<LoginResponseModel>> login(
      {required LoginRequestModel request}) async {
    final body = request.toJson();
    return await postData(
        endpoint: "users/login/",
        parse: (data) => LoginResponseModel.fromJson(data),
        data: body);
  }

  Future<Result<MyInfoResponseModel>> myProfile() async {
    return await fetchData(
        endpoint: "users/",
        parse: (data) => MyInfoResponseModel.fromJson(data));
  }
}
