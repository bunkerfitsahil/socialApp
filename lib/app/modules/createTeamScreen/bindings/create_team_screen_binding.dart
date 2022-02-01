import 'package:get/get.dart';

import '../controllers/create_team_screen_controller.dart';

class CreateTeamScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTeamScreenController>(
      () => CreateTeamScreenController(),
    );
  }
}
