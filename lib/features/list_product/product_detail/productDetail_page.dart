import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/model/product_model.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;
  final RxInt quantity = 1.obs;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // Chiều cao của AppBar
        child: Material(
          elevation: 4, // Độ cao tạo bóng đổ của Material
          shadowColor: Colors.black.withOpacity(0.8), // Màu của bóng đổ
          child: AppBar(
            title: const Text(
              'Sản phẩm',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: const Color(0xff192116)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: const Radius.circular(20),
                        bottomRight: const Radius.circular(20))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      text: product.name,
                      size: 17,
                      color: const Color(0xff051F4F),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Container(
                            width: 150,
                            height: 220,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  product.images.first.image,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        // Hiển thị tất cả hình ảnh phụ
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // Căn giữa các hình ảnh
                          children: [
                            for (int i = 1;
                                i < product.images.length;
                                i++) // Bỏ qua hình chính
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 2),
                                // Khoảng cách giữa các hình ảnh
                                child: Container(
                                  width: 120,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        product.images[i].image,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Hiển thị giá sản phẩm
              TextWidget(
                text: '${product.price} VNĐ',
                // Đúng cú pháp để hiển thị giá trị của Rx
                size: 25,
                color: const Color(0xffC7C8C6),
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextWidget(
                      text: "${product.productType}",
                      size: 16,
                      color: const Color(0xffC7C8C6),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                        ),
                    child: TextWidget(
                      text: 'Số lượng: ${product.stock}',
                      size: 16,
                      color: const Color(0xffC7C8C6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Hiển thị mô tả sản phẩm
              TextWidget(
                text: product.description,
                size: 15,
                color: const Color(0xffC7C8C6),
              ),
              const SizedBox(height: 8),
              TextWidget(
                text: 'Thành phần hóa học: ',
                size: 16,
                color: const Color(0xffC7C8C6),
              ),
              const SizedBox(height: 8),
              // Hiển thị thành phần hóa học
              TextWidget(
                text: product.chemicalComposition,
                size: 15,
                color: const Color(0xffC7C8C6),
              ),
              const SizedBox(height: 8),
              TextWidget(
                text: 'Hướng dẫn sử dụng: ',
                size: 16,
                color: const Color(0xffC7C8C6),
              ),
              const SizedBox(height: 8),
              // Hiển thị hướng dẫn an toàn
              TextWidget(
                text: '${product.safetyInstructions}',
                size: 15,
                color: const Color(0xffC7C8C6),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(5.0), // Góc trái trên
                    bottomLeft: const Radius.circular(5.0), // Góc trái dưới
                  ),
                  color: const Color(0xff43a583),
                ),
                child: Row(
                  children: [
                    InkWell(
                      child: const Icon(Icons.remove, color: Colors.white, size: 18),
                      onTap: () {
                        if (quantity.value > 1) {
                          quantity.value--;
                        }
                      },
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                      child: Obx(() => TextWidget(
                            text: '${quantity.value}',
                            size: 20,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      child: const Icon(Icons.add, color: Colors.white, size: 18),
                      onTap: () {
                        quantity.value++;
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                // Sử dụng Expanded để mở rộng Container này chiếm toàn bộ không gian còn lại
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: const Radius.circular(5.0), // Góc phải trên
                      bottomRight: const Radius.circular(5.0), // Góc phải dưới
                    ),
                    color: const Color(0xFF003346),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: TextWidget(
                        text: 'Thêm vào giỏ hàng',
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
