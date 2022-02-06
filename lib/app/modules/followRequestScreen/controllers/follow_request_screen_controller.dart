import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/ApiClient/api_client.dart';
import 'package:social_feed_flutter/models/PendingRequestModel.dart';

class FollowRequestScreenController extends GetxController {
  //TODO: Implement FollowRequestScreenController

  final count = 0.obs;
  RxList<PendingDataModel>? pendingData = <PendingDataModel>[].obs;
  RxBool hasData = false.obs;
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // executes after build
      getPendindRequestData();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  getPendindRequestData({
    VoidCallback? successCall,
    VoidCallback? errCall,
  }) async {
    await ApiClient().callApiForGetPendingRequest(
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

  createAcceptOrDecline(
      {VoidCallback? successCall,
      VoidCallback? errCall,
      String? acceptOrDecline,
      int? follow_id}) async {
    String ms = (acceptOrDecline == "ACCEPTED") ? "ACCEPTED" : "DECLINED";
    await ApiClient().callApiForAceepOrRejectRequest(
        onSuccess: (resp) {
          if (resp != null) {
            Fluttertoast.showToast(msg: "Request $ms");
            getPendindRequestData();
          }
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
        id: follow_id,
        acceptOrReject: acceptOrDecline);
  }

  onGetDataSucess(resp) {
    List data = resp as List;
    hasData.value = true;
    pendingData!.value = data.map((e) => PendingDataModel.fromJson(e)).toList();
    print(pendingData);
  }

  onGetDataError(resp) {
    hasData.value = true;

    print("error");
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
