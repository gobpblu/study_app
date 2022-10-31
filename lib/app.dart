import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/core/themes/theme_controller.dart';

import 'core/routes/app_routes.dart';
import 'features/home/presentation/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().darkTheme,
      getPages: AppRoutes.routes(),
    );
  }
}
