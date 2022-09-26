import 'package:blog/Utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Logic/Controllers/auth_controller.dart';
import 'Widgets/search_textField.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE_COLOR,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Search"),
        centerTitle: true,
        backgroundColor: AppColors.MAIN_COLOR,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
            child: SearchTextField(),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const  Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("There is no users"));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
             return Obx(() {
               var data = snapshot.data!.docs[index];
               if (authController.searchKey.value.isEmpty) {
                 return Container();
               }
               if (data['name']
                   .toString()
                   .toLowerCase()
                   .startsWith(authController.searchKey.value.toLowerCase())||data['email']
                   .toString()
                   .toLowerCase()
                   .startsWith(authController.searchKey.value.toLowerCase())) {
                 return ListTile(
                   leading: CircleAvatar(
                     backgroundColor: AppColors.MAIN_COLOR,
                     backgroundImage: NetworkImage(data["image"]??"https://th.bing.com/th/id/R.88f4f67fe36423a9f099e32757f61acc?rik=CLtRO2eGANx4Vw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_329115.png&ehk=mXoK%2be700RIpbejgADkfZYJSnzVqJhHHmQWdguPy40k%3d&risl=&pid=ImgRaw&r=0"),
                   ),
                   title: Text(data["name"]),
                   subtitle: Text(
                     data["email"].toString(),
                   ),
                 );
               }
               return Container();
               // return ListTile(
               //   title: Text(data["name"]),
               //   subtitle: Text(
               //     data["email"].toString(),
               //   ),
               // );

             });
            },
          );
        },
      ),
    );
  }
}
