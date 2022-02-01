import 'package:get/get.dart';

import '../controllers/team_chalange_detail_screen_controller.dart';

class TeamChalangeDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamChalangeDetailScreenController>(
      () => TeamChalangeDetailScreenController(),
    );
  }
}
