import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/dimention.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

import '../controllers/following_screen_controller.dart';

class FollowingScreenView extends GetWidget<FollowingScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Container(
            child: Column(
              children: [
                getTopBarSection(),
                (controller.hasData.value) ? getFollowingData() : SizedBox(),
                (controller.followingData.value.length <= 9)
                    ? SizedBox()
                    : Obx(() {
                        if (controller.seeMore.value) {
                          return SizedBox();
                        }
                        return seeMoreButton();
                      }),
              ],
            ),
          );
        }),
      ),
    );
  }

  getFollowingData() {
    return Expanded(
      child: Obx(() {
        return Container(
          padding: EdgeInsets.only(top: MySize.size78!),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MySize.getScaledSizeWidth(Dimens.d_30)),
            child: (controller.followingData.isEmpty)
                ? Center(
                    child: Text("No Data Found"),
                  )
                : GridView.count(
                    //physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 4,
                    mainAxisSpacing: MySize.size44!,
                    crossAxisSpacing: MySize.getScaledSizeWidth(Dimens.d_19),
                    children: List.generate(
                      controller.totalCount.value,
                      (i) {
                        return AnimationConfiguration.staggeredList(
                          position: i,
                          duration: Duration(milliseconds: 500),
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: MySize.size44,
                                    backgroundColor: AppColors.button_green,
                                    child: CachedNetworkImage(
                                      imageUrl: controller
                                          .followingData[i].profilePicture
                                          .toString(),
                                      placeholder: (context, url) =>
                                          SpinKitCircle(
                                        color: Colors.green,
                                        size: MySize.size20!,
                                      ),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        height: MySize.size88,
                                        width: MySize.size88,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(200),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        height: MySize.size88,
                                        width: MySize.size88,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(200),
                                          color: AppColors.button_green,
                                        ),
                                        child: Icon(
                                          Icons.person,
                                          color: AppColors.white,
                                          size: MySize.size40,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MySize.size8,
                                  ),
                                  Text(
                                    controller.followingData[i].firstName
                                        .toString(),
                                    style: TextStyle(
                                        color: AppColors.textBlackColor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: FontFamily.roboto,
                                        fontStyle: FontStyle.normal,
                                        fontSize: MySize.size16),
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
    );
  }

  getTopBarSection() {
    return Container(
      height: MySize.size70,
      color: AppColors.button_green,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            left: MySize.getScaledSizeWidth(Dimens.d_20),
            child: Container(
              height: MySize.getScaledSizeHeight(31.2),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: MySize.getScaledSizeWidth(Dimens.d_28),
                      height: MySize.size28,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(Dimens.d_50)),
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
              width: MySize.screenWidth,
              alignment: Alignment.center,
              child: Text("Followings ",
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
    );
  }

  seeMoreButton() {
    return InkWell(
      onTap: () {
        controller.onClickSeeMore();
      },
      child: Container(
        height: MySize.size80,
        padding: EdgeInsets.symmetric(
            horizontal: MySize.getScaledSizeWidth(Dimens.d_30)),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MySize.size41,
              width: double.infinity,
              // color: Colors.grey,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MySize.size4!),
                color: AppColors.backChalangeColor,
              ),
              alignment: Alignment.center,
              child: Text("See all ",
                  style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.roboto,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size15),
                  textAlign: TextAlign.center),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
