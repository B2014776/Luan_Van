import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var isLoading = false.obs;
  var weatherData = {}.obs; // Dữ liệu thời tiết

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void fetchData() async {
    isLoading.value = true;
    // Gọi API để lấy thông tin thời tiết
    try {
      final response = await http.get(
        Uri.parse('https://api.weatherapi.com/v1/current.json?key=0f9d04a87881425fbb4165659241710&q=Cần%20Thơ'),
      );

      if (response.statusCode == 200) {
        weatherData.value = json.decode(response.body);
        print(response.body);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      // Xử lý lỗi
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
