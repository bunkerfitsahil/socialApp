import 'package:get/get.dart';

import '../controllers/single_team_detail_screen_controller.dart';

class SingleTeamDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleTeamDetailScreenController>(
      () => SingleTeamDetailScreenController(),
    );
  }
}
