import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../configs/text_size.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText; // Tùy chọn nhập liệu mật khẩu
  final String? value;
  CustomTextField({
    Key? key,
    this.hintText = 'Nhập văn bản', // Gợi ý văn bản mặc định
    this.controller,
    this.obscureText = false, // Không ẩn văn bản nhập mặc định
    this.value

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: controller == null ? value : null,
      obscureText: obscureText,  // Dùng để ẩn văn bản nếu muốn
      cursorColor: Colors.black,  // Dấu nháy màu đen
      style: TextSize.size15,

      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteField,  // Màu nền có độ mờ
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),  // Bo tròn các góc
          borderSide: BorderSide.none,  // Không có viền
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),  // Bo tròn các góc
          borderSide: BorderSide.none,  // Không có viền khi ô không được chọn
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),  // Bo tròn các góc khi ô được chọn
          borderSide: BorderSide.none,  // Không có viền khi ô được chọn
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[700]),  // Màu của hint text
      ),
    );
  }
}
