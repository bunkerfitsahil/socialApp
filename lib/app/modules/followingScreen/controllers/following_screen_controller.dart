import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/ApiClient/api_client.dart';
import 'package:social_feed_flutter/models/FollowingDataModel.dart';

class FollowingScreenController extends GetxController {
  //TODO: Implement FollowingScreenController

  final count = 0.obs;
  RxBool seeMore = false.obs;
  RxInt totalCount = 2.obs;
  RxBool hasData = false.obs;
  RxList<FollowerDataModel> followingData = <FollowerDataModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    //totalCount.value = 9;
    //
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getFollowingData();
    });
  }

  onClickSeeMore() {
    seeMore.value = true;
    totalCount.value = followingData.value.length;
  }

  getFollowingData({
    VoidCallback? successCall,
    VoidCallback? errCall,
  }) async {
    await ApiClient().callApiForGetFollowingData(
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
    followingData.value =
        data.map((e) => FollowerDataModel.fromJson(e)).toList();
    if (followingData.value.length <= 9) {
      totalCount.value = followingData.value.length;
    } else {
      totalCount.value = 9;
    }
    print(followingData);
  }

  onGetDataError(resp) {
    hasData.value = true;

    print("error");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
