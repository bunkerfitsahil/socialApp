import 'package:get/get.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';

class TeamChalangeDetailScreenController extends GetxController {
  //TODO: Implement TeamChalangeDetailScreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  onClickCreateteam() {
    Get.toNamed(Routes.CREATE_TEAM_SCREEN);
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
