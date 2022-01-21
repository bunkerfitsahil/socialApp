import 'package:get/get.dart';

class FollowingScreenController extends GetxController {
  //TODO: Implement FollowingScreenController

  final count = 0.obs;
  RxBool seeMore = false.obs;
  RxInt totalCount = 2.obs;
  @override
  void onInit() {
    super.onInit();
    totalCount.value = 9;
    //update();
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
