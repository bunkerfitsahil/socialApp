import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/math_utils.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

import '../controllers/following_screen_controller.dart';

class FollowingScreenView extends GetWidget<FollowingScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MySize.size70,
                color: AppColors.button_green,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Positioned(
                      left: MySize.getScaledSizeWidth(20.5),
                      child: Container(
                        height: MySize.getScaledSizeHeight(31.2),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: MySize.getScaledSizeWidth(28),
                                height: MySize.size28,
                                decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: MySize.size13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: MySize.getScaledSizeHeight(31.2),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Text("Following",
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamily.robotoMedium,
                                fontStyle: FontStyle.normal,
                                fontSize: MySize.size18),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  return Container(
                    padding: EdgeInsets.only(top: MySize.size78!),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MySize.getScaledSizeWidth(30)),
                      child: GridView.count(
                        //physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: 3 / 4,
                        mainAxisSpacing: MySize.size44!,
                        crossAxisSpacing: MySize.getScaledSizeWidth(19),
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
                                        radius: MySize.size44,
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
                    height: MySize.size80,
                    padding: EdgeInsets.symmetric(
                        horizontal: MySize.getScaledSizeWidth(30)),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: MySize.size41,
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
    );
  }
}
