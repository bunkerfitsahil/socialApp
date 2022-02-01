import 'package:get/get.dart';

class LeaderBoardScreenController extends GetxController {
  //TODO: Implement LeaderBoardScreenController

  final count = 0.obs;
  RxBool isIWon = true.obs;
  RxInt len = 5.obs;
  @override
  void onInit() {
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
