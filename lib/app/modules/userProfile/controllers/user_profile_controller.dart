import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/ApiClient/api_client.dart';
import 'package:social_feed_flutter/constants/argumentConstant.dart';
import 'package:social_feed_flutter/models/userDataModel.dart';

class UserProfileController extends GetxController {
  final count = 0.obs;
  UserDataModel? userDataResp;
  RxBool hasData = false.obs;
  int userId = Get.arguments[Argument.userId];

  @override
  void onInit() {
    super.onInit();
    getUserData();
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

  void onGetDataSuccess(resp) {
    //ProgressDialogUtils.hideProgressDialog();
    userDataResp = UserDataModel.fromJson(resp);
    hasData.value = true;

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
