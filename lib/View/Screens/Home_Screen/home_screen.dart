import 'package:blog/Utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Logic/Controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Feed"),
          centerTitle: true,
          backgroundColor: AppColors.MAIN_COLOR,
          actions: [
            IconButton(
              splashRadius: 25,
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("users").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return const Text("There is no Users");
              return ListView(children: getUsersItems(snapshot));
            }));
  }

  getUsersItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs
        .map(
          (doc) => ListTile(
            title: Text(doc["name"]),
            subtitle: Text(
              doc["email"].toString(),
            ),
          ),
        )
        .toList();
  }
}
