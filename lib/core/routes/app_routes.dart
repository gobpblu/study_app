import 'package:get/get.dart';
import 'package:study_app/features/splash/presentation/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
    GetPage(name: '/', page: () => const SplashScreen())
  ];
}