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
import 'package:social_feed_flutter/models/PostsResponseModel.dart';
import 'package:social_feed_flutter/utils/progress_dialog_utils.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  XFile? file;
  File? pickFile;
  CreatePostResp createPostResp = CreatePostResp();
  RxBool isImageSelected = false.obs;
  Rx<TextEditingController> postData = TextEditingController().obs;
  RxList<PostsList> allPostList = <PostsList>[].obs;
  RxBool hasPostData = false.obs;
  RxBool isLikeSuccess = false.obs;
  RxBool isImg = false.obs;
  ScrollController controller = ScrollController();
  RxList<PostsList> postList = <PostsList>[].obs;
  RxBool isLoading = false.obs;
  RxBool allLoaded = false.obs;

  late final ImagePicker? _picker;
  //EventBus eventBus = EventBus();
  @override
  void onInit() {
    super.onInit();
    _picker = ImagePicker();
    print("hhe");
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getPostData();
    });
  }

  @override
  void onReady() {
    super.onReady();
    print("hhe");
  }

  @override
  void onClose() {}

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
    List<PostsList> newData = allPostList.value.length >= 15
        ? []
        : List<PostsList>.generate(10, (index) => allPostList[index]).obs;
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

  void onCreatePostSuccess(resp) {
    ProgressDialogUtils.hideProgressDialog();
    createPostResp = CreatePostResp.fromJson(resp);
    print(createPostResp.organization.toString());
    isImageSelected.value = false;
    Fluttertoast.showToast(msg: "Post is SuccessFully added");

    getPostData();
  }

  void onCreatePostError(var err) {
    isImageSelected.value = false;
    print(err);
  }

  void onGetPostSuccess(resp) {
    ProgressDialogUtils.hideProgressDialog();
    hasPostData.value = true;
    List data = resp as List;

    allPostList.value = resp.map((e) => PostsList.fromJson(e)).toList();
  }

  void onGetSucessLikeCreate(resp) {
    if (resp != null) {}
  }

  void onGetPostError(err) {
    hasPostData.value = false;
  }

  void increment() => count.value++;
}
