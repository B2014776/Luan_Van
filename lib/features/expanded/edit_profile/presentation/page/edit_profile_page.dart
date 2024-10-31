import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/loading.dart';
import 'package:agri_shop/core/ui/submit_button/submit_button.dart';
import 'package:agri_shop/core/ui/text_input/custom_datePicker.dart';
import 'package:agri_shop/core/ui/text_input/custom_textfield.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/core/ui/widget/avatar/avatar.dart';
import 'package:agri_shop/features/expanded/edit_profile/presentation/controller/edit_profile_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.isLoading.value
            ? const Loading()
            : _buildBody(context);
      }),
    );
  }

  // inside EditProfilePage
  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<EditProfileController>(
        id: "updateForm",
        builder: (_) => Stack(
          children: [
            Positioned(
              top: 50,
              left: 20,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 1,
                          ),
                        ),
                        child: AvatarWidget(
                          radius: 50,
                          url: controller.myInfoResponseModel.value.avatar,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => _showImageSourceModal(context),
                          child: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.5),
                            radius: 13,
                            child: const Icon(
                              CupertinoIcons.camera_fill,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: TextFieldWidget(
                      title: 'First name',
                      placeholder: '....',
                      initialValue:
                          controller.myInfoResponseModel.value.firstName,
                      onChange: (String value) {
                        controller.name.value = value;
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextFieldWidget(
                      title: 'Last name',
                      placeholder: '....',
                      initialValue:
                          controller.myInfoResponseModel.value.lastName,
                      onChange: (String value) {
                        controller.name.value = value;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Giới tính',
                        size: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => CustomDropDown(
                          selectedValue: controller.selectedValue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: TextFieldWidget(
                      title: 'Số điện thoại',
                      placeholder: 'Nhập số điện thoại',
                      initialValue: controller.myInfoResponseModel.value.phone,
                      onChange: (String value) {
                        controller.phone.value = value;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: TextFieldWidget(
                      isRequired: false,
                      title: 'Email',
                      placeholder: 'Nhập Email',
                      initialValue: controller.myInfoResponseModel.value.email,
                      onChange: (String value) {
                        controller.email.value = value;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: CustomDatePicker(
                      isRequired: false,
                      title: 'Ngày sinh',
                      placeholder: 'dd-MM-yyyy',
                      date: DateTime.tryParse(controller
                              .myInfoResponseModel.value.birthday
                              .toString()) ??
                          DateTime.now(),
                      onChange: (DateTime? newDate) {
                        controller.birthday.value = newDate?.toString() ?? '';
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 45,
                    child: ButtonWidget(
                      padding: const EdgeInsets.all(10),
                      ontap: () async {
                        await controller.handleSubmit();
                      },
                      text: "Lưu thông tin",
                      backgroundColor: AppColors.primary,
                      borderRadius: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm hiển thị ModalBottomSheet để chọn nguồn ảnh
  void _showImageSourceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chọn ảnh từ:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Thư viện'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Máy ảnh'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget CustomDropDown({required RxString selectedValue}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: CupertinoColors.systemGrey, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: TextWidget(text: selectedValue.value),
          items: [
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
          alignment: Alignment.centerLeft,
          buttonStyleData: ButtonStyleData(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          dropdownStyleData: const DropdownStyleData(
            padding: EdgeInsets.zero, // Đặt padding của menu item về 0
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.symmetric(
                horizontal: 16), // Căn chỉnh lại nội dung trong dropdown item
          ),
        ),
      ),
    );
  }

  // Hàm chọn ảnh từ thư viện hoặc camera
  void _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      print('Đường dẫn ảnh: ${image.path}');
    }
  }
}
