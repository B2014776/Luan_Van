
import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final String? title;
  final List<Widget>? actions;
  final String? backgroundImage;
  final VoidCallback? onTapIconAction;
  final Widget? leading;
  final bool? centerTitle;
  final VoidCallback? callbackLeading;
  final Color titleColor;
  final Widget? logo; // Thêm biến để chứa logo

  const AppBarWidget({
    super.key,
    this.height = 80, // Điều chỉnh chiều cao AppBar nếu cần
    this.title,
    this.actions,
    this.backgroundImage,
    this.onTapIconAction,
    this.leading,
    this.centerTitle = false,
    this.titleColor = Colors.black,
    this.callbackLeading,
    this.logo, // Nhận widget logo
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              image: backgroundImage != null
                  ? DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: AppBar(
              backgroundColor: AppColors.appbarColors,
              elevation: 0.0,
              centerTitle: centerTitle,
              title: logo != null
                  ? Center(child: logo) // Đặt logo ở giữa
                  : title != null
                  ? Text(
                title!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18, // Sử dụng kích thước chữ cố định
                  color: titleColor,
                ),
              )
                  : const SizedBox.shrink(),
              titleSpacing: 0.0,
              leading: leading ??
                  InkWell(
                    onTap: callbackLeading ?? () => Get.back(),
                    child: const Icon(
                      CupertinoIcons.list_bullet,
                      color: Colors.white,
                    ),
                  ),
              actions: actions ?? [],
            ),
          ),
          // Positioned(
          //     left: 0,
          //     right: 0,
          //     child:
          //     Align(
          //       alignment: Alignment.center, // Căn giữa theo chiều ngang của Stack
          //       child: Container(
          //         width: 150,
          //         height: 100,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(50), // Bo tròn vừa phải
          //           color: AppColors.white,
          //         ),
          //       ),
          //     ),)
        ],
      ),
    );
  }
}


