import 'package:get/get.dart';

import '../controllers/participation_screen_controller.dart';

class ParticipationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParticipationScreenController>(
      () => ParticipationScreenController(),
    );
  }
}
