import 'package:agri_shop/core/configs/app_images.dart';
import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/submit_button/submit_button.dart';
import 'package:agri_shop/core/ui/text_input/custom_datePicker.dart';
import 'package:agri_shop/core/ui/text_input/custom_textfield.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/expanded/breed_introdution/presentation/controller/breed_introdution_controller.dart';
import 'package:agri_shop/features/expanded/edit_profile/presentation/controller/edit_profile_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class BreedIntrodutionPage extends GetView<BreedIntrodutionController> {
  const BreedIntrodutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TextWidget(
          text: 'Kỹ thuật canh tác',
        size: 18,
      ),
        centerTitle: true,
        backgroundColor: AppColors.appbarBackground,
      ),

      body: _buildBody(context),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _buildBody(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(3, 10, 3, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _listItem(
                  'Xoài cát Hòa Lộc',
                  'Quả có hình bầu dục, vỏ mỏng, khi chín chuyển sang màu vàng sáng đẹp mắt. Thịt xoài dày, màu vàng cam, vị ngọt thanh và thơm đặc trưng.',
                  'https://th.bing.com/th/id/OIP.WSfqgAiPj5uc4pebYmgpWwHaFj?rs=1&pid=ImgDetMain'
              ),
              _listItem(
                  'Xoài cát Hòa Lộc',
                  'Quả có hình bầu dục, vỏ mỏng, khi chín chuyển sang màu vàng sáng đẹp mắt. Thịt xoài dày, màu vàng cam, vị ngọt thanh và thơm đặc trưng.',
                  'https://en-media.thebetterindia.com/uploads/2018/05/A-bunch-of-sadabahar-Mangoes-608x811.jpg'
              ),
              _listItem(
                  'Xoài cát Hòa Lộc',
                  'Quả có hình bầu dục, vỏ mỏng, khi chín chuyển sang màu vàng sáng đẹp mắt. Thịt xoài dày, màu vàng cam, vị ngọt thanh và thơm đặc trưng.',
                  'https://th.bing.com/th/id/OIP.-C3txJxh9D2KD2cWi5eifgHaFj?w=800&h=600&rs=1&pid=ImgDetMain'
              ),
              // Các thành phần khác trong Column
            ],
          ),
        ),
      ),
    );
  }

  Container _listItem(String name, String detail, String imageString) {
    return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.blueGrey, width: 0.2)
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: name,
                      size: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 7,),
                    TextWidget(
                      text: detail,
                      color: AppColors.textBreed_introduction,
                    ),
                    SizedBox(height: 7,),
                    Container(
                      width: double.infinity,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(imageString),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            );
  }
}
