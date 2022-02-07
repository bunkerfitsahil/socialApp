import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/ApiClient/api_client.dart';
import 'package:social_feed_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:social_feed_flutter/constants/argumentConstant.dart';
import 'package:social_feed_flutter/models/PostLikeResponseModel.dart';
import 'package:social_feed_flutter/models/PostsResponseModel.dart';
import 'package:social_feed_flutter/models/postCommentModel.dart';

class PostDetailScreenController extends GetxController {
  final count = 0.obs;
  PostsList postData = Get.arguments[Argument.postData];
  RxBool hasPostData = false.obs;
  RxList<PostCommentsModel> postComments = <PostCommentsModel>[].obs;
  RxBool isLikeSuccess = false.obs;
  RxBool isLikeSuccessForComment = false.obs;
  Rx<TextEditingController> commentController = TextEditingController().obs;
  List<Replies> dummy = [];
  HomeController homeController = Get.find<HomeController>();
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
          if (resp != null) {
            onCreateCommentSuccess(resp);
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
        id: postData.id,
        message: commentController.value.text.toString(),
        parentId: null);
  }

  void onGetCommentSuccess(resp) {
    // ProgressDialogUtils.hideProgressDialog();
    hasPostData.value = true;
    List data = resp as List;

    postComments.value =
        data.map((e) => PostCommentsModel.fromJson(e)).toList();
  }

  createPostLike({
    VoidCallback? successCall,
    VoidCallback? errCall,
    int? id,
  }) async {
    await ApiClient().callApiForPostLike(
      onSuccess: (resp) {
        if (successCall != null && resp != null) {
          postData.loggedInUserPostLikeId = PostLikeResponse.fromJson(resp).id;
          postData.isLiked = true;
          for (var element in homeController.allPostList.value) {
            if (element.id == id) {
              element.loggedInUserPostLikeId =
                  PostLikeResponse.fromJson(resp).id;
              element.isLiked = true;
            }
          }

          homeController.updateData();
          isLikeSuccess.value = true;

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

  deletePostLike({
    VoidCallback? successCall,
    VoidCallback? errCall,
    int? id,
  }) async {
    await ApiClient().callApiForDeletePostLike(
      onSuccess: (resp) {
        if (successCall != null && resp != null) {
          isLikeSuccess.value = true;

          successCall();
          homeController.getPostData(isLoad: false);

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

  createCommentLike({
    VoidCallback? successCall,
    VoidCallback? errCall,
    int? id,
    PostCommentsModel? commentData,
  }) async {
    await ApiClient().callApiForCommentLike(
      onSuccess: (resp) {
        if (successCall != null && resp != null) {
          commentData!.commentLikeId = CommentLikeResponse.fromJson(resp).id;
          isLikeSuccessForComment.value = true;
          for (var element in homeController.allPostList.value) {
            if (element.id == id) {
              element.isLiked = false;
            }
          }

          homeController.updateData();
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

  getAllPostCommentReply(List<Replies> reply) {
    reply.forEach((element) {
      if (element.replies == null) {
        dummy.add(element);
      } else {
        getAllPostCommentReply(element.replies!);
      }
    });
    print(dummy);
  }

  void onCreateCommentFail(var err) {
    print(err);
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
