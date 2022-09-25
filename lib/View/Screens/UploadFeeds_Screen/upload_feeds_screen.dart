import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Logic/Controllers/auth_controller.dart';
import '../../../Utils/app_colors.dart';

class UploadBlogsScreen extends StatelessWidget {
   UploadBlogsScreen({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Post Your Blog"),
          centerTitle: true,
          backgroundColor: AppColors.MAIN_COLOR,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: AppColors.MAIN_COLOR,
                   backgroundImage:
                  NetworkImage(authController.displayUserPhoto.value),
                ),
                title: Row(
                  children: [
                    Text(authController.displayUserName.value),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.check_circle_rounded,
                      color: Colors.blue,
                      size: 17,
                    ),
                  ],
                ),
                subtitle: Text("Public"),
              ),
              Expanded(
                child: TextFormField(
                  maxLines: 20,
                  decoration: InputDecoration(
                      filled: true,
                      isCollapsed: false,
                      fillColor: AppColors.GREY_SHADE_COLOR.withOpacity(0.05),
                      hintText: 'what is in your mind',
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt),
                            SizedBox(
                              width: 10,
                            ),
                            Text("add photo")
                          ],
                        ),
                        onPressed: () {},
                      )),
                  Expanded(
                      child: TextButton(
                        child: Text(
                          "# tags",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: () {},
                      ))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
