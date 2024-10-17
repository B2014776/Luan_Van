import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/detection/presentation/controller/detection_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DetectionPage extends GetView<DetectionController> {
  const DetectionPage({super.key});

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
              'Nhận diện sâu bệnh',
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
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                text: 'Sâu cuốn lá',
              color: AppColors.detectionNameColors,
              size: 17,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 5,),
            TextWidget(
                text: 'Cnaphalocrocis medinalis',
              color: AppColors.detectionScienceNameColors,
            ),
            SizedBox(height: 10,),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage('https://globalcheck.com.vn/apt-upload/image/data/seo/sau-cuon-la-(1).jpg'),
                  fit: BoxFit.cover, // Điều chỉnh cách ảnh hiển thị (cover, contain, etc.)
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextWidget(
                text: '1. Triệu chứng',
              color: AppColors.detectionNameColors,
              size: 16,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
                text: 'Lá bị cuốn lại và chỉ còn màng trắng. Làm giảm khả năng của cây lúa, nếu nặng có thể gay tất thu nghiêm trọng',
            ),
            SizedBox(height: 10,),
            TextWidget(
              text: '2. Cách nhận biết',
              color: AppColors.detectionNameColors,
              size: 16,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
              text: 'Lá bị cuốn lại và chỉ còn màng trắng. Làm giảm khả năng của cây lúa, nếu nặng có thể gay tất thu nghiêm trọng',
            ),
            SizedBox(height: 10,),
            TextWidget(
              text: '3. Nguyên nhân',
              color: AppColors.detectionNameColors,
              size: 16,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
              text: 'Lá bị cuốn lại và chỉ còn màng trắng. Làm giảm khả năng của cây lúa, nếu nặng có thể gay tất thu nghiêm trọng',
            ),
            SizedBox(height: 10,),
            TextWidget(
              text: '4. Cách điều trị',
              color: AppColors.detectionNameColors,
              size: 16,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
              text: 'Lá bị cuốn lại và chỉ còn màng trắng. Làm giảm khả năng của cây lúa, nếu nặng có thể gay tất thu nghiêm trọng. Lá bị cuốn lại và chỉ còn màng trắng. Làm giảm khả năng của cây lúa, nếu nặng có thể gay tất thu nghiêm trọng. Lá bị cuốn lại và chỉ còn màng trắng. Làm giảm khả năng của cây lúa, nếu nặng có thể gay tất thu nghiêm trọng. v',
            ),
          ],
        ),
      ),
    );
  }
}
