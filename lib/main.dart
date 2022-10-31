import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/themes/dark_theme.dart';
import 'features/home/presentation/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    theme: DarkTheme().buildDarkTheme(),
  ));
}
