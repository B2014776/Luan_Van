import 'package:agri_shop/core/configs/app_images.dart';
import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/core/ui/widget/custom_switch/custom_switch.dart';
import 'package:agri_shop/features/expanded/custom_interface/presentation/controller/custom_interface_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomInterfacePage extends GetView<CustomInterfaceController> {
  const CustomInterfacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100,),
            _themeModeSetting(
                leadingIconUrl:  AppImages.iconCustomInterface1,
                title: 'Chế độ ban đêm',
                activeStateSwitch: controller.switchActive3
            ),
            const SizedBox(height: 10,),
            _themeModeSetting(
                leadingIconUrl:  AppImages.iconCustomInterface2,
                title: 'Màu mặc định',
                listColor: [AppColors.black,AppColors.primary,AppColors.grey,],
                activeStateSwitch: controller.switchActive
            ),
            const SizedBox(height: 10,),
            _themeModeSetting(
                leadingIconUrl:  AppImages.iconCustomInterface2,
                title: 'Các màu khác',
                listColor: [AppColors.primary,AppColors.grey,AppColors.categories,],
                activeStateSwitch: controller.switchActive2
            ),
          ],
        ),
      ),
    );
  }

  Container _themeModeSetting({required String leadingIconUrl,required String title, List<Color> listColor=const[],required RxBool activeStateSwitch }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.containerColors,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.borderColors,
          width: 1, // Độ dày của viền
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  leadingIconUrl,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(width: 15,),
                Column(
                  children: [
                    TextWidget(
                      text: title,
                    ),
                    const SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for(var i = 0;i<listColor.length;i++)
                          Container(
                            margin: const EdgeInsets.only(right: 3),
                            width: 33,
                            height: 15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:  listColor[i]
                            ),
                          ),
                      ],
                    )
                  ],
                )
              ],
            ),
            SwitchCustom(
              onChange: (value){
                activeStateSwitch.value= value;
              },
              activeTrackColor: AppColors.customWitchColors,
              inactiveTrackColor: AppColors.inactiveTrackColor,
              activeThumbColor: AppColors.activeThumbColor,
              inactiveThumbColor: AppColors.inactiveThumbColor,
              switchWidth: 49,
              switchHeight: 24,
              thumbSize: 20,
              borderColor: Colors.transparent,
              isActive: activeStateSwitch, // Bỏ viền bằng cách đặt màu trong suốt
            )
          ],
        ),
      ),
    );
  }
}
