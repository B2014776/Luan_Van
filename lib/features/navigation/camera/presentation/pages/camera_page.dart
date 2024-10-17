import 'package:agri_shop/features/navigation/camera/presentation/controller/camera_controller.dart';
import 'package:camera/camera.dart';
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

        return Column(
          children: [
            Expanded(
              child: CameraPreview(controller.cameraController!),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Icon chọn ảnh từ thư viện
                  IconButton(
                    icon: const Icon(Icons.image, size: 40),
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
                        color: Colors.blue,
                      ),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 40),
                    ),
                  ),
                  // Icon mở trang hướng dẫn
                  IconButton(
                    icon: const Icon(Icons.help_outline, size: 40),
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
          title: const Text('Xác nhận ảnh'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.file(
                File(imagePath),
                fit: BoxFit.cover,
                height: 300,
              ),
              const SizedBox(height: 20),
              Text('Đường dẫn ảnh: $imagePath'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Xác nhận ảnh
                Get.snackbar('Xác nhận', 'Đã chọn ảnh: $imagePath');
                Get.back(); // Đóng modal
              },
              child: const Text('Xác nhận'),
            ),
            ElevatedButton(
              onPressed: () {
                // Đóng modal để chụp lại
                Get.back();
              },
              child: const Text('Chụp lại'),
            ),
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
      appBar: AppBar(
        title: const Text('Hướng dẫn chụp ảnh'),
      ),
      body: const Center(
        child: Text('Đây là trang hướng dẫn chụp ảnh.'),
      ),
    );
  }
}
