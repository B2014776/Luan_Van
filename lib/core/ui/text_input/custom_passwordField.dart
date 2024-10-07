import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PasswordFieldWidget extends StatefulWidget {
  final String title;
  final bool hideTitle;
  final double height;
  final TextStyle? titleStyle;
  final bool isRequired;
  final String placeholder;
  final double cornerRadius;
  final bool isDisabled;
  final String value;
  final String? warningText;
  final bool showClearButton;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String) onChange;
  final Function()? onTap;
  final FocusNode? focusNode;
  final String? errorWidget;
  final double? maxWidth;
  final Color? outlineInputColor;
  final Color? focusOutline;

  const PasswordFieldWidget({
    super.key,
    required this.title,
    this.hideTitle = false,
    this.height = 45,
    this.titleStyle,
    this.isRequired = false,
    required this.placeholder,
    this.cornerRadius = 7.0,
    this.isDisabled = false,
    required String initialValue,
    this.warningText,
    this.showClearButton = true,
    this.prefixIcon,
    this.suffixIcon,
    required this.onChange,
    this.onTap,
    this.focusNode,
    this.errorWidget,
    this.maxWidth,
    this.outlineInputColor = const Color(0xffC6C6C6),
    this.focusOutline = AppColors.grey,
  })  : value = initialValue;

  @override
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  late TextEditingController _controller;
  final RxBool isObscure = true.obs;
  final RxBool showError = false.obs;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.hideTitle)
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.title,
                  style: widget.titleStyle?.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ) ??
                      const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                ),
                if (widget.isRequired)
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        const SizedBox(height: 10.0),
        Obx(() {
          final isError = showError.value;
          return SizedBox(
              height: widget.height,
              width: widget.maxWidth,
              child: TextField(
                enabled: !widget.isDisabled,
                controller: _controller,
                obscureText: isObscure.value,
                onChanged: (value) {
                  showError.value = widget.isRequired && value.isEmpty;
                  widget.onChange(value);
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: widget.placeholder,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  hintStyle: TextStyle(
                    color:
                    widget.isDisabled ? Colors.grey.shade400 : Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : widget.outlineInputColor!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : widget.focusOutline!,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : Colors.grey,
                      width: 1,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor:
                  widget.isDisabled ? Colors.grey.shade200 : Colors.white,
                  errorText: isError ? widget.warningText : null,
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.showClearButton && _controller.text.isNotEmpty
                      ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.suffixIcon != null) widget.suffixIcon!,
                      InkWell(
                        child: const Icon(CupertinoIcons.clear_circled_solid, size: 17, color: AppColors.grey,),
                        onTap: () {
                          _controller.clear();
                          widget.onChange('');
                          setState(() {});
                        },
                      ),
                      SizedBox(width: 8,),
                      InkWell(
                        child: Icon(isObscure.value
                            ? Icons.visibility_off
                            : CupertinoIcons.eye_slash_fill, size: 18, color: Colors.grey,),
                        onTap: toggleObscure,
                      ),
                    ],
                  )
                      : IconButton(
                    icon: Icon(isObscure.value
                        ? Icons.visibility_off
                        : CupertinoIcons.eye, color: Colors.grey, size: 18,),
                    onPressed: toggleObscure,
                  ),
                ),
                style: TextStyle(
                  color:
                  widget.isDisabled ? Colors.grey.shade600 : Colors.black,
                ),
                cursorColor: widget.isDisabled ? Colors.grey : Colors.black,
              ));
        }),
        Obx(() => showError.value && widget.errorWidget != null
            ? Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Text(
            widget.errorWidget!,
            style: const TextStyle(color: Colors.red),
          ),
        )
            : const SizedBox.shrink()),
      ],
    );
  }
}
