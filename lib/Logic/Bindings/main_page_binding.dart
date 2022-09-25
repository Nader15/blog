import 'package:blog/Logic/Controllers/main_page_controller.dart';
import 'package:get/get.dart';

import '../Controllers/auth_controller.dart';
class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
