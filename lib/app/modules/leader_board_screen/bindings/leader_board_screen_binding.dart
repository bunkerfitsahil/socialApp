import 'package:get/get.dart';

import '../controllers/leader_board_screen_controller.dart';

class LeaderBoardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaderBoardScreenController>(
      () => LeaderBoardScreenController(),
    );
  }
}
