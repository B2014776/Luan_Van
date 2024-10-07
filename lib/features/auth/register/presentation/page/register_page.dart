import 'package:agri_shop/core/configs/app_images.dart';
import 'package:agri_shop/core/routers/routes.dart';
import 'package:agri_shop/core/ui/submit_button/submit_button.dart';
import 'package:agri_shop/core/ui/text_input/custom_datePicker.dart';
import 'package:agri_shop/core/ui/text_input/custom_textfield.dart';
import 'package:agri_shop/core/ui/text_input/gender_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/configs/text_size.dart';
import '../../../../../core/configs/themes/app_colors.dart';
import '../../../../../core/ui/text_input/custom_passwordField.dart';
import '../../../../../core/ui/text_input/textField_login.dart';
import '../../../../../core/ui/text_input/widgets/text/text_widget.dart';
import '../controller/register_controller.dart';
import 'package:intl/intl.dart';


class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.isLoading.value ?  Center(child: TextWidget(text: "Loading..."),): _BuildBodyRegisterPage(),
    );
  }



  Stack _BuildBodyRegisterPage() {
    return Stack(
      children: [
        Opacity(
          opacity: 1, // Điều chỉnh độ mờ ở đây (giá trị từ 0.0 đến 1.0)
          child: Image.asset(
            AppImages.background,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 100, 0, 0),
          child: Text(
            'Đăng ký',
            style: GoogleFonts.abhayaLibre(
              fontSize: 40,
              color: AppColors.titleColors,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 150, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:0,),

                SizedBox(height: 30,),
                TextFieldWidget(
                    title: "",
                    placeholder: "Tên tài khoản",
                    initialValue: "",
                    onChange: (String){
                      controller.userModel.username=String;
                    }
                ),
                SizedBox(height: 10,),
                Obx(
                      () => CustomDropDown(selectedValue: controller.selectedValue),
                ),
                TextFieldWidget(
                    title: "",
                    placeholder: "Email",
                    initialValue: "",
                    onChange: (String){
                      controller.userModel.email=String;
                    }
                ),
                TextFieldWidget(
                    title: "",
                    placeholder: "Số điện thoại",
                    initialValue: "",
                    onChange: (String){
                      controller.userModel.phone=String;
                    }
                ),
                SizedBox(height: 10,),
                CustomDatePicker(
                  isRequired: false,
                  title: 'Ngày sinh',
                  placeholder: 'dd-MM-yyyy',
                  date: DateTime.now(), // Ngày mặc định
                  onChange: (DateTime? newDate) {
                    if (newDate != null) {
                      // Chuyển đổi DateTime thành chuỗi theo định dạng yyyy-MM-dd
                      controller.userModel.birthday = DateFormat('yyyy-MM-dd').format(newDate);
                    } else {
                      // Xử lý trường hợp không có ngày tháng (nếu cần)
                      controller.userModel.birthday = ''; // Hoặc giá trị mặc định khác
                    }
                  },
                ),
                PasswordFieldWidget(
                    title: "",
                    placeholder: "Mật khẩu",
                    initialValue: "",
                    onChange: (String){
                      controller.userModel.password=String;
                    }
                ),
                SizedBox(height: 10,),
                PasswordFieldWidget(
                    title: "",
                    placeholder: "Nhập lại mật khẩu ",
                    initialValue: "",
                    onChange: (String){
                      controller.userModel.password2=String;
                    }
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 45,
                    child: ButtonWidget(
                        ontap: ()async {
                        await controller.handleLogin();
                        },
                        text: "Đăng nhập")
                ),

                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'you have an account?',
                      style:
                      TextStyle(
                          fontSize: 16,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: (){Get.toNamed(Routes.login);},
                      child: Text(
                        'Login',
                        style:
                        TextStyle(
                            fontSize: 16,
                            color: Colors.orange
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0,),
                // Center(child: Text('-----------Or----------',style: TextStyle(fontSize: 18, color: Colors.white),)),

              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget CustomDropDown({required RxString selectedValue}) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: TextWidget(text: selectedValue.value),
          items:  [
            DropdownMenuItem(
              value: "M",
              child: TextWidget(text: "Nam"),
            ),
            DropdownMenuItem(
              value: "F",
              child: TextWidget(text: "Nữ"),
            ),
            DropdownMenuItem(
              value: "Khác",
              child: TextWidget(text: "Khác"),
            ),
          ],
          value: selectedValue.value,
          onChanged: (String? value) {
            selectedValue.value = value ?? "M";
          },
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
}
