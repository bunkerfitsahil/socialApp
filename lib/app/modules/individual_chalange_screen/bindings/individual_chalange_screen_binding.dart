import 'package:get/get.dart';

import '../controllers/individual_chalange_screen_controller.dart';

class IndividualChalangeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndividualChalangeScreenController>(
      () => IndividualChalangeScreenController(),
    );
  }
}
