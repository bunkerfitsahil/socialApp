import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_feed_flutter/ApiClient/api_client.dart';
import 'package:social_feed_flutter/app/modules/home/post_create_model.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/argumentConstant.dart';
import 'package:social_feed_flutter/models/PostLikeResponseModel.dart';
import 'package:social_feed_flutter/models/PostsResponseModel.dart';
import 'package:social_feed_flutter/utils/progress_dialog_utils.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  //TODO: Implement HomeController

  final count = 0.obs;
  XFile? file;
  File? pickFile;
  CreatePostResp createPostResp = CreatePostResp();
  RxBool isImageSelected = false.obs;
  Rx<TextEditingController> postData = TextEditingController().obs;

  List<PostsList> allPostList = <PostsList>[].obs;
  RxList<PostsList> newPostList = <PostsList>[].obs;
  RxBool hasPostData = false.obs;
  RxBool isLikeSuccess = false.obs;
  RxBool isImg = false.obs;
  ScrollController scrollController = ScrollController();
  RxList<PostsList> postList = <PostsList>[].obs;
  RxBool isLoading = false.obs;
  RxBool allLoaded = false.obs;
  RxInt page = 1.obs;
  RxInt totalPostLength = 0.obs;

  late final ImagePicker? _picker;
  //EventBus eventBus = EventBus();
  @override
  void onInit() {
    super.onInit();
    _picker = ImagePicker();
    WidgetsBinding.instance!.addObserver(this);
    print("hhe");
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      mokeFetch();
      scrollController.addListener(() {
        if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent &&
            !allLoaded.value) {
          mokeFetch();
        }
      });
      //getPostData();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // These are the callbacks
    switch (state) {
      case AppLifecycleState.resumed:
        update();
        break;
      case AppLifecycleState.inactive:
        // widget is inactive
        break;
      case AppLifecycleState.paused:
        // widget is paused
        break;
      case AppLifecycleState.detached:
        // widget is detached
        break;
    }
  }

  @override
  void onReady() {
    super.onReady();
    print("hhe");
  }

  @override
  void onClose() {
    scrollController.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  goToUserProfileScreen({int? id, bool? isLoginUser = false}) {
    Get.toNamed(Routes.USER_PROFILE, arguments: {
      Argument.userId: id,
      Argument.isLoginUser: isLoginUser,
    });
  }

  getImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpeg', 'png', 'gif', 'mp4']);
    // var res = await ImagePicker()
    //   ..pickImage(source: ImageSource.gallery);
    if (result != null) {
      // Fluttertoast.showToast(msg: "Image is Selected.");
      isImageSelected.value = true;
      //file = res.;
      Fluttertoast.showToast(msg: "Post is selected");
      isImg = result.paths.first!.isImageFileName.obs;
      pickFile = File(result.paths.first!);
      //print(file);
    }
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
      allPostList.addAll(newData);
      print(allPostList.length);
      if (totalPostLength <= allPostList.length) {
        allLoaded.value = true;
      } else {
        page.value = page.value + 1;
      }
    }
    update();
    isLoading.value = false;
  }

  onClickPostButton({
    VoidCallback? successCall,
    VoidCallback? errCall,
  }) async {
    await ApiClient().callPostCreateApi(
        onSuccess: (resp) {
          onCreatePostSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreatePostError(err);
          if (errCall != null) {
            errCall();
          }
        },
        file: pickFile,
        discription: postData.value.text,
        fileType: (isImg.value) ? "Image" : "Video");
  }

  getPostData({
    VoidCallback? successCall,
    VoidCallback? errCall,
    bool isLoad = true,
  }) async {
    await ApiClient().callApiForGetPosts(
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
        page: page.value);
  }

  createPostLike({
    VoidCallback? successCall,
    VoidCallback? errCall,
    int? id,
    PostsList? postDataModel,
  }) async {
    await ApiClient().callApiForPostLike(
      onSuccess: (resp) {
        if (successCall != null && resp != null) {
          postDataModel?.loggedInUserPostLikeId =
              PostLikeResponse.fromJson(resp).id;
          //getPostData();

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

  updateData() {
    update(allPostList);
    print(allPostList[2].isLiked.toString());
    update();
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

  void onCreatePostSuccess(resp) {
    ProgressDialogUtils.hideProgressDialog();
    createPostResp = CreatePostResp.fromJson(resp);
    print(createPostResp.organization.toString());
    isImageSelected.value = false;
    Fluttertoast.showToast(msg: "Post is SuccessFully added");
    page.value = 1;
    hasPostData.value = false;
    allPostList.clear();
    mokeFetch();
  }

  void onCreatePostError(var err) {
    isImageSelected.value = false;
    print(err);
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

  void onGetSucessLikeCreate(resp) {
    if (resp != null) {}
  }

  void onGetPostError(err) {
    hasPostData.value = true;
  }

  void increment() => count.value++;
}
