import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/list_product/presentation/controller/product_list_controller.dart';
import 'package:agri_shop/features/list_product/product_detail/productDetail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListPage extends StatelessWidget {
  final ProductListController controller = Get.put(ProductListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Images/banner.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.filterProductsByType('Tất cả sản phẩm'); // Gọi phương thức lọc
                  },
                  child: _buildCategoryContainer(
                    text: 'Tất cả sản phẩm',
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    controller.filterProductsByType('Nông dược'); // Gọi phương thức lọc
                  },
                  child: _buildCategoryContainer(
                    text: 'Nông dược',
                    color: Colors.orangeAccent,
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    controller.filterProductsByType('Hữu cơ sinh học'); // Gọi phương thức lọc
                  },
                  child: _buildCategoryContainer(
                    text: 'Hữu cơ sinh học',
                    color: Colors.pinkAccent,
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    controller.filterProductsByType('Phân bón'); // Gọi phương thức lọc
                  },
                  child: _buildCategoryContainer(
                    text: 'Phân bón',
                    color: Colors.lightGreen,
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                // Lọc sản phẩm theo selectedProductType
                final filteredProducts = controller.filteredProducts;

                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(), // Ngăn chặn cuộn trong GridView
                  shrinkWrap: true, // Cho phép GridView sử dụng chiều cao phù hợp
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Số cột trong grid
                    childAspectRatio: 0.8, // Tỉ lệ khung hình của mỗi ô
                    crossAxisSpacing: 16, // Khoảng cách giữa các cột
                    mainAxisSpacing: 16, // Khoảng cách giữa các hàng
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    final mainImage = product.images
                        .firstWhere((image) => image.type == 'main')
                        .image;

                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetailPage(product: product));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image.network(
                                mainImage,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 60,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: product.name,
                                    fontWeight: FontWeight.w500,
                                    size: 12,
                                    wordLimit: 5,
                                  ),
                                  SizedBox(height: 4),
                                  TextWidget(
                                    text: '${product.price} VNĐ',
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.lightGreen.withOpacity(0.7),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: TextWidget(
                                          text: "${product.productType}",
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(CupertinoIcons.cart_badge_plus, size: 25)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // Hàm tiện ích để xây dựng container danh mục
  Widget _buildCategoryContainer({required String text, required Color color}) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 9, 5, 5),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color.withOpacity(0.2), // Màu với độ trong suốt
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Màu bóng
            offset: Offset(2, 2), // Vị trí bóng
            blurRadius: 7, // Độ mờ của bóng
          ),
        ],
      ),
      alignment: Alignment.center,
      child: TextWidget(
        text: text,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
