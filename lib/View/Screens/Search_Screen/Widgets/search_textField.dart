import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Logic/Controllers/auth_controller.dart';
import '../../../../Utils/app_colors.dart';

class SearchTextField extends StatelessWidget {
   SearchTextField({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      cursorColor: AppColors.MAIN_COLOR,
      decoration: InputDecoration(
          fillColor: AppColors.WHITE_COLOR,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          hintText: 'Search for users',
          suffixIcon: const Icon(
            Icons.search,
            color: AppColors.BLACK_COLOR,
          ),
          hintStyle: const TextStyle(
              color: AppColors.BLACK_COLOR, fontSize: 13)),
      onChanged: (val) {
        authController.searchKey.value = val;
      },
    );
  }
}
