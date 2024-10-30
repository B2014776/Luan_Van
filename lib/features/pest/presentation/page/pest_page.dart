import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/routers/routes.dart';
import 'package:agri_shop/core/ui/text_input/widgets/app_bar/app_bar_widget.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PestPage extends GetView<PestPage> {
  const PestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // Chiều cao của AppBar
        child: Material(
          elevation: 4, // Độ cao tạo bóng đổ của Material
          shadowColor: Colors.black.withOpacity(0.8), // Màu của bóng đổ
          child: AppBar(
            title: Text(
              'Sâu bệnh hại',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundFarmTechniqueColors,
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
            InkWell(
              onTap: (){
                Get.toNamed(Routes.pestDetail);
              },
              child: _vegetableItem(
                  ImageNetwork: 'https://i.pinimg.com/736x/f9/ad/7d/f9ad7dea9c8d56c81e0fc4fee7ed9c17.jpg',
                  title: 'Ong bầu',
                  scientificName: 'Solanum lycopersicum'
              ),
            ),
            SizedBox(height: 10,),
            _vegetableItem(
                ImageNetwork: 'https://i.pinimg.com/564x/e7/6c/1a/e76c1a6701a4788b11d2bcd0fd82a3a3.jpg',
                title: 'Ốc sên',
                scientificName: 'Psidium guayava'
            ),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }

  Container _vegetableItem({ required String ImageNetwork, required String title, required String scientificName}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.containerItemFarmTechniqueColors,
        border: Border.all(
          color: AppColors.borderColorsFarmTechnique,
          width: 0.3,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          // BoxShadow(
          //   color: Colors.blueGrey.withOpacity(0.5), // Màu sắc của shadow với độ mờ
          //   spreadRadius: 1, // Độ lan của shadow
          //   blurRadius: 5,   // Độ mờ của shadow
          //   offset: Offset(3, 3), // Độ lệch của shadow (trục x, y)
          // ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 15, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(ImageNetwork),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: title,
                      color: Colors.black87,
                      size: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 1,),
                    TextWidget(
                      text: scientificName,
                      wordLimit: 5,
                      color: AppColors.infoContainerFarmTechniqueColors,
                    )
                  ],
                ),
              ],
            ),
            Icon(CupertinoIcons.chevron_right, size: 20,)
          ],
        ),
      ),
    );
  }
}
