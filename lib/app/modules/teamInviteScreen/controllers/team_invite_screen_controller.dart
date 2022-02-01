import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamInviteScreenController extends GetxController {
  //TODO: Implement TeamInviteScreenController

  final count = 0.obs;
  final RxList<TextEditingController> controllersList =
      <TextEditingController>[].obs;
  @override
  void onInit() {
    super.onInit();
    controllersList.add(TextEditingController());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
