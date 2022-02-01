import 'package:get/get.dart';

import '../controllers/no_team_exist_alert_screen_controller.dart';

class NoTeamExistAlertScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoTeamExistAlertScreenController>(
      () => NoTeamExistAlertScreenController(),
    );
  }
}
