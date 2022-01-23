import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/ApiClient/api_client.dart';
import 'package:social_feed_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:social_feed_flutter/constants/argumentConstant.dart';
import 'package:social_feed_flutter/models/PostsResponseModel.dart';
import 'package:social_feed_flutter/models/postCommentModel.dart';

class PostDetailScreenController extends GetxController {
  //TODO: Implement PostDetailScreenController

  final count = 0.obs;
  PostsList postData = Get.arguments[Argument.postData];
  RxBool hasPostData = false.obs;
  RxList<PostCommentsModel> postComments = <PostCommentsModel>[].obs;
  Rx<TextEditingController> commentController = TextEditingController().obs;

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
        onGetCommentSuccess(resp);
        if (successCall != null) {
          successCall();
        }
      },
      onError: (err) {
        onGetCommentError(err);
        if (errCall != null) {
          errCall();
        }
      },
      id: postData.id,
    );
  }

  addCommentsData({
    VoidCallback? successCall,
    VoidCallback? errCall,
  }) async {
    await ApiClient().callApiForCreatePostsComment(
        onSuccess: (resp) {
          onCreateCommentSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreateCommentFail(err);
          if (errCall != null) {
            errCall();
          }
        },
        id: postData.id,
        message: commentController.value.text.toString());
  }

  void onGetCommentSuccess(resp) {
    // ProgressDialogUtils.hideProgressDialog();
    hasPostData.value = true;
    List data = resp as List;

    postComments.value =
        resp.map((e) => PostCommentsModel.fromJson(e)).toList();

    //Fluttertoast.showToast(msg: "Post is SuccessFully added");
  }

  void onGetCommentError(var err) {
    print(err);
  }

  void onCreateCommentSuccess(resp) {
    // ProgressDialogUtils.hideProgressDialog();
    // hasPostData.value = true;
    // List data = resp as List;

    Fluttertoast.showToast(msg: "Comment is SuccessFully added");
    getpostCommentsData();
    HomeController().postData();
  }

  void onCreateCommentFail(var err) {
    print(err);
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
