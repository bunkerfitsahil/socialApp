import 'package:get/get.dart';

import 'package:social_feed_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:social_feed_flutter/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
