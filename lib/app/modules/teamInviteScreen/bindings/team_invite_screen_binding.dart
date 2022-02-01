import 'package:get/get.dart';

import '../controllers/team_invite_screen_controller.dart';

class TeamInviteScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamInviteScreenController>(
      () => TeamInviteScreenController(),
    );
  }
}
