import 'package:get/get.dart';

import '../Logic/Bindings/auth_binding.dart';
import '../Logic/Bindings/main_page_binding.dart';
import '../View/Screens/Home_Screen/home_screen.dart';
import '../View/Screens/Login_Screen/login_screen.dart';
import '../View/Screens/Main_Page/main_page.dart';
import '../View/Screens/Register_Screen/register_screen.dart';
import '../View/Screens/Splash_Screen/splash_screen.dart';

class AppRoutes {
  //initialRoute
  static const splashScreen = Routes.splashScreen;
  static const loginScreen = Routes.loginScreen;
  static const homeScreen = Routes.homeScreen;
  static const registerScreen = Routes.registerScreen;
  static const mainScreen = Routes.mainScreen;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: AuthBinding()
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainPage(),
      bindings: [
        AuthBinding(),
        MainPageBinding(),
      ],
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.registerScreen,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
    ),

  ];
}

class Routes {
  static const splashScreen = '/splashScreen';
  static const loginScreen = '/loginScreen';
  static const registerScreen = '/registerScreen';
  static const homeScreen = '/homeScreen';
  static const mainScreen = '/mainScreen';

}
