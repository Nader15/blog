import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Utils/app_colors.dart';
import '../../../../Logic/Controllers/auth_controller.dart';

class TagsModel {
  final String title;

  TagsModel(this.title);
}

List<TagsModel> tagsList = [
  TagsModel("Sports"),
  TagsModel("Movies"),
];

tagsBottomSheet(BuildContext context) {
  final authController = Get.find<AuthController>();
  return Get.bottomSheet(
      isScrollControlled: true,
      Container(
        decoration: const BoxDecoration(
          color: AppColors.WHITE_COLOR,
        ),
        // height: AppConstants.mediaHeight(context) / 1.3,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 40),
            child: ListView.separated(
              itemCount: tagsList.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  onTap: () {
                    authController.tags.value= tagsList[index].title;
                    Get.back();
                  },
                  title: Text(tagsList[index].title),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.DARK_GREY_COLOR,
                );
              },
            ),
          ),
        ),
      ));
}
