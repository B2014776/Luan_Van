import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/navigation/camera/presentation/controller/camera_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class CameraPage extends GetView<CameraDetectionController> {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CameraDetectionController>(builder: (controller) {
        if (controller.cameraController == null ||
            !controller.cameraController!.value.isInitialized) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            // Camera preview
            Positioned.fill(
              child: CameraPreview(controller.cameraController!),
            ),
            // Các icon chức năng trên màn hình chụp ảnh
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Icon chọn ảnh từ thư viện
                  IconButton(
                    icon: const Icon(CupertinoIcons.film, size: 25, color: Colors.white),
                    onPressed: () async {
                      final imagePath = await controller.pickImage();
                      if (imagePath != null) {
                        _showImageConfirmDialog(imagePath);
                      }
                    },
                  ),
                  // Nút chụp ảnh hình tròn
                  GestureDetector(
                    onTap: () async {
                      final imagePath = await controller.takePicture();
                      if (imagePath != null) {
                        _showImageConfirmDialog(imagePath);
                      }
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: const Icon(CupertinoIcons.camera_viewfinder, color: Colors.white, size: 32),
                    ),
                  ),
                  // Icon mở trang hướng dẫn
                  IconButton(
                    icon: const Icon(CupertinoIcons.question_square, size: 30, color: Colors.white),
                    onPressed: () {
                      Get.to(() => GuidePage());
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  // Hàm hiển thị modal xác nhận ảnh
  void _showImageConfirmDialog(String imagePath) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: TextWidget(text: 'Bạn có chắc muốn chọn ảnh này?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.file(
                File(imagePath),
                width: MediaQuery.of(context).size.width, // Full width
                fit: BoxFit.cover, // Điều chỉnh cách hiển thị ảnh
                height: 300, // Chiều cao cố định
              ),
              const SizedBox(height: 20),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.error, // Nền màu đỏ cho nút "Quay lại"
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center( // Đảm bảo nội dung nằm giữa container
                      child: TextWidget(
                        text: 'Quay lại',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center, // Căn giữa văn bản theo chiều ngang
                      ),
                    ),
                  ),
                ),
                // Nút "Chọn ảnh" với nền màu xanh lá
                InkWell(
                  onTap: () {
                    // Hành động chọn ảnh
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green, // Màu nền xanh lá cho nút "Chọn ảnh"
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center( // Đảm bảo nội dung nằm giữa container
                      child: TextWidget(
                        text: 'Chọn ảnh',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

}

class GuidePage extends StatelessWidget {
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
              'Hướng dẫn chụp ảnh',
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
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(8, 10, 8, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage('assets/Images/meochupanh2.jpg'), fit: BoxFit.cover)
                ),
              ),
              SizedBox(height: 10,),
              TextWidget(
                  text: "Khoảng cách",
                size: 16,
              ),
              SizedBox(height: 5,),
              TextWidget(
                  text: 'Đến gần cây trồng và đảm bảo điều chỉnh cây trồng hoặc sâu bệnh hại ở trong khung hình',
                color: Colors.grey,
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage('assets/Images/meochupanh1.jpg'), fit: BoxFit.cover)
                ),
              ),
              SizedBox(height: 10,),
              TextWidget(
                text: "Ánh sáng",
                size: 16,
              ),
              SizedBox(height: 5,),
              TextWidget(
                text: 'Đảm bảo có thể nhìn thấy rõ cây trồng và ánh sáng không quá tối hay quá sáng',
                color: Colors.grey,
              )
            ],
          ),
        ),
      )
    );
  }
}
