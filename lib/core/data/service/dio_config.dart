import 'package:agri_shop/core/data/prefs/Prefs.dart';
import 'package:agri_shop/core/data/use_case/auth_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

// dio config
class DioConfig extends GetxService {
  late Dio _dio;

  Prefs prefs = Prefs();

  Future<DioConfig> init() async {
    const String baseUrl = "https://api-luan-v1.onrender.com/api/v1/";
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl, // Base URL from .env
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "Content-Type": "application/json",
      },
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String token = await AuthUseCase.getAuthToken();
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        print("Error: ${error.response?.statusCode} - ${error.message}");
        return handler.next(error);
      },
    ));

    return this;
  }

  Dio get dio => _dio;
}
