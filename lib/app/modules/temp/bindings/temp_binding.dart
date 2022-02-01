import 'package:get/get.dart';

import '../controllers/temp_controller.dart';

class TempBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempController>(
      () => TempController(),
    );
  }
}
