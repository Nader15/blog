import 'package:blog/Routes/routes.dart';
import 'package:blog/Utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Logic/Controllers/auth_controller.dart';
import '../UploadFeeds_Screen/Widgets/tags_bottomSheet.dart';
import 'Widgets/filter_bottomSheet.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Feed"),
        centerTitle: true,
        backgroundColor: AppColors.MAIN_COLOR,
        leading: IconButton(
          splashRadius: 25,
          onPressed: () {
            filterBottomSheet(context);
          },
          icon: const Icon(
            Icons.filter_alt_outlined,
          ),
        ),
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: () {
              Get.toNamed(Routes.searchScreen);
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: FirebaseAnimatedList(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        query: authController.ref,
        itemBuilder: (BuildContext context, snapshot, animation, index) {
          return Obx(() {
            final articleCategory =
                snapshot.child('article_category').value.toString();
            if (authController.categoryFilter.value.isEmpty) {
              return Card(
                elevation: 10,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.child('article_image').value.toString()),
                          backgroundColor: AppColors.MAIN_COLOR,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Text(
                                snapshot.child('user_name').value.toString(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.check_circle_rounded,
                                color: Colors.blue,
                                size: 17,
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          snapshot.child('user_email').value.toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              snapshot
                                  .child('article_dateTime')
                                  .value
                                  .toString()
                                  .split(' ')[0],
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              snapshot
                                  .child('article_dateTime')
                                  .value
                                  .toString()
                                  .split(' ')[1],
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Text(
                          snapshot.child('article_category').value.toString(),
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        snapshot.child('article_text').value.toString(),
                        style: const TextStyle(),
                      ),
                    ),
                  ],
                ),
              );
            } else if (articleCategory
                .contains(authController.categoryFilter.value)) {
              return Card(
                elevation: 10,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.child('article_image').value.toString()),
                          backgroundColor: AppColors.MAIN_COLOR,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Text(
                                snapshot.child('user_name').value.toString(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.check_circle_rounded,
                                color: Colors.blue,
                                size: 17,
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          snapshot.child('user_email').value.toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              snapshot
                                  .child('article_dateTime')
                                  .value
                                  .toString()
                                  .split(' ')[0],
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              snapshot
                                  .child('article_dateTime')
                                  .value
                                  .toString()
                                  .split(' ')[1],
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Text(
                          snapshot.child('article_category').value.toString(),
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        snapshot.child('article_text').value.toString(),
                        style: const TextStyle(),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          });
        },
      ),
    );
  }
}
