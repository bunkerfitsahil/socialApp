import 'package:get/get.dart';

import 'package:social_feed_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:social_feed_flutter/app/modules/home/views/home_view.dart';
import 'package:social_feed_flutter/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/splashScreen/views/splash_screen_view.dart';
import 'package:social_feed_flutter/app/modules/userProfile/bindings/user_profile_binding.dart';
import 'package:social_feed_flutter/app/modules/userProfile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
    ),
  ];
}
