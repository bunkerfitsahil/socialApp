import 'package:get/get.dart';

import '../controllers/badges_screen_controller.dart';

class BadgesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BadgesScreenController>(
      () => BadgesScreenController(),
    );
  }
}
