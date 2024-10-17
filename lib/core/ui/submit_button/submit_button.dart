import 'package:agri_shop/core/configs/app_dimens.dart';
import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  final double textSize;
  final VoidCallback ontap;
  final String text;
  final double? width;
  late Color? backgroundColor;
  final Color textColor;
  final FontWeight? fontWeight;
  final bool? isBorder;
  late Color? borderColor;
  final SvgPicture? leadingIcon;
  final double? borderRadius;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  ButtonWidget({
    super.key,
    this.fontWeight = FontWeight.w600,
    required this.ontap,
    required this.text,
    this.width = double.infinity,
    this.isBorder = false,
    this.borderColor,
    this.textColor = AppColors.white,
    this.backgroundColor = AppColors.primary,
    this.leadingIcon,
    this.child,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 6.0),
    this.textSize = AppDimens.textStandard,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding:padding,
        width: width,
        decoration: BoxDecoration(
          border: isBorder == true
              ? Border.all(
            width: 1,
            color: borderColor!,
          )
              : null,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leadingIcon != null) leadingIcon!,
              if (leadingIcon != null) const SizedBox(width: 10.0),
              child ??
                  TextWidget(
                    size: textSize,
                    text: text,
                    fontWeight: fontWeight,
                    textAlign: TextAlign.center,
                    color: textColor,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
