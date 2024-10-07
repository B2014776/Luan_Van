import 'package:get/get.dart';

class ProductController extends GetxController {
  var nameProduct = 'THUỐC TRỪ CỎ TIỀN NẢY MẦM THUỐC'.obs;
  var imageProduct = 'https://i.pinimg.com/736x/b2/76/04/b2760425bccdf602a82479fb74994c7d.jpg'.obs;

  // Danh sách 3 ảnh cho imageDisease
  var imageDisease = [
    'https://i.pinimg.com/564x/a6/f0/84/a6f084277caf9fbc7c1b331f66757fbf.jpg',
    'https://i.pinimg.com/564x/a6/f0/84/a6f084277caf9fbc7c1b331f66757fbf.jpg',
    'https://i.pinimg.com/564x/a6/f0/84/a6f084277caf9fbc7c1b331f66757fbf.jpg'
  ].obs;

  // Các trường mới thêm
  var price = "150.000".obs; // Giá sản phẩm
  var size = '500ml'.obs; // Kích thước
  var ingredients = ['Chất A', 'Chất B', 'Chất C'].obs; // Thành phần
  var uses = 'Diệt cỏ tiền nảy mầm hiệu quả, an toàn cho cây trồng Diệt cỏ tiền nảy mầm hiệu quả, an toàn cho cây trồng Diệt cỏ tiền nảy mầm hiệu quả, an toàn cho cây trồng Diệt cỏ tiền nảy mầm hiệu quả, an toàn cho cây trồng Diệt cỏ tiền nảy mầm hiệu quả, an toàn cho cây trồng Diệt cỏ tiền nảy mầm hiệu quả, an toàn cho cây trồng Diệt cỏ tiền nảy mầm hiệu quả, an toàn cho cây trồng'.obs; // Công dụng
  var dosage = '100ml pha với 20 lít nước, 100ml pha với 20 lít nước, 100ml pha với 20 lít nước. 100ml pha với 20 lít nước, 100ml pha với 20 lít nước, 100ml pha với 20 lít nước. 100ml pha với 20 lít nước, 100ml pha với 20 lít nước, 100ml pha với 20 lít nước. 100ml pha với 20 lít nước, 100ml pha với 20 lít nước, 100ml pha với 20 lít nước'.obs; // Liều lượng
  var quantity = 0.obs; // Số lượng sản phẩm, khởi tạo bằng 0

  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  void updateProduct() {
    // Hàm cập nhật thông tin sản phẩm
  }
}
