

import 'package:agri_shop/core/configs/app_images.dart';
import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/data/service/utils/images_service.dart';
import 'package:flutter/material.dart';
class AvatarWidget extends StatelessWidget {
  final double ? padding;
  final double radius;
  final String ? url;
  
  const AvatarWidget({
    super.key,
    this.url ,
    required this.radius, 
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 0),
      decoration: BoxDecoration(

        color: AppColors.white,
        borderRadius: BorderRadius.circular(1000),
        border: Border.all(color: AppColors.grey, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.2),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10000),
        child: FutureBuilder<bool>(
          future: ImagesService.doesImageLinkExist(url??""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                width: radius,
                height: radius,
                child: const Center(child: CircularProgressIndicator(strokeWidth: 2,)),
              );
            } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == false) {
              return Image.asset(
                AppImages.hatgiong,
                width: radius,
                height: radius,
                fit: BoxFit.cover,
              );
            } else {
              return Image.network(
                url??"",
                width: radius,
                height: radius,
                fit: BoxFit.cover,
              );
            }
          },
        ),
      ),
    );
  }
}
