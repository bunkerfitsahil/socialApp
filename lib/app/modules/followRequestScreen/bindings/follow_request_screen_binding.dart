import 'package:get/get.dart';

import '../controllers/follow_request_screen_controller.dart';

class FollowRequestScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowRequestScreenController>(
      () => FollowRequestScreenController(),
    );
  }
}
