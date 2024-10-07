import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/navigation/camera/presentation/controller/camera_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraPage extends GetView<CameraController> {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Center(
          child: TextWidget(text: "camera"),
        ),
      ),
    );
  }
}
