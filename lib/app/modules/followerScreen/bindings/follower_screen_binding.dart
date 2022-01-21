import 'package:get/get.dart';

import '../controllers/follower_screen_controller.dart';

class FollowerScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowerScreenController>(
      () => FollowerScreenController(),
    );
  }
}
