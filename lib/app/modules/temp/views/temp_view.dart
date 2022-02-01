import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';

import '../controllers/temp_controller.dart';

class TempView extends GetView<TempController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.INDIVIDUAL_CHALANGE_SCREEN);
                },
                child: Text("Individual Challange"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.TEAM_CHALANGE_DETAIL_SCREEN);
                },
                child: Text("Group Challange"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
