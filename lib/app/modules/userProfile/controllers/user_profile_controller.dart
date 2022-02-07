import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/ApiClient/api_client.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/argumentConstant.dart';
import 'package:social_feed_flutter/models/PostsResponseModel.dart';
import 'package:social_feed_flutter/models/userDataModel.dart';
import 'package:social_feed_flutter/utils/progress_dialog_utils.dart';

class UserProfileController extends GetxController {
  final count = 0.obs;
  UserDataModel? userDataResp;
  RxBool hasData = false.obs;
  int userId = Get.arguments[Argument.userId];
  ScrollController scrollController = ScrollController();
  RxList<PostsList> newPostList = <PostsList>[].obs;

  RxList<PostsList> allPostList = <PostsList>[].obs;
  RxBool isLikeSuccess = false.obs;
  RxBool isLoading = false.obs;
  RxBool allLoaded = false.obs;
  bool isLogInUser = Get.arguments[Argument.isLoginUser];
  RxString? followStatus = "Follow".obs;
  RxBool hasPostData = false.obs;
  RxInt page = 1.obs;
  RxInt totalPostLength = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getUserData();
    mokeFetch();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !allLoaded.value) {
        mokeFetch();
      }
    });
  }

  mokeFetch() async {
    if (allLoaded.value) {
      return;
    }
    isLoading.value = true;
    await Future.delayed(Duration(milliseconds: 500));
    await getPostData();
    List<PostsList> newData = newPostList.value;
    if (newData.isNotEmpty) {
      allPostList.value.addAll(newData);
      print(allPostList.value.length);
      if (totalPostLength <= allPostList.value.length) {
        allLoaded.value = true;
      } else {
        page.value = page.value + 1;
      }
    }
    isLoading.value = false;
  }

  getUserData({
    VoidCallback? successCall,
    VoidCallback? errCall,
  }) async {
    await ApiClient().callApiForGetUsersData(
      onSuccess: (resp) {
        onGetDataSuccess(resp);
        if (successCall != null) {
          successCall();
        }
      },
      onError: (err) {
        onGetDataError(err);
        if (errCall != null) {
          errCall();
        }
      },
      id: userId,
    );
  }

  createPostLike({
    VoidCallback? successCall,
    VoidCallback? errCall,
    int? id,
  }) async {
    await ApiClient().callApiForPostLike(
      onSuccess: (resp) {
        if (successCall != null && resp != null) {
          getPostData();

          isLikeSuccess.value = true;
          successCall();
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

  goToUserProfileScreen({int? id, bool? isLoginUser = false}) {
    Get.toNamed(Routes.USER_PROFILE, arguments: {
      Argument.userId: id,
      Argument.isLoginUser: isLoginUser,
    });
  }

  getPostData({
    VoidCallback? successCall,
    VoidCallback? errCall,
    bool isLoad = true,
  }) async {
    await ApiClient().callApiForGetPostsById(
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
        isLoad: false,
        page: page.value,
        id: 2);
  }

  createFollowRequest({
    VoidCallback? successCall,
    VoidCallback? errCall,
  }) async {
    await ApiClient().callApiForSendRequest(
      onSuccess: (resp) {
        if (resp != null) {
          followStatus!.value = "Request Pending";
          Fluttertoast.showToast(msg: "request already sent.");
        }

        if (successCall != null) {
          successCall();
        }
      },
      onError: (err) {
        if (errCall != null) {
          errCall();
        }
      },
      id: userId,
    );
  }

  void onGetPostSuccess(resp) {
    ProgressDialogUtils.hideProgressDialog();
    hasPostData.value = true;
    Map<String, dynamic> data = resp as Map<String, dynamic>;
    print(resp);

    PostDataModel postDataModel = PostDataModel.fromJson(data);
    totalPostLength.value = postDataModel.count!;

    //allPostList.value = postDataModel.results!;
    newPostList.value = postDataModel.results!;
  }

  void onGetPostError(err) {
    hasPostData.value = true;
  }

  void onGetDataSuccess(resp) {
    //ProgressDialogUtils.hideProgressDialog();
    userDataResp = UserDataModel.fromJson(resp);
    hasData.value = true;
    if (userDataResp!.followRequestStatus == "No follow request yet") {
      followStatus!.value = "Follow";
    } else if (userDataResp!.followRequestStatus == "Following") {
      followStatus!.value = "Unfollow";
    } else {
      followStatus!.value = "Request Pending";
    }

    print(userDataResp?.firstName);

    //Fluttertoast.showToast(msg: "Post is SuccessFully added");
  }

  void onGetDataError(var err) {
    hasData.value = true;

    print(err);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
