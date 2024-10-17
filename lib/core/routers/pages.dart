import 'package:agri_shop/core/routers/routes.dart';
import 'package:agri_shop/features/chating/di/chatting_binding.dart';
import 'package:agri_shop/features/chating/presentation/page/chatting_page.dart';
import 'package:agri_shop/features/detection/di/detection_binding.dart';
import 'package:agri_shop/features/detection/presentation/page/detection_page.dart';
import 'package:agri_shop/features/expanded/breed_introdution/di/breed_introdution_binding.dart';
import 'package:agri_shop/features/expanded/breed_introdution/presentation/page/breed_introdution_page.dart';
import 'package:agri_shop/features/expanded/change_passwd/di/change_passwd_binding.dart';
import 'package:agri_shop/features/expanded/change_passwd/presentation/page/change_passwd_page.dart';
import 'package:agri_shop/features/expanded/custom_interface/di/custom_interface_binding.dart';
import 'package:agri_shop/features/expanded/custom_interface/presentation/page/custom_interface_page.dart';
import 'package:agri_shop/features/expanded/edit_profile/di/edit_profile_binding.dart';
import 'package:agri_shop/features/expanded/edit_profile/presentation/page/edit_profile_page.dart';
import 'package:agri_shop/features/expanded/farming_technique/details/di/details_binding.dart';
import 'package:agri_shop/features/expanded/farming_technique/details/presentation/page/detail_page.dart';
import 'package:agri_shop/features/expanded/farming_technique/di/farmingTechnique_binding.dart';
import 'package:agri_shop/features/expanded/farming_technique/presentation/page/farmingTechnique_page.dart';
import 'package:agri_shop/features/expanded/multiplication/di/multiplication_binding.dart';
import 'package:agri_shop/features/expanded/multiplication/presentation/page/multiplication_page.dart';
import 'package:agri_shop/features/expanded/plant_tree/di/plant_tree_binding.dart';
import 'package:agri_shop/features/expanded/plant_tree/presentation/page/plant_tree_page.dart';
import 'package:agri_shop/features/expanded/tree_care/di/tree_care_binding.dart';
import 'package:agri_shop/features/expanded/tree_care/presentation/page/tree_care_page.dart';
import 'package:agri_shop/features/list_product/di/product_list_binding.dart';
import 'package:agri_shop/features/list_product/presentation/page/product_list_page.dart';
import 'package:agri_shop/features/main/di/main_binding.dart';
import 'package:agri_shop/features/main/presentation/pages/main_page.dart';
import 'package:agri_shop/features/navigation/camera/di/camera_binding.dart';
import 'package:agri_shop/features/navigation/camera/presentation/pages/camera_page.dart';
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
    GetPage(
      name: Routes.listProduct,
      page: () => ProductListPage(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => EditProfilePage(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: Routes.changePasswd,
      page: () => ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.customInterface,
      page: () => CustomInterfacePage(),
      binding: CustomInterfaceBinding(),
    ),
    GetPage(
      name: Routes.breedIntrodution,
      page: () => BreedIntrodutionPage(),
      binding: BreedIntrodutionBinding(),
    ),
    GetPage(
      name: Routes.multiplication,
      page: () => MultiplicationPage(),
      binding: MultiplicationBinding(),
    ),
    GetPage(
      name: Routes.treeCare,
      page: () => TreeCarePage(),
      binding: TreeCareBinding(),
    ),
    GetPage(
      name: Routes.plantTree,
      page: () => PlantTreePage(),
      binding: PlantTreeBinding(),
    ),
    GetPage(
      name: Routes.chatting,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.detection,
      page: () => DetectionPage(),
      binding: DetectionBinding(),
    ),
  ];
}