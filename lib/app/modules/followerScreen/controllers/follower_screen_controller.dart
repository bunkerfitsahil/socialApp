import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/ApiClient/api_client.dart';
import 'package:social_feed_flutter/models/FollowingDataModel.dart';

class FollowerScreenController extends GetxController {
  //TODO: Implement FollowerScreenController

  final count = 0.obs;
  RxBool seeMore = false.obs;
  RxInt totalCount = 2.obs;
  RxBool hasData = false.obs;
  RxList<FollowerDataModel> followerData = <FollowerDataModel>[].obs;

  @override
  void onInit() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // executes after build
      getFollowerData();
    });
    super.onInit();
  }

  onClickSeeMore() {
    seeMore.value = true;
    totalCount.value = followerData.value.length;
  }

  @override
  void onReady() {
    super.onReady();
  }

  getFollowerData({
    VoidCallback? successCall,
    VoidCallback? errCall,
  }) async {
    await ApiClient().callApiForGetFollowerData(
      onSuccess: (resp) {
        onGetDataSucess(resp);
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
    );
  }

  onGetDataSucess(resp) {
    List data = resp as List;
    hasData.value = true;
    followerData.value =
        data.map((e) => FollowerDataModel.fromJson(e)).toList();
    if (followerData.value.length <= 9) {
      totalCount.value = followerData.value.length;
    } else {
      totalCount.value = 9;
    }
    print(followerData);
  }

  onGetDataError(resp) {
    hasData.value = true;

    print("error");
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
