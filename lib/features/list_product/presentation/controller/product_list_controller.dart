import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../../../core/api/model/product_model.dart';

class ProductListController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse('https://api-luan-v1.onrender.com/api/v1/products/'),
        headers: {

          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as List; // Thay đổi đây thành List<dynamic>


        // Đảm bảo ánh xạ từng phần tử trong danh sách jsonResponse
        productList.value = jsonResponse.map((json) => Product.fromJson(json)).toList();
        print("âsascascas");

      } else {
        Get.snackbar('Error', 'Failed to load products');
      }
    } catch (e) {
      // Xử lý ngoại lệ nếu cần
      Get.snackbar('Error', 'Failed to load products: $e');
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
