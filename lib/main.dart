import 'package:blog/Logic/Controllers/auth_controller.dart';
import 'package:blog/View/Screens/Splash_Screen/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Logic/Bindings/auth_binding.dart';
import 'firebase_options.dart';
import 'Routes/routes.dart';
import 'Utils/app_colors.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: AppColors.BLACK_COLOR,
        ),
        fontFamily: "naskh_font",
      ),
      // initialBinding: AuthBinding(),
      // home: SplashScreen(),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.routes,
    );
  }
}
