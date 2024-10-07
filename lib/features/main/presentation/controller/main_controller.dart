import 'package:agri_shop/features/navigation/blogs/di/blogs_binding.dart';
import 'package:agri_shop/features/navigation/blogs/presentation/pages/blogs_page.dart';
import 'package:agri_shop/features/navigation/camera/di/camera_binding.dart';
import 'package:agri_shop/features/navigation/camera/presentation/pages/camera_page.dart';
import 'package:agri_shop/features/navigation/home/di/homeBinding.dart';
import 'package:agri_shop/features/navigation/home/presentation/page/home_page.dart';
import 'package:agri_shop/features/navigation/profile/di/profile_binding.dart';
import 'package:agri_shop/features/navigation/profile/presentation/pages/profile_page.dart';
import 'package:agri_shop/features/navigation/shop/di/shop_binding.dart';
import 'package:agri_shop/features/navigation/shop/presentation/pages/shop_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  final List<String> pages = [
    '/home',
    '/blogs',
    '/camera',
    '/shop',
    '/profile'
  ];

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return GetPageRoute(
          settings: settings,
          page: () => const HomePage(),
          binding: HomeBinding(),
          transition: Transition.fadeIn,
        );
      case '/blogs':
        return GetPageRoute(
          settings: settings,
          page: () => const BlogsPage(),
          binding: BlogsBinding(),
          transition: Transition.fadeIn,
        );
      case '/camera':
        return GetPageRoute(
          settings: settings,
          page: () => const CameraPage(),
          binding: CameraBinding(),
          transition: Transition.fadeIn,
        );
      case '/shop':
        return GetPageRoute(
          settings: settings,
          page: () => const ShopPage(),
          binding: ShopBinding(),
          transition: Transition.fadeIn,
        );
      case '/profile':
        return GetPageRoute(
          settings: settings,
          page: () => const ProfilePage(),
          binding: ProfileBinding(),
          transition: Transition.fadeIn,
        );
    }
    return null;
  }

  void onChangeItemBottomBar(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
    Get.offAndToNamed(pages[index], id: 10);
  }
}
