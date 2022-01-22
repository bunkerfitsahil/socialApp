import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_feed_flutter/ApiClient/api_client.dart';
import 'package:social_feed_flutter/app/modules/home/post_create_model.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
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

  late final ImagePicker? _picker;
  @override
  void onInit() {
    super.onInit();
    _picker = ImagePicker();
    print("hhe");
    getPostData();
  }

  @override
  void onReady() {
    super.onReady();
    print("hhe");
  }

  @override
  void onClose() {}

  goToUserProfileScreen() {
    Get.toNamed(Routes.USER_PROFILE);
  }

  getImage() async {
    var res = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (res != null) {
      Fluttertoast.showToast(msg: "Image is Selected.");
      isImageSelected.value = true;
      file = res;
      Fluttertoast.showToast(msg: "Post is selected");

      pickFile = File(file!.path);
      print(file!);
    }
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
    );
  }

  getPostData({
    VoidCallback? successCall,
    VoidCallback? errCall,
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

  void onCreatePostSuccess(resp) {
    ProgressDialogUtils.hideProgressDialog();
    createPostResp = CreatePostResp.fromJson(resp);
    print(createPostResp.organization.toString());
    isImageSelected.value = false;
    getPostData();
    Fluttertoast.showToast(msg: "Post is SuccessFully added");
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

    //Fluttertoast.showToast(msg: "Post is SuccessFully added");
  }

  void onGetPostError(var err) {
    print(err);
  }

  void increment() => count.value++;
}
