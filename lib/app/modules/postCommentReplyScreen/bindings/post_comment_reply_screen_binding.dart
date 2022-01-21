import 'package:get/get.dart';

import '../controllers/post_comment_reply_screen_controller.dart';

class PostCommentReplyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostCommentReplyScreenController>(
      () => PostCommentReplyScreenController(),
    );
  }
}
