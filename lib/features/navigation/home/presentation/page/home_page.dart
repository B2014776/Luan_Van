import 'package:agri_shop/core/configs/app_images.dart';
import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/routers/routes.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/navigation/home/presentation/controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/ui/text_input/widgets/app_bar/app_bar_widget.dart';
import 'package:html/parser.dart' show parse;




class HomePage extends GetView<HomeController> {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    // Gọi phương thức fetchData() để lấy dữ liệu thời tiết khi HomePage được xây dựng
    controller.fetchData();

    return Scaffold(
      appBar: AppBarWidget(
        logo: Image.asset(
          'assets/Images/Plant.png',
          height: 120,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Xử lý sự kiện khi nhấn vào nút thông báo
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          // color: AppColors.backgroundColors,
          color: Colors.white
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Sử dụng Obx để theo dõi sự thay đổi của HomeController
              Obx(() {
                return controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : _BuildClearance(); // Hiển thị thông tin thời tiết
              }),
              const _BuildCategories(),
              const SizedBox(height: 20),
              buildImageSlider([
                'https://i.pinimg.com/564x/5a/11/2e/5a112e6344d257b1d36d3c17f2fcbebc.jpg',
                'https://i.pinimg.com/564x/83/4d/52/834d5281b77f70b184d39e26b18af0e6.jpg',
                'https://i.pinimg.com/736x/2f/9f/e3/2f9fe39db5e422ff8e805b0f9769cde0.jpg',
              ]),
              const SizedBox(height: 20),
              const _BuildListProduct(
                titleList: "Sản phẩm",
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Xử lý sự kiện khi nhấn vào nút
          print("Floating Action Button Pressed");
        },
        backgroundColor: Colors.green, // Màu nền của nút
        child: const Icon(Icons.add, color: Colors.white), // Biểu tượng bên trong nút
      ),
    );
  }

  Widget buildImageSlider(List<String> imageUrls) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200, // Chiều cao của slider
        enlargeCenterPage: true,
        autoPlay: true, // Tự động chuyển ảnh
        autoPlayInterval: const Duration(seconds: 3), // Thời gian chuyển ảnh
        viewportFraction: 0.8, // Tỷ lệ hiển thị ảnh trong viewport
      ),
      items: imageUrls.map((imageUrl) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }
}







class _BuildListProduct extends StatelessWidget {
  final String titleList;
  const _BuildListProduct({required this.titleList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TextWidget(
            text: titleList,
            fontWeight: FontWeight.w400,
            size: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              InkWell(
                onTap: () { Get.toNamed(Routes.product);},
                child: CardProduct(),
              ),
              CardProduct(),
              CardProduct(),
              CardProduct(),
              CardProduct(),
            ],
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget CardProduct() {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // width: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(color: AppColors.black.withOpacity(.3), blurRadius: 2)
          ]),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            width: 100, // Chiều rộng tùy chỉnh
            height: 120, // Chiều cao tùy chỉnh
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.loctroi.vn/UploadFiles/HinhDaiDien/271022021434474_TRIO-CMB.jpg',
                ),
                fit: BoxFit.cover, // Đặt BoxFit.cover cho ảnh nền
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 0.6,
                  decoration:
                      BoxDecoration(color: AppColors.primary.withOpacity(.3)),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: "Phoxim",
                  fontWeight: FontWeight.w500,
                  size: 16,
                ),
                 TextWidget(
                  wordLimit: 7,
                  text: "Chế phẩm diệt côn trùng Chế phẩm diệt côn trùng",
                  color: AppColors.primary,
                  size: 14,
                ),
                SizedBox(height: 10,),
                 TextWidget(
                  text: "100.000 VND",
                  size: 15,
                  color: AppColors.price,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}




