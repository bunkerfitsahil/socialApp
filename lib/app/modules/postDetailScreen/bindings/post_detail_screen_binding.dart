import 'package:get/get.dart';

import '../controllers/post_detail_screen_controller.dart';

class PostDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostDetailScreenController>(
      () => PostDetailScreenController(),
    );
  }
}
