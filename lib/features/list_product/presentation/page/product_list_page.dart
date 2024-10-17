import 'package:agri_shop/core/api/model/product_model.dart';
import 'package:agri_shop/core/configs/app_images.dart';
import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/list_product/presentation/controller/product_list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListPage extends GetView<ProductListController> {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Banner image at the top
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
          SizedBox(height: 15),

          // Categories list
          const _categoriesList(),

          // Product grid
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return _buildProductGrid();
              }
            }),
          ),
        ],
      ),
    );
  }

  // Function to get the main image for the product
  ImageProduct getMainImage(List<ImageProduct> listImage) {
    return listImage.firstWhere(
          (image) => image.type == 'main',
      orElse: () => listImage.first, // Default to the first image if no main image
    );
  }

  // Build product grid view
  Widget _buildProductGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: controller.productList.length,
      itemBuilder: (context, index) {
        var product = controller.productList[index];
        var mainImage = getMainImage(product.images); // Get the main image

        return Container(
          decoration: BoxDecoration(
            color: AppColors.listproduct,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(.07),
                blurRadius: 2,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              // Display product image
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Container(
                    width: 90,
                    height: 135,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(3),
                      image: DecorationImage(
                        image: NetworkImage(mainImage.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),

              // Product name
              TextWidget(
                text: product.name,
                wordLimit: 4,
                fontWeight: FontWeight.w500,
                size: 14,
              ),

              // Product price
              TextWidget(
                text: '${product.price} VND',
                fontWeight: FontWeight.w600,
                size: 15,
              ),
              SizedBox(height: 5),

              // Category name or product type
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.containerCategories,
                      ),
                      child: TextWidget(
                        text: 'Category name', // Replace with actual category data if available
                        color: AppColors.containerCategoriesText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(CupertinoIcons.bag_badge_plus, color: Colors.black87),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


// Categories List Widget
class _categoriesList extends StatelessWidget {
  const _categoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategories(AppImages.tatca, 'Tất cả'),
          SizedBox(width: 20),
          _buildCategories(AppImages.nongduoc, 'Nông dược'),
          SizedBox(width: 20),
          _buildCategories(AppImages.phanbon, 'Phân bón'),
          SizedBox(width: 20),
          _buildCategories(AppImages.thuoctrusau, 'Thuốc trừ sâu'),
          SizedBox(width: 20),
          _buildCategories(AppImages.hatgiong, 'Hạt giống'),
        ],
      ),
    );
  }

  // Build each category item
  Container _buildCategories(String ImageString, String name) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.categories,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageString, height: 25, width: 25),
            SizedBox(width: 8),
            TextWidget(
              text: name,
              size: 16,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
