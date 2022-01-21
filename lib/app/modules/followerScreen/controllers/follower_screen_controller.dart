import 'package:get/get.dart';

class FollowerScreenController extends GetxController {
  //TODO: Implement FollowerScreenController

  final count = 0.obs;
  RxBool seeMore = false.obs;
  RxInt totalCount = 2.obs;

  @override
  void onInit() {
    totalCount.value = 9;

    super.onInit();
  }

  onClickSeeMore() {
    seeMore.value = true;
    totalCount.value = 24;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
