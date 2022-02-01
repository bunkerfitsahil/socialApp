import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/constants/argumentConstant.dart';

class CreateTeamScreenController extends GetxController {
  //TODO: Implement CreateTeamScreenController
  RxBool isModify = false.obs;
  bool getModify =
      (Get.arguments != null) ? Get.arguments[Argument.modify] : false;
  final count = 0.obs;
  final RxList<TextEditingController> controllersList =
      <TextEditingController>[].obs;
  @override
  void onInit() {
    if (getModify) {
      print("hello");
      controllersList.add(TextEditingController());
      isModify.value = true;
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
