import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/features/main/presentation/controller/main_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Navigator(
          key: Get.nestedKey(10),
          initialRoute: "/home",
          onGenerateRoute: controller.onGenerateRoute,
        ),
        bottomNavigationBar: Obx(() =>
            ResponsiveNavigationBar(
              selectedIndex: controller.currentIndex.value,
              onTabChange: controller.onChangeItemBottomBar,
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              navigationBarButtons: const <NavigationBarButton>[
                NavigationBarButton(
                  icon: Icons.home,
                  backgroundGradient: LinearGradient(
                    colors: [Colors.green, Colors.white],
                  ),
                ),
                NavigationBarButton(
                  icon: Icons.chat,
                  backgroundGradient: LinearGradient(
                    colors: [Colors.green, Colors.white],
                  ),
                ),
                NavigationBarButton(
                  icon: Icons.camera,
                  backgroundGradient: LinearGradient(
                    colors: [Colors.green, Colors.white],
                  ),
                ),
                NavigationBarButton(
                  icon: Icons.card_giftcard,
                  backgroundGradient: LinearGradient(
                    colors: [Colors.green, Colors.white],
                  ),
                ),
                NavigationBarButton(
                  icon: Icons.person,
                  backgroundGradient: LinearGradient(
                    colors: [Colors.green, Colors.white],
                  ),
                ),

              ],
            ),
        )
    );
  }
}

