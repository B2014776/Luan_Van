import 'package:agri_shop/core/routers/routes.dart';
import 'package:agri_shop/features/farming_technique/details/di/details_binding.dart';
import 'package:agri_shop/features/farming_technique/details/presentation/page/detail_page.dart';
import 'package:agri_shop/features/farming_technique/di/farmingTechnique_binding.dart';
import 'package:agri_shop/features/farming_technique/presentation/page/farmingTechnique_page.dart';
import 'package:agri_shop/features/main/di/main_binding.dart';
import 'package:agri_shop/features/main/presentation/pages/main_page.dart';
import 'package:agri_shop/features/navigation/home/presentation/page/home_page.dart';
import 'package:agri_shop/features/pest/di/pest_binding.dart';
import 'package:agri_shop/features/pest/pest_detail/di/pest_detail_binding.dart';
import 'package:agri_shop/features/pest/pest_detail/presentation/page/pest_detail_page.dart';
import 'package:agri_shop/features/pest/presentation/page/pest_page.dart';
import 'package:agri_shop/features/product/di/product_binding.dart';
import 'package:agri_shop/features/product/presentation/page/product_page.dart';
import 'package:agri_shop/features/splash/di/splash_binding.dart';
import 'package:agri_shop/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../features/auth/login/di/login_binding.dart';
import '../../features/auth/login/presentation/page/login_page.dart';
import '../../features/auth/register/di/registerBinding.dart';
import '../../features/auth/register/presentation/page/register_page.dart';
import '../../features/navigation/home/di/homeBinding.dart';

class Pages{
  static const initial = Routes.splash;
  static const main = Routes.main;

  // trang đăng nhập
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),

    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBindings(),
    ),

    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.farmingTechnique,
      page: () => FarmingtechniquePage(),
      binding: FarmingtechniqueBinding(),
    ),
    GetPage(
      name: Routes.detailFarmingTechnique,
      page: () => DetailPage(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: Routes.pest,
      page: () => PestPage(),
      binding: PestBinding(),
    ),
    GetPage(
      name: Routes.pestDetail,
      page: () => PestDetailPage(),
      binding: PestDetailBinding(),
    ),
    GetPage(
      name: Routes.product,
      page: () => ProductPage(),
      binding: Productbinding(),
    ),
  ];
}