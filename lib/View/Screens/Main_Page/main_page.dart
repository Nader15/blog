import 'package:blog/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Logic/Controllers/main_page_controller.dart';

class MainPage extends StatelessWidget {
   MainPage({Key? key}) : super(key: key);
  final mainController = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: mainController.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.WHITE_COLOR,
          selectedItemColor: AppColors.MAIN_COLOR,
          // selectedItemColor: primaryColor,
          unselectedItemColor: AppColors.GREY_SHADE_COLOR,
          items:const [
             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_upload_outlined), label: 'Post'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Profile'),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.person), label: 'الشخصية'),
          ],
          onTap: (index) {
            mainController.currentIndex.value = index;
          },
        ),
        body: SafeArea(
          child: IndexedStack(
            index: mainController.currentIndex.value,
            children: mainController.tabs,
          ),
        ),
      );
    });
  }
}
