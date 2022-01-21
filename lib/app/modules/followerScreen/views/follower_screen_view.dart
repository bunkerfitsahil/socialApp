import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/math_utils.dart';

import '../controllers/follower_screen_controller.dart';

class FollowerScreenView extends GetWidget<FollowerScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: getSize(70, context),
                  color: const Color(0xff3ba27f),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Positioned(
                        left: getSize(20, context),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: getSize(32, context),
                                height: getSize(32, context),
                                decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: getSize(22, context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: getSize(32, context),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Text("Followers ",
                              style: TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontSize: getSize(18, context)),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    return Container(
                      padding: EdgeInsets.only(top: getSize(35, context)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getSize(15, context)),
                        child: GridView.count(
                          //physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          childAspectRatio: 3 / 3.3,
                          mainAxisSpacing: getSize(12, context),
                          //crossAxisSpacing: getSize(0, context),
                          children: List.generate(
                            controller.totalCount.value,
                            (index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: Duration(milliseconds: 500),
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.red,
                                          radius: getSize(54, context),
                                          backgroundImage:
                                              AssetImage(Assets.avtar),
                                        ),
                                        SizedBox(
                                          height: getSize(8, context),
                                        ),
                                        Text(
                                          "Mahi",
                                          style: TextStyle(
                                              color: const Color(0xff1c1414),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Roboto",
                                              fontStyle: FontStyle.normal,
                                              fontSize: getSize(16, context)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Obx(() {
                  if (controller.seeMore.value) {
                    return SizedBox();
                  }
                  return InkWell(
                    onTap: () {
                      controller.onClickSeeMore();
                    },
                    child: Container(
                      height: getSize(80, context),
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(30, context)),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: getSize(35, context),
                            width: double.infinity,
                            // color: Colors.grey,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(getSize(4, context)),
                              color: const Color(0xfff7f7f7),
                            ),
                            alignment: Alignment.center,
                            child: Text("See all ",
                                style: TextStyle(
                                    color: const Color(0xff1c1414),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto",
                                    fontStyle: FontStyle.normal,
                                    fontSize: getSize(15, context)),
                                textAlign: TextAlign.center),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
