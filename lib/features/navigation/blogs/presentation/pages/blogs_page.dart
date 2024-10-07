import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/navigation/blogs/presentation/controller/blogs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogsPage extends GetView<BlogsController> {
  const BlogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Center(
          child: TextWidget(text: "blogs page"),
        ),
      ),
    );
  }
}
