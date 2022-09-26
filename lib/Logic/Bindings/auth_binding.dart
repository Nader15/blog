import 'package:get/get.dart';

import '../Controllers/auth_controller.dart';
import '../Controllers/main_page_controller.dart';
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
