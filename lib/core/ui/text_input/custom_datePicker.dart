import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../configs/app_dimens.dart';

class CustomDatePicker extends StatefulWidget {
  final String title;
  final bool hideTitle;
  final TextStyle? titleStyle;
  final bool isRequired; // Ràng buộc nhập dữ liệu
  final String placeholder;
  final double cornerRadius;
  final bool isDisabled;
  final bool isTyping;
  final DateTime? date;
  final String? warningText;
  final bool showClearButton;
  final Function(DateTime?) onChange;
  final String? errorWidget;
  final int? widthSize;

  const CustomDatePicker({
    Key? key,
    required this.title,
    this.hideTitle = false,
    this.titleStyle,
    this.isRequired = false, // Giá trị mặc định là false
    required this.placeholder,
    this.cornerRadius = 5.0,
    this.isDisabled = false,
    this.isTyping = false,
    this.date,
    this.widthSize,
    this.warningText,
    this.showClearButton = true,
    required this.onChange,
    this.errorWidget,
  }) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final TextEditingController _dateController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showError = false;
  bool _showWarningText = false;

  @override
  void initState() {
    super.initState();
    if (widget.date != null) {
      _dateController.text = DateFormat('dd-MM-yyyy').format(widget.date!);
    }
  }

  void _showCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Transform.scale(
            scale: 0.8,
            child: CupertinoDatePicker(
              initialDateTime: widget.date ?? DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime newDate) {
                widget.onChange(newDate);
                setState(() {
                  _dateController.text = DateFormat('yyyy-MM-dd').format(newDate);
                  _showError = false;
                  _showWarningText = false;
                });
              },
            ),
          ),
        );
      },
    );
  }

  void _validateInput() {
    if (widget.isRequired && _dateController.text.isEmpty) { // Thêm điều kiện ràng buộc
      setState(() {
        _showError = true;
        _showWarningText = true;
      });
      _focusNode.requestFocus();
    } else {
      setState(() {
        _showError = false;
        _showWarningText = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.hideTitle)
          Row(
            children: [
              Text(
                widget.title,
                style: widget.titleStyle ?? TextStyle(
                    fontSize: AppDimens.textSize12,
                    fontWeight: FontWeight.w500,
                    color: CupertinoColors.black
                ),
              ),
              if (widget.isRequired) // Hiển thị dấu * nếu là bắt buộc nhập
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 45,
          width: widget.widthSize?.toDouble(),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Thêm màu nền cho Container
              borderRadius: BorderRadius.circular(widget.cornerRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              controller: _dateController,
              focusNode: _focusNode,
              enabled: !widget.isDisabled,
              readOnly: !widget.isTyping,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: AppDimens.textSize13,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.cornerRadius),
                  borderSide: BorderSide(
                    color: _showError ? AppColors.error : Colors.grey,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.cornerRadius),
                  borderSide: BorderSide(
                    color: _showError ? Colors.red : Colors.grey,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.cornerRadius),
                  borderSide: BorderSide(
                    color: _showError ? AppColors.error : Colors.grey,
                    width: 1,
                  ),
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_dateController.text.isNotEmpty)
                      InkWell(
                        onTap: () {
                          widget.onChange(null);
                          _dateController.clear();
                          _validateInput();
                        },
                        child: Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: AppColors.grey,
                          size: 18,
                        ),
                      ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        if (!widget.isDisabled) {
                          _showCupertinoDatePicker(context);
                        }
                      },
                      child: const Icon(
                        CupertinoIcons.calendar,
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
              style: const TextStyle(fontSize: AppDimens.textSize15, color: CupertinoColors.black),
              onTap: widget.isDisabled
                  ? null
                  : () {
                if (!widget.isTyping) {
                  _showCupertinoDatePicker(context);
                }
              },
              onEditingComplete: _validateInput,
            ),
          ),
        ),
        if (_showWarningText && widget.warningText != null)
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Text(
              widget.warningText!,
              style: const TextStyle(color: AppColors.error, fontSize: AppDimens.textSize12),
            ),
          ),
        if (widget.errorWidget != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.errorWidget!,
              style: const TextStyle(color: AppColors.error),
            ),
          ),
      ],
    );
  }
}
