import 'dart:convert';

import 'package:agri_shop/core/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductListController extends GetxController {
  var products = <ProductModel>[].obs;
  var filteredProducts = <ProductModel>[].obs; // Danh sách sản phẩm sau khi lọc
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse('http://api-luan-v1.onrender.com/api/v1/products/'));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Lấy danh sách sản phẩm từ thuộc tính 'results'
        if (jsonResponse['results'] is List) {
          List<dynamic> results = jsonResponse['results'];
          products.value = results.map<ProductModel>((product) => ProductModel.fromJson(product)).toList();
          filteredProducts.value = products; // Hiển thị tất cả sản phẩm ban đầu
        } else {
          Get.snackbar('Error', 'Invalid response format');
        }
      } else {
        Get.snackbar('Error', 'Failed to load products');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Phương thức để lọc sản phẩm theo loại sản phẩm
  void filterProductsByType(String productType) {
    if (productType == 'Tất cả sản phẩm') {
      filteredProducts.value = products;
    } else {
      filteredProducts.value = products.where((product) => product.productType == productType).toList();
    }
  }
}

