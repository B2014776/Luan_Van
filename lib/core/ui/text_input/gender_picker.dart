import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropDownWidget extends StatelessWidget {
  final RxString selectedValue;

  const CustomDropDownWidget({
    Key? key,
    required this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Obx(
            () => DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              selectedValue.value,
              style: const TextStyle(fontSize: 14),
            ),
            items: const [
              DropdownMenuItem(
                value: "Tất cả",
                child: Text("Tất cả", style: TextStyle(fontSize: 14)),
              ),
              DropdownMenuItem(
                value: "Ban đầu",
                child: Text("Ban đầu", style: TextStyle(fontSize: 14)),
              ),
              DropdownMenuItem(
                value: "Biến động",
                child: Text("Biến động", style: TextStyle(fontSize: 14)),
              ),
            ],
            value: selectedValue.value,
            onChanged: (String? value) {
              selectedValue.value = value ?? "Tất cả";
            },
            buttonStyleData: ButtonStyleData(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 40,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
