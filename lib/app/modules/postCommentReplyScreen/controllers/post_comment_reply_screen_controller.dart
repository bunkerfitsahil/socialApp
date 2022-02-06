import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/ApiClient/api_client.dart';
import 'package:social_feed_flutter/app/modules/postDetailScreen/controllers/post_detail_screen_controller.dart';
import 'package:social_feed_flutter/constants/argumentConstant.dart';
import 'package:social_feed_flutter/models/postCommentModel.dart';

class PostCommentReplyScreenController extends GetxController {
  //TODO: Implement PostCommentReplyScreenController

  final count = 0.obs;
  Rx<TextEditingController> commentController = TextEditingController().obs;

  Rx<PostCommentsModel> postCommentsModel = Get.arguments[Argument.commentData];
  RxBool isLikeSuccessForComment = false.obs;
  PostDetailScreenController postDetailScreenController =
      Get.find<PostDetailScreenController>();

  @override
  void onInit() {
    super.onInit();
  }

  addCommentsData({
    VoidCallback? successCall,
    VoidCallback? errCall,
  }) async {
    await ApiClient().callApiForCreatePostsComment(
        onSuccess: (resp) async {
          if (resp != null) {
            onCreateCommentSuccess(resp);
            await postDetailScreenController.getpostCommentsData();
            postDetailScreenController.postComments.forEach((element) {
              if (element.id == postCommentsModel.value.id) {
                postCommentsModel.value = element;
              }
              update();
            });
          }
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
        id: postCommentsModel.value.post,
        message: commentController.value.text.toString(),
        parentId: postCommentsModel.value.id);
  }

  void onCreateCommentFail(var err) {
    print(err);
  }

  void onCreateCommentSuccess(resp) {
    // ProgressDialogUtils.hideProgressDialog();
    // hasPostData.value = true;
    // List data = resp as List;

    Fluttertoast.showToast(msg: "Reply is SuccessFully added");
    postCommentsModel.value.numberOfReplies =
        postCommentsModel.value.numberOfReplies! + 1;
    //getpostCommentsData();
  }

  createCommentLike({
    VoidCallback? successCall,
    VoidCallback? errCall,
    int? id,
    PostCommentsModel? commentData,
  }) async {
    await ApiClient().callApiForCommentLike(
      onSuccess: (resp) {
        if (successCall != null && resp != null) {
          // commentData!.commentLikeId = CommentLikeResponse.fromJson(resp).id;
          isLikeSuccessForComment.value = true;

          successCall();

          //HomeController().postData();

          print("sucess");
        }
      },
      onError: (err) {
        if (errCall != null) {
          errCall();
        }
      },
      id: id,
    );
  }

  CreateCommentDelete({
    VoidCallback? successCall,
    VoidCallback? errCall,
    int? id,
  }) async {
    await ApiClient().callApiForDeleteCommentLike(
      onSuccess: (resp) {
        if (successCall != null && resp != null) {
          isLikeSuccessForComment.value = true;

          successCall();
          //homeController.getPostData(isLoad: false);

          print("sucess");
        }
      },
      onError: (err) {
        if (errCall != null) {
          errCall();
        }
      },
      id: id,
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
