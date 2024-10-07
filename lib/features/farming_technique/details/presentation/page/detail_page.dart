import 'package:agri_shop/core/configs/app_images.dart';
import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/text_input/widgets/app_bar/app_bar_widget.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/farming_technique/presentation/controller/farmingtechnique_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailPage> {
  const DetailPage({super.key});

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
              'Kỹ thuật canh tác',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundFarmTechniqueColors,
            ),
          ),
          _buildBody(context)
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://i.pinimg.com/564x/d6/d5/7f/d6d57ff699673cb67fd5e2cc37b8dc4d.jpg',
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(height: 10),
            TextWidget(
              text: 'Cà chua',
              size: 18,
              color: AppColors.nameVegetable,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
              text: 'Solanum lycopersicum',
            ),
            const SizedBox(height: 100),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildDetailContainer(
                        imagePath: AppImages.IconDetail1,
                        title: 'Giới thiệu giống',
                      ),
                    ),
                    const SizedBox(width: 10), // Khoảng cách giữa các Container
                    Expanded(
                      child: _buildDetailContainer(
                        imagePath: AppImages.IconDetail2,
                        title: 'Nhân giống',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildDetailContainer(
                        imagePath: AppImages.IconDetail4,
                        title: 'Chăm sóc cây',
                      ),
                    ),
                    const SizedBox(width: 10), // Khoảng cách giữa các Container
                    Expanded(
                      child: _buildDetailContainer(
                        imagePath: AppImages.IconDetail3,
                        title: 'Trồng cây',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailContainer({required String imagePath, required String title}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.ContainerDetailColors,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 5),
            TextWidget(
              text: title,
              color: AppColors.titleDetailColors,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
