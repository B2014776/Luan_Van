import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/submit_button/submit_button.dart';
import 'package:agri_shop/core/ui/text_input/custom_passwordField.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/expanded/change_passwd/presentation/controller/change_passwd_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
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
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120,),
            PasswordFieldWidget(
              title: 'Mật khẩu hiện tại',
              placeholder: '',
              initialValue: '',
              prefixIcon: Icon(CupertinoIcons.lock_circle_fill, size: 20, color: AppColors.iconColors,),
              onChange: (String ) {  },
            ),
            SizedBox(height: 10,),
            PasswordFieldWidget(
              title: 'Mật khẩu mới',
              placeholder: '',
              initialValue: '',
              prefixIcon: Icon(CupertinoIcons.lock_circle_fill, size: 20, color: AppColors.iconColors,),
              onChange: (String ) {  },
            ),
            SizedBox(height: 10,),
            PasswordFieldWidget(
              title: 'Nhập lại mật khẩu',
              placeholder: '',
              initialValue: '',
              prefixIcon: Icon(CupertinoIcons.lock_circle_fill, size: 20, color: AppColors.iconColors,),
              onChange: (String ) {  },
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: '*Mật khẩu mới bao gồm',
                  size: 15,
                  color: AppColors.roleColors,
                ),
                TextWidget(
                  text: 'Từ 7-20 ký tự',
                  size: 13,
                  color: AppColors.roleText,
                ),
                TextWidget(
                  text: 'Ký tự thường (a-z)',
                  size: 13,
                  color: AppColors.roleText,
                ),
                TextWidget(
                  text: 'Ký tự in hoa (A-Z)',
                  size: 13,
                  color: AppColors.roleText,
                ),
                TextWidget(
                  text: 'Chữ số (1-9)',
                  size: 13,
                  color: AppColors.roleText,
                ),
                SizedBox(height: 30,),
                SizedBox(
                  height: 45,
                  child: ButtonWidget(
                    ontap: () {  },
                    text: "Lưu mật khẩu",
                    backgroundColor: AppColors.submitButtonColor,
                    borderRadius: 7,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
