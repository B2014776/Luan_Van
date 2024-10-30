import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/text_input/widgets/app_bar/app_bar_widget.dart';
import 'package:agri_shop/features/product/presentation/controller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/ui/text_input/widgets/text/text_widget.dart';



class ProductPage extends GetView<ProductController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // Chiều cao của AppBar
        child: Material(
          elevation: 4, // Độ cao tạo bóng đổ của Material
          shadowColor: Colors.black.withOpacity(0.8), // Màu của bóng đổ
          child: AppBar(
            title: Text(
              'Sản phẩm',
              style: TextStyle(
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
      body: Stack(
        children: [
          _bodyBuild(),
        ],
      ),
    );
  }

  SingleChildScrollView _bodyBuild() {
    return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tên sản phẩm
                Obx(() => TextWidget(
                  text: controller.nameProduct.value,
                  size: 17,
                  color: AppColors.nameProductColors,
                )),
                const SizedBox(height: 10),
                // Hình ảnh sản phẩm trong Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ảnh sản phẩm lớn bên trái
                    Expanded(
                      flex: 1, // Tỷ lệ chiều rộng cho ảnh sản phẩm lớn
                      child: Obx(() => Container(
                        height: 224,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            image: NetworkImage(controller.imageProduct.value),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                    ),
                    const SizedBox(width: 10), // Khoảng cách giữa 2 phần

                    // Cột chứa 3 ảnh nhỏ bên phải
                    Expanded(
                      flex: 1, // Tỷ lệ chiều rộng cho cột chứa ảnh nhỏ
                      child: Column(
                        children: [
                          // Hàng đầu tiên chứa 2 tấm ảnh
                          Row(
                            children: [
                              // Ảnh 1
                              Expanded(
                                child: Obx(() => Container(
                                  height: 100,
                                  margin: const EdgeInsets.only(right: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                      image: NetworkImage(controller.imageDisease[0]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                              ),
                              // Ảnh 2
                              Expanded(
                                child: Obx(() => Container(
                                  height: 100,
                                  margin: const EdgeInsets.only(left: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                      image: NetworkImage(controller.imageDisease[1]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2), // Khoảng cách giữa hai hàng

                          // Hàng thứ hai chứa 1 tấm ảnh
                          Obx(() => Container(
                            height: 122,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                image: NetworkImage(controller.imageDisease[2]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => TextWidget(
                          text: '${controller.price.value} VNĐ', // Đúng cú pháp để hiển thị giá trị của Rx
                          size: 25,
                          color: AppColors.priceDetailProductColors,
                          fontWeight: FontWeight.w400,
                        )),
                        Obx(() => TextWidget(
                          text: controller.size.value,
                          size: 15,
                          color: AppColors.price,
                        )),
                      ],
                    ),
                    Spacer(),
                    Container(
                      // height: 30,
                      // decoration: BoxDecoration(
                      //   border: Border.all( // Tạo viền cho Container
                      //     color: Colors.black, // Màu sắc của viền
                      //     width: 0.5, // Độ dày của viền
                      //   ),
                      //   borderRadius: BorderRadius.circular(5), // Nếu bạn muốn viền có góc bo tròn
                      // ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: InkWell(
                              child: Icon(CupertinoIcons.minus_circle_fill, size: 30, color: AppColors.addIconColors,),
                              onTap: () {
                                controller.decrement(); // Giảm số lượng
                              },
                            ),
                          ),
                          SizedBox(width: 7,),
                          Obx(() => TextWidget(
                            text: '${controller.quantity.value}', // Hiển thị số lượng
                            size: 20,
                            color: AppColors.price,
                          )),
                          SizedBox(width: 7,),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: InkWell(
                              child: Icon(CupertinoIcons.add_circled_solid, size: 30, color: AppColors.minusIconColors,),
                              onTap: () {
                                controller.increment(); // Tăng số lượng
                              },
                            ),
                          ),
                        ],
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 30,),
                TextWidget(
                  text: 'Thành phần',
                  color: AppColors.titleDetailProductColors,
                  size: 16,
                ),
                Obx(() => TextWidget(
                  text: controller.ingredients[0],
                  size: 14,
                  color: AppColors.textDetailProductColors,
                )),
                Obx(() => TextWidget(
                  text: controller.ingredients[1],
                  size: 14,
                  color: AppColors.textDetailProductColors,
                )),
                Obx(() => TextWidget(
                  text: controller.ingredients[2],
                  size: 14,
                  color: AppColors.textDetailProductColors,
                )),
                SizedBox(height: 10,),
                TextWidget(
                  text: 'Công dụng',
                  color: AppColors.titleDetailProductColors,
                  size: 16,
                ),
                Obx(() => TextWidget(
                  text: controller.uses.value,
                  size: 14,
                  color: AppColors.textDetailProductColors,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  showExpandButton: true,
                  wordLimit: 50,
                )),
                SizedBox(height: 10,),
                TextWidget(
                  text: 'Liều lượng',
                  color: AppColors.titleDetailProductColors,
                  size: 16,
                ),
                Obx(() => TextWidget(
                  text: controller.dosage.value,
                  size: 14,
                  color: AppColors.textDetailProductColors,
                )),
              ],
            ),
          ),
        );
  }
}

