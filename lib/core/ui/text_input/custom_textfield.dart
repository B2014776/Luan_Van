import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatefulWidget {
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
  final Color? clearIcon;
  final Color? focusOutline;

  const TextFieldWidget({
    Key? key,
    required this.title,
    this.hideTitle = false,
    this.height = 45,
    this.titleStyle,
    this.isRequired = false,
    required this.placeholder,
    this.cornerRadius = 5.0,
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
    this.clearIcon = AppColors.grey,
    this.focusOutline = AppColors.grey
  })  : value = initialValue,
        super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late TextEditingController _controller;
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
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ) ??
                      const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 15,
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
                      fontSize: 13
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : Colors.grey,
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
                  prefixIcon: widget.prefixIcon, // Add prefixIcon here
                  suffixIcon: widget.showClearButton && _controller.text.isNotEmpty
                      ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.suffixIcon != null) widget.suffixIcon!,
                      IconButton(
                        icon:  Icon(CupertinoIcons.clear_circled_solid, color: widget.clearIcon, size: 18,),
                        onPressed: () {
                          _controller.clear();
                          widget.onChange('');
                          setState(() {});
                        },
                      ),
                    ],
                  )
                      : widget.suffixIcon, // Add suffixIcon here
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
