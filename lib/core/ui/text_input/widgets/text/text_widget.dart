import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final List<Shadow>? listShadow;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final TextOverflow? overflow;
  final int? wordLimit;
  final bool showExpandButton;

  final RxBool isExpanded = false.obs; // Trạng thái hiển thị đầy đủ hoặc rút gọn của văn bản

  TextWidget({
    super.key,
    this.textAlign,
    this.listShadow,
    this.maxLines,
    required this.text,
    this.color,
    this.size = 14,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.textDecoration = TextDecoration.none,
    this.fontFamily,
    this.overflow,
    this.wordLimit,
    this.showExpandButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String displayedText = text;

      // Nếu chỉ có `wordLimit` được đặt và `showExpandButton` không được bật, cắt văn bản theo số từ.
      if (wordLimit != null && !showExpandButton) {
        List<String> words = text.split(' ');
        if (words.length > wordLimit!) {
          displayedText = words.sublist(0, wordLimit!).join(' ') + '...';
        }
      }

      // Kiểm tra xem `showExpandButton` có được bật hay không và số từ có vượt `wordLimit` không.
      bool showButton = showExpandButton && text.split(' ').length > (wordLimit ?? 0);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // Nếu đang ở trạng thái mở rộng hoặc không cần hiển thị nút "Xem thêm", hiển thị toàn bộ văn bản
            isExpanded.value || !showButton
                ? displayedText.tr
                : displayedText.tr,
            // Nếu đã mở rộng hoặc không cần hiển thị nút, bỏ qua giới hạn dòng
            maxLines: isExpanded.value || !showButton ? null : maxLines,
            overflow: isExpanded.value || !showButton
                ? TextOverflow.visible // Hiển thị đầy đủ nếu mở rộng
                : overflow ?? TextOverflow.ellipsis,
            textAlign: textAlign,
            style: GoogleFonts.getFont(
              fontFamily ?? "Roboto",
              textStyle: TextStyle(
                color: color,
                fontSize: size,
                fontStyle: fontStyle,
                shadows: listShadow,
                fontWeight: fontWeight,
                decoration: textDecoration,
              ),
            ),
          ),
          // Hiển thị nút "Xem thêm" khi `showExpandButton` được bật và văn bản vượt quá `wordLimit`
          if (showButton)
            GestureDetector(
              onTap: () {
                isExpanded.value = !isExpanded.value; // Đổi trạng thái hiển thị khi ấn vào nút
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      isExpanded.value ? 'Thu gọn' : 'Xem thêm',
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      );
    });
  }
}
