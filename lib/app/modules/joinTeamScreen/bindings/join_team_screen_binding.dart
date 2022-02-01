import 'package:get/get.dart';

import '../controllers/join_team_screen_controller.dart';

class JoinTeamScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoinTeamScreenController>(
      () => JoinTeamScreenController(),
    );
  }
}
