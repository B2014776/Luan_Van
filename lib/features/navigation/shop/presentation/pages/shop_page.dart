import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/navigation/blogs/presentation/controller/blogs_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/configs/themes/app_colors.dart';
import '../../../../../core/ui/text_input/widgets/app_bar/app_bar_widget.dart';

class ShopPage extends GetView<BlogsController> {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundImage: 'assets/Images/background_login2.jpg', // Đường dẫn hình ảnh nền AppBar
        logo: Image.asset(
          'assets/Images/Plant.png', // Đường dẫn logo
          height: 120,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Xử lý sự kiện khi nhấn vào nút thông báo
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: AppColors.backgroundColors),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _buildItem(
                  ImageAsset:
                  'https://i.pinimg.com/736x/be/22/c4/be22c4323a5656b7ae47d24877714c14.jpg',
                  name: 'THUỐC TRỪ CỎ TIỀN NẢY MẦM WEEDER 300',
                  price: '100.000',
                ),
                SizedBox(height: 10,),
                _buildItem(
                  ImageAsset:
                  'https://i.pinimg.com/736x/be/22/c4/be22c4323a5656b7ae47d24877714c14.jpg',
                  name: 'THUỐC TRỪ CỎ TIỀN NẢY MẦM WEEDER 300',
                  price: '100.000',
                ),
                SizedBox(height: 10,),
                _buildItem(
                  ImageAsset:
                  'https://i.pinimg.com/736x/be/22/c4/be22c4323a5656b7ae47d24877714c14.jpg',
                  name: 'THUỐC TRỪ CỎ TIỀN NẢY MẦM WEEDER 300',
                  price: '100.000',
                ),
                SizedBox(height: 10,),
                _buildItem(
                  ImageAsset:
                  'https://i.pinimg.com/736x/be/22/c4/be22c4323a5656b7ae47d24877714c14.jpg',
                  name: 'THUỐC TRỪ CỎ TIỀN NẢY MẦM WEEDER 300',
                  price: '100.000',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildItem({
    required String ImageAsset,
    required String name,
    required String price,
  }) {
    // Sử dụng biến `quantity` để quản lý số lượng sản phẩm
    final RxInt quantity = 1.obs;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cartItemColors,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Màu của bóng đổ
            spreadRadius: 2, // Độ lan tỏa của bóng
            blurRadius: 5, // Độ mờ của bóng
            offset: Offset(0, 3), // Vị trí của bóng (x, y)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  CupertinoIcons.checkmark_alt_circle,
                  size: 20,
                ),
                Icon(
                  CupertinoIcons.xmark,
                  size: 20,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 114,
                  height: 117,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(ImageAsset),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: name,
                        size: 14,
                        color: AppColors.nameProductColors,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: '$price VND',
                        color: AppColors.cartPrice,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Thêm Row để hiện số lượng sản phẩm
                      Obx(
                            () => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                // Giảm số lượng nhưng không cho phép nhỏ hơn 1
                                if (quantity.value > 1) {
                                  quantity.value--;
                                }
                              },
                              child: Icon(CupertinoIcons.minus_circle,
                                  color: Colors.red),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              '${quantity.value}', // Hiển thị số lượng hiện tại
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.nameProductColors,
                              ),
                            ),
                            SizedBox(width: 15,),
                            InkWell(
                              onTap: () {
                                // Tăng số lượng
                                quantity.value++;
                              },
                              child: Icon(CupertinoIcons.add_circled,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
