import 'package:blog/Routes/routes.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Logic/Controllers/auth_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../Widgets/titled_textField.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE_COLOR,
      appBar: AppBar(
        backgroundColor: AppColors.APPBAR_COLOR,
        centerTitle: true,
        elevation: 1,
        title: Text(
          "Login",
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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    title: "Email",
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 10,
                  ),
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
                          authController.logInUsingFirebase(email:emailController.text,password: passwordController.text);
                        },
                        child: Text("Login"),
                      ),
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.MAIN_COLOR,
                      ),
                    ),
                  ),),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have account?",
                        style: TextStyle(
                            color: AppColors.DARK_GREY_COLOR, fontSize: 12),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.registerScreen);
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: AppColors.MAIN_COLOR,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: IconButton(
                          splashRadius: 25,
                          onPressed: () {
                            authController.googleSignUp();
                          },
                          icon: Image.network(
                            "https://www.hostedincanada.com/wp-content/uploads/2019/04/143-1433268_gmail-icon-gmail-icon-png.png",
                            width: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