class _BuildCategories extends StatelessWidget {
  const _BuildCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCatItems(title: "Kỹ thuật canh tác", urlIcon: AppImages.Icat_1,toPageUrl:Routes.farmingTechnique),
          _buildCatItems(title: "Sâu bệnh hại", urlIcon: AppImages.Icat_2, toPageUrl: Routes.pest),
          _buildCatItems(title: "Nhận diện AI", urlIcon: AppImages.Icat_3),
          _buildCatItems(title: "Liên hệ với cửa hàng", urlIcon: AppImages.Icat_4, toPageUrl:Routes.chatting),
        ],
      ),
    );
  }


  Widget _buildCatItems({
    required String title,
    String urlIcon = AppImages.Icat_1,
    String toPageUrl=""
  }) {
    return Container(
      width: 80, // Đặt chiều rộng cố định cho toàn bộ ô để đồng đều
      child: InkWell(
        onTap: () {if(toPageUrl!="") Get.toNamed(toPageUrl);},
        child: Column(
          children: [
            Container(
              width: 65,
              height: 55,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffbdbdbd), width: 0.8),
                color: Colors.white,
              ),
              child: Image.asset(urlIcon),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 70, // Đặt chiều rộng cố định cho văn bản để đồng bộ kích thước
              child: TextWidget(
                text: title,
                size: 12,
                textAlign: TextAlign.center, // Canh giữa nội dung text
                maxLines: 2, // Giới hạn xuống tối đa 2 dòng

              ),
            ),
          ],
        ),
      ),
    );
  }
}




  InkWell _buildOptionItems({required String title, bool active = false}) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
            color: active ? AppColors.activeButton : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(130, 2, 1, 18),
                  blurRadius: 2,
                  offset: Offset(2, 2))
            ]),
        child: TextWidget(text: title),
      ),
    );
  }



class _BuildClearance extends StatelessWidget {
  const _BuildClearance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lấy HomeController từ GetX
    final HomeController controller = Get.find<HomeController>();

    // Lấy ngày tháng hiện tại
    final date = DateTime.now();
    final formattedDate = "${date.day}-${date.month}-${date.year}"; // Định dạng ngày

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white
      ),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều ngang
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều ngang
                children: [
                  Icon(CupertinoIcons.map_pin_ellipse, color: Color(0xff3A3C8F), size: 24,),
                  SizedBox(width: 10,),
                  TextWidget(
                    text: _getFormattedCityName(controller.weatherData['localtime']),
                    size: 19,
                    color: Color(0xff3A3C8F),
                  ),
                ],
              ),
              SizedBox(height: 5),
              TextWidget(
                text: formattedDate,
                size: 15,
                color: Color(0xff8986EF),
              ),
            ],
          ),
          SizedBox(
            height: 90,
            child: Stack(
              alignment: Alignment.center, // Canh giữa các widget
              children: [
                Positioned(
                  right: 40, // Điều chỉnh vị trí cho icon đám mây
                  top: 7,
                  child: Image.asset(
                    AppImages.Isun, // Thay thế bằng icon đám mây
                    width: 80, // Kích thước phù hợp để che một phần nhiệt độ
                  ),
                ),
                Positioned(
                  right: 100,
                  child: TextWidget(
                    text: '${controller.weatherData['current']?['temp_c'] ?? 'N/A'}°',
                    size: 50,
                    color: Color(0xff5157EB),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10), // Khoảng cách giữa hai container
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffE9E7FF).withOpacity(0.8), // Màu trắng với độ trong suốt 30%
                    borderRadius: BorderRadius.circular(50), // Bo góc
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Màu bóng
                        offset: Offset(2, 2), // Vị trí bóng
                        blurRadius: 5, // Độ mờ của bóng
                      ),
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15), // Padding bên trong
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung
                        children: [
                          Icon(CupertinoIcons.smoke, color: Color(0xff4C4DDB), size: 25,),
                          TextWidget(
                            text: '${controller.weatherData['current']?['temp_f'] ?? 'N/A'}°F',
                            size: 15,
                            color: Color(0xff4C4DDB),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung
                        children: [
                          Icon(CupertinoIcons.drop, color: Color(0xff4C4DDB), size: 25,),
                          TextWidget(
                            text: '${controller.weatherData['current']?['humidity'] ?? 'N/A'}%',
                            size: 15,
                            color: Color(0xff4C4DDB),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung
                        children: [
                          Icon(CupertinoIcons.wind_snow, color: Color(0xff4C4DDB), size: 25,),
                          TextWidget(
                            text: '${controller.weatherData['current']?['wind_kph'] ?? 'N/A'}m/h',
                            size: 15,
                            color: Color(0xff4C4DDB),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getFormattedCityName(Map<String, dynamic>? location) {
    if (location == null) return "Cần Thơ, Việt Nam"; // Giá trị mặc định
    String cityName = location['name'] ?? "Cần Thơ"; // Lấy tên thành phố
    // String countryName = location['country'] ?? "Việt Nam"; // Lấy tên quốc gia

    // Giải mã tên thành phố nếu cần
    cityName = cityName.replaceAll("Cáº§n ThÆ¡", "Cần Thơ");

    return "$cityName"; // Trả về tên thành phố và quốc gia
  }

  String _decodeHtml(String htmlString) {
    return parse(htmlString).documentElement?.text ?? htmlString; // Giải mã HTML entities
  }
}


