import 'package:agri_shop/core/ui/widget/custom_switch/custom_switch_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SwitchCustom extends StatelessWidget {
  final SwitchController switchController = Get.put(SwitchController());

  final Color activeTrackColor;    // Màu nền khi bật nút
  final Color inactiveTrackColor;  // Màu nền trước khi bật nút
  final Color activeThumbColor;    // Màu nút sau khi bật
  final Color inactiveThumbColor;  // Màu nút trước khi bật
  final Color? borderColor;        // Màu viền của ô, nếu null hoặc transparent thì bỏ viền
  final double switchWidth;        // Chiều rộng của switch
  final double switchHeight;       // Chiều cao của switch
  final double thumbSize;          // Kích thước của nút tròn
  final Function(bool)? onChange;
  RxBool isActive;

  SwitchCustom({
    Key? key,
    this.activeTrackColor = Colors.green,
    this.inactiveTrackColor = Colors.grey,
    this.activeThumbColor = Colors.white,
    this.inactiveThumbColor = Colors.white,
    this.borderColor = Colors.transparent, // Mặc định không có viền
    this.switchWidth = 60.0,
    this.switchHeight = 30.0,
    this.thumbSize = 26.0,
    this.onChange,
    required this.isActive, // Khởi tạo tham số onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool newState = !isActive.value;
        if (onChange != null) {
          onChange!(newState); // Gọi callback với trạng thái mới
        }
      },
      child: Obx(() => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: switchWidth,
        height: switchHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isActive.value
              ? activeTrackColor
              : inactiveTrackColor,
          border: borderColor != null && borderColor != Colors.transparent
              ? Border.all(
            color: borderColor!, // Chỉ thêm viền khi borderColor khác null hoặc transparent
            width: 2.0,
          )
              : null,  // Không có viền
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment:  isActive.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: thumbSize,
                  height: thumbSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:  isActive.value
                        ? activeThumbColor
                        : inactiveThumbColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
