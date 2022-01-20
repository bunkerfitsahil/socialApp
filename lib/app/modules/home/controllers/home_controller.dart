import 'package:get/get.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("hhe");
  }

  @override
  void onReady() {
    super.onReady();
    print("hhe");
  }

  @override
  void onClose() {}

  goToUserProfileScreen() {
    Get.toNamed(Routes.USER_PROFILE);
  }

  void increment() => count.value++;
}
