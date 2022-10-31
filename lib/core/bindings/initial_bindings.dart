import 'package:get/get.dart';
import 'package:study_app/core/themes/theme_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
  }
}