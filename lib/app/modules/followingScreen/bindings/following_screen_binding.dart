import 'package:get/get.dart';

import '../controllers/following_screen_controller.dart';

class FollowingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowingScreenController>(
      () => FollowingScreenController(),
    );
  }
}
