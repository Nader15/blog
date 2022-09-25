import 'package:get/get.dart';

import '../../View/Screens/Home_Screen/home_screen.dart';
import '../../View/Screens/Profile_Screen/profile_screen.dart';
import '../../View/Screens/UploadFeeds_Screen/upload_feeds_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    UploadBlogsScreen(),
    ProfileScreen(),
  ].obs;
}