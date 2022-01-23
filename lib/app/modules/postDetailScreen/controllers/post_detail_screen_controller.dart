import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/ApiClient/api_client.dart';
import 'package:social_feed_flutter/constants/argumentConstant.dart';
import 'package:social_feed_flutter/models/PostsResponseModel.dart';
import 'package:social_feed_flutter/models/postCommentModel.dart';
import 'package:social_feed_flutter/utils/progress_dialog_utils.dart';

class PostDetailScreenController extends GetxController {
  //TODO: Implement PostDetailScreenController

  final count = 0.obs;
  PostsList postData = Get.arguments[Argument.postData];
  RxBool hasPostData = false.obs;
  RxList<PostCommentsModel> postComments = <PostCommentsModel>[].obs;
  @override
  void onInit() {
    getpostCommentsData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getpostCommentsData({
    VoidCallback? successCall,
    VoidCallback? errCall,
  }) async {
    await ApiClient().callApiForGetPostsComment(
      onSuccess: (resp) {
        onGetPostSuccess(resp);
        if (successCall != null) {
          successCall();
        }
      },
      onError: (err) {
        onGetPostError(err);
        if (errCall != null) {
          errCall();
        }
      },
      id: postData.id,
    );
  }

  void onGetPostSuccess(resp) {
    ProgressDialogUtils.hideProgressDialog();
    hasPostData.value = true;
    List data = resp as List;

    postComments.value =
        resp.map((e) => PostCommentsModel.fromJson(e)).toList();

    //Fluttertoast.showToast(msg: "Post is SuccessFully added");
  }

  void onGetPostError(var err) {
    print(err);
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
