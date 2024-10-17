import 'package:agri_shop/core/configs/app_images.dart';
import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/routers/routes.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/navigation/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/ui/loading.dart';


class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(
            () => controller.isLoading.value
            ? Loading()
            : _BuildBody(),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _BuildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _infoBuild(),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 50, 15, 0),
            child: _buildCardItems(),
          ),
        ],
      ),
    );
  }

  Container _buildCardItems() {
    return Container(
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Get.toNamed(Routes.editProfile);
                },
                  child: rowItems(iconUrl: AppImages.editProfile, title: 'Chỉnh sửa thông tin cá nhân')),
              SizedBox(height: 40),
              InkWell(
                onTap: (){
                  Get.toNamed(Routes.changePasswd);
                },
                  child: rowItems(iconUrl: AppImages.changePassword, title: 'Thay đổi mật khẩu')),
              SizedBox(height: 40),
              InkWell(
                onTap: (){
                  Get.toNamed(Routes.customInterface);
                },
                  child: rowItems(iconUrl: AppImages.customInterface, title: 'Chỉnh sửa giao diện')),
              SizedBox(height: 40),
              InkWell(
                  onTap: (){
                    controller.logOut();
                  },
                  child: rowItems(iconUrl: AppImages.logOut, title: 'Đăng xuất')),
            ],
          ),
        );
  }

  Container _infoBuild() {
    return Container(
          decoration: BoxDecoration(
            color: AppColors.containerProfileColors.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
          ),

          child: Padding(padding: EdgeInsets.fromLTRB(10, 100, 10, 20),

            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/564x/65/34/31/65343138ab6a6bdc59936725a38b0039.jpg'
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: controller.profileValue?["username"]??"username",
                        size: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 5,),
                      TextWidget(
                          text: controller.profileValue?["email"]??"email@gmail.com",
                        size: 13,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
  Widget rowItems({required String iconUrl,required String title, String toPag=" "}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              iconUrl,
              height: 25,
              width: 25,
            ),
            SizedBox(width: 15,),
            TextWidget(
              text: title,
              size: 15,
            )
          ],
        ),
        Icon(CupertinoIcons.chevron_forward, size: 20,)
      ],
    );
  }
}
