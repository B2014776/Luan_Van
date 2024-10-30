import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/routers/routes.dart';
import 'package:agri_shop/core/ui/text_input/widgets/app_bar/app_bar_widget.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/expanded/farming_technique/presentation/controller/farmingtechnique_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FarmingtechniquePage extends GetView<FarmingtechniqueController> {
  const FarmingtechniquePage({super.key});

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
              'Kỹ thuật canh tác',
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
                Get.toNamed(Routes.detailFarmingTechnique);
              },
              child: _vegetableItem(
                  ImageNetwork: 'https://i.pinimg.com/564x/8a/20/40/8a20400e412a0d4d55915e1ca6c9aa00.jpg',
                  title: 'Cà chua',
                  scientificName: 'Solanum lycopersicum'
              ),
            ),
            _vegetableItem(
                ImageNetwork: 'https://i.pinimg.com/564x/ff/8f/a0/ff8fa0baaa33b9e40d040337d0591306.jpg',
                title: 'Ổi',
                scientificName: 'Psidium guayava'
            ),
            _vegetableItem(
                ImageNetwork: 'https://i.pinimg.com/564x/1a/ff/3d/1aff3d86c0419f34531cf3f1d8e38983.jpg',
                title: 'Cam',
                scientificName: 'Rutaceae'
            ),





          ],
        ),
      ),
    );
  }

  Container _vegetableItem({ required String ImageNetwork, required String title, required String scientificName}) {
    return Container(
            decoration: BoxDecoration(
              color: AppColors.containerItemFarmTechniqueColors,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.borderColorsFarmTechnique,
                  width: 0.5,
                ),
              ),
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                            color: AppColors.titleContainerFarmTechniqueColors,
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
