import 'dart:async';

import 'package:get/get.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 2),
      () => Get.offNamed(Routes.HOME),
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
