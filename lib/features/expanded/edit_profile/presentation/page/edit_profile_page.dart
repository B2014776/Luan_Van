import 'package:agri_shop/core/configs/app_images.dart';
import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/submit_button/submit_button.dart';
import 'package:agri_shop/core/ui/text_input/custom_datePicker.dart';
import 'package:agri_shop/core/ui/text_input/custom_textfield.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
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
      body: _buildBody(context),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _buildBody(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80,),
              Stack(
                children: [
                  Container(
                    width: 100, // Kích thước chiều rộng
                    height: 100, // Kích thước chiều cao
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Định dạng hình tròn
                      border: Border.all(
                        color: AppColors.primary, // Màu viền
                        width: 1, // Độ dày của viền
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(AppImages.hatgiong),
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
                        child: Icon(
                          CupertinoIcons.camera_fill,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                  width: double.infinity, // Đảm bảo chiếm toàn bộ chiều rộng
                  child: TextFieldWidget(
                    title: 'Họ và tên',
                    placeholder: 'Nhập họ và tên', initialValue: '',
                    onChange: (String ) {  },
                  )
              ),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Giới tính',
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10,),
                  Obx(
                        () => CustomDropDown(selectedValue: controller.selectedValue),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              SizedBox(
                  width: double.infinity, // Đảm bảo chiếm toàn bộ chiều rộng
                  child: TextFieldWidget(
                    title: 'Số điện thoại',
                    placeholder: 'Nhập họ số điện thoại', initialValue: '',
                    onChange: (String ) {  },
                  )
              ),
              SizedBox(height: 10,),
              SizedBox(
                  width: double.infinity, // Đảm bảo chiếm toàn bộ chiều rộng
                  child: TextFieldWidget(
                    isRequired: false,
                    title: 'Email',
                    placeholder: 'Nhập Email', initialValue: '',
                    onChange: (String ) {  },
                  )
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: double.infinity, // Đảm bảo chiếm toàn bộ chiều rộng
                child: CustomDatePicker(
                  isRequired: false,
                  title: 'Ngày sinh',
                  placeholder: 'dd-MM-yyyy',
                  date: DateTime.now(), // Ngày mặc định
                  onChange: (DateTime? newDate) {
                    print('Ngày đã chọn: $newDate');
                  },
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                  width: double.infinity, // Đảm bảo chiếm toàn bộ chiều rộng
                  child: TextFieldWidget(
                    title: 'Địa chỉ',
                    placeholder: 'Nhập địa chỉ', initialValue: '',
                    onChange: (String ) {  },
                  )
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 45,
                child: ButtonWidget(
                  ontap: () {  },
                  text: "Lưu thông tin",
                  backgroundColor: AppColors.primary,
                  borderRadius: 5,
                ),
              )
              // Các thành phần khác trong Column
            ],
          ),
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
          padding: EdgeInsets.all(20),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chọn ảnh từ:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Thư viện'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Máy ảnh'),
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
          // Điều chỉnh căn chỉnh nội dung trong ô button
          alignment: Alignment.centerLeft,
          // padding: const EdgeInsets.symmetric(horizontal: 16),
          buttonStyleData: ButtonStyleData(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.zero, // Đặt padding của menu item về 0
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 16), // Căn chỉnh lại nội dung trong dropdown item
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
      // TODO: Thực hiện hành động khi chọn ảnh xong, ví dụ: cập nhật state hoặc controller
      print('Đường dẫn ảnh: ${image.path}');
    }
  }
}
