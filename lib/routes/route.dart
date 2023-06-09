import 'package:get/get.dart';
import 'package:task/view/home_screen.dart';

import '../view/login_screen.dart';
import '../view/register_screen.dart';
import 'app_route.dart';

class AppRoutes {
  static final getPages = [
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300)
    ),
    GetPage(
      name: Routes.register,
      page: () =>  RegisterScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300)
    ),
    GetPage(
        name: Routes.home,
        page: () =>  HomeScreen(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 300)
    ),
  ];
}
