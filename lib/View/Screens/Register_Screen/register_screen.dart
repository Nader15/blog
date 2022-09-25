import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Logic/Controllers/auth_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../Widgets/titled_textField.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE_COLOR,
      appBar: AppBar(
        backgroundColor: AppColors.APPBAR_COLOR,
        centerTitle: true,
        elevation: 1,
        title: Text(
          "Register",
          style: const TextStyle(color: AppColors.BLACK_COLOR, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 36),
            const Center(
              child: Hero(
                tag: 'logo',
                child: Icon(
                  Icons.article,
                  color: AppColors.MAIN_COLOR,
                  size: 100,
                ),
              ),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitledTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: userNameController,
                    title: "User name",
                  ),
                  const SizedBox(height: 20),
                  TitledTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    title: "Email",
                  ),
                  const SizedBox(height: 20),
                  TitledTextField(
                    controller: passwordController,
                    title: "Password",
                    suffixIcon: IconButton(
                      splashRadius: 20,
                      onPressed: () {},
                      icon: Icon(
                        Icons.visibility_off_outlined,
                        color: AppColors.GREY_SHADE_COLOR,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Obx(() => ConditionalBuilder(
                    condition: !authController.isLoading.value,
                    builder: (context) => SizedBox(
                      width: AppConstants.mediaWidth(context),
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.MAIN_COLOR,
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            AppColors.BLACK_COLOR,
                          ),
                        ),
                        onPressed: () {
                          authController.signUpUsingFirebase(name: userNameController.text,email: emailController.text,password: passwordController.text);
                        },
                        child: Text("Register"),
                      ),
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.MAIN_COLOR,
                      ),
                    ),
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
