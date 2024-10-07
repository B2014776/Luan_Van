import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(), // Thêm vòng tròn xoay loading
          const SizedBox(height: 10), // Khoảng cách giữa vòng xoay và text
          TextWidget(text: "Loading..."), // Hiển thị thông báo loading
        ],
      ),
    );
  }
}
