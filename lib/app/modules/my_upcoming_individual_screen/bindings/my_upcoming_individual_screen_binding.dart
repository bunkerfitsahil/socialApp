import 'package:get/get.dart';

import '../controllers/my_upcoming_individual_screen_controller.dart';

class MyUpcomingIndividualScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyUpcomingIndividualScreenController>(
      () => MyUpcomingIndividualScreenController(),
    );
  }
}
