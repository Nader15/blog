import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Logic/Controllers/auth_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import 'Widgets/tags_bottomSheet.dart';

class UploadBlogsScreen extends StatelessWidget {
  UploadBlogsScreen({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  // final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final ref = authController.referenceDatabase.ref("Blogs");
      return Scaffold(
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Add image")
                    ],
                  ),
                  onPressed: () {
                    authController.getPostImage();
                  },
                )),
            Expanded(
                child: TextButton(
                  child: const Text(
                    "# Tags",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    tagsBottomSheet(context);
                  },
                ))
          ],
        ),
        appBar: AppBar(
          elevation: 0,
          title: const Text("Post Your Blog"),
          centerTitle: true,
          backgroundColor: AppColors.MAIN_COLOR,
          actions: [
            TextButton(
              onPressed: () {
                if(authController.tags.value.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text("Add your blog Category"),
                    ),
                  );
                }else{
                  ref
                      .child(
                      "blog ${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())}")
                      .set({
                    'id': authController.auth.currentUser!.uid,
                    "user_name": authController.displayUserName.value,
                    "user_email": authController.displayUserEmail.value,
                    "article_text": authController.blogTextController.value.text,
                    "article_image": authController.displayUserPhoto.value,
                    "article_dateTime":
                    "${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())}",
                    "article_category": authController.tags.value,
                    // "article_category":
                    //     authController.blogCategoryController.value,
                  }).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 2),
                        content: Text("Your article uploaded successfully"),
                      ),
                    );
                    // mainController.currentIndex.value=0;
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: Text("$error"),
                      ),
                    );
                  }).asStream();
                }
              },
              child: const Text("Post"),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: AppColors.MAIN_COLOR,
                    backgroundImage:
                        NetworkImage(authController.displayUserPhoto.value),
                  ),
                  trailing: Text(
                    authController.tags.value,
                    style: const TextStyle(color: Colors.blue),
                  ),
                  title: Row(
                    children: [
                      Text(authController.displayUserName.value),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.check_circle_rounded,
                        color: Colors.blue,
                        size: 17,
                      ),
                    ],
                  ),
                  subtitle: Text(authController.displayUserEmail.value),
                ),
                TextFormField(
                  controller: authController.blogTextController.value,
                  maxLines: 5,
                  decoration: InputDecoration(
                      filled: true,
                      isCollapsed: false,
                      fillColor: AppColors.GREY_SHADE_COLOR.withOpacity(0.05),
                      hintText: 'What is in your mind ?',
                      border: InputBorder.none),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (authController.postImage.value!.path.isNotEmpty)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.topCenter,
                          child: Image.file(
                            authController.postImage.value!,
                            width: double.infinity,
                            // height: 90,
                            fit: BoxFit.cover,
                          )),
                      Padding(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                              onTap: () {
                                authController.postImage.value=File("");
                              },
                              child: Container(
                                padding: const EdgeInsets.all(1.0),
                                decoration: const BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ))),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
