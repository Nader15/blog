import 'package:blog/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Logic/Controllers/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.WHITE_COLOR,
        appBar: AppBar(
          elevation: 0,
          title: const Text("Profile"),
          centerTitle: true,
          backgroundColor: AppColors.MAIN_COLOR,
          actions: [
            IconButton(
              onPressed: () {
                authController.logOut();
              },
              icon: const Icon(
                Icons.logout,
                color: AppColors.RED_COLOR,
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.MAIN_COLOR,
                backgroundImage:
                NetworkImage(authController.displayUserPhoto.value),
              ),
              Text(authController.displayUserName.value),
              Text(authController.displayUserEmail.value),
            ],
          ),
        ),
      );
    });
  }
}
