import 'dart:async';

import 'package:blog/Logic/Controllers/auth_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Routes/routes.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashScreen> {
  late Timer timer;

  void _goNext() => AuthController().auth.currentUser != null
      ? Get.offAllNamed(Routes.mainScreen)
      : Get.offAllNamed(Routes.loginScreen);

  startDelay() {
    timer = Timer(const Duration(seconds: 3), _goNext);
  }

  @override
  void initState() {
    startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.WHITE_COLOR,
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Icon(
            Icons.article,
            color: AppColors.MAIN_COLOR,
            size: 100,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
