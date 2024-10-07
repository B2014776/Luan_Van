import 'package:agri_shop/core/configs/app_images.dart';
import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/pest/pest_detail/presentation/controller/pest_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PestDetailPage extends GetView<PestDetailController> {
  const PestDetailPage({super.key});

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
            centerTitle: true,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                text: 'Ong bầu',
              fontWeight: FontWeight.w500,
              size: 18,
            ),
            TextWidget(
                text: "Xylocopa",
              color: AppColors.scientificNamePest,
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('https://i.pinimg.com/736x/f9/ad/7d/f9ad7dea9c8d56c81e0fc4fee7ed9c17.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextWidget(
              text: '1. Thường xuất hiện trên cây',
              color: AppColors.infoDetailPest,
              size: 16,
            ),
            TextWidget(
                text: 'Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,  Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,  Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,   Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,  bao phủ bởi một lớp lông mịn, và màu sắc thường là sự kết hợp giữa vàng và đen.',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              showExpandButton: true, // Hiển thị nút Xem thêm/Thu gọn
              wordLimit: 50, // Giới hạn số từ để hiển thị nút Xem thêm
            ),
            SizedBox(height: 10,),
            TextWidget(
              text: '1. Triệu chứng',
              color: AppColors.infoDetailPest,
              size: 16,
            ),
            TextWidget(
              text: 'Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,  Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,  Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,   Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,  bao phủ bởi một lớp lông mịn, và màu sắc thường là sự kết hợp giữa vàng và đen.',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              showExpandButton: true, // Hiển thị nút Xem thêm/Thu gọn
              wordLimit: 50, // Giới hạn số từ để hiển thị nút Xem thêm
            ),
            SizedBox(height: 10,),
            TextWidget(
              text: '1. Cách nhận biết',
              color: AppColors.infoDetailPest,
              size: 16,
            ),
            TextWidget(
              text: 'Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,  Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,  Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,   Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,  bao phủ bởi một lớp lông mịn, và màu sắc thường là sự kết hợp giữa vàng và đen.',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              showExpandButton: true,
              wordLimit: 50,
            ),
            SizedBox(height: 10,),
            TextWidget(
              text: '1. Nguyên nhân',
              color: AppColors.infoDetailPest,
              size: 16,
            ),
            TextWidget(
              text: 'Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,  Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,  Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,   Chúng có thân hình nhỏ bé, được bao phủ bởi một lớp lông mịn,  bao phủ bởi một lớp lông mịn, và màu sắc thường là sự kết hợp giữa vàng và đen.',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              showExpandButton: true, // Hiển thị nút Xem thêm/Thu gọn
              wordLimit: 50, // Giới hạn số từ để hiển thị nút Xem thêm
            ),
          ],
        ),
      ),
    );
  }
}
