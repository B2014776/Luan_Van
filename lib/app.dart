import 'package:agri_shop/app_binding.dart';
import 'package:agri_shop/core/configs/themes/themes.dart';
import 'package:agri_shop/core/routers/pages.dart';
import 'package:agri_shop/core/routers/routes.dart';
import 'package:agri_shop/core/utils/behavior.dart';
import 'package:agri_shop/lang/translation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Pages.initial,
      scrollBehavior: MyBehavior(),
      getPages: Pages.routes,
      initialBinding: AppBinding(),
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      theme: Themes.light,
      darkTheme: Themes.dark, // Apply the dark theme
      themeMode: ThemeMode.light, // Use system theme mode (ligh
    );
  }
}
