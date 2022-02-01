import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

import '../controllers/leader_board_screen_controller.dart';

class LeaderBoardScreenView extends GetWidget<LeaderBoardScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              getTopAppbarSection(),
              getChallangeDetail(),
              SizedBox(
                height: MySize.size20,
              ),
              getLeaderBoardSection(),
              SizedBox(
                height: MySize.size6,
              ),
              Expanded(
                child: getLeaderBoardRankList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container getTopAppbarSection() {
    return Container(
      height: MySize.size70,
      color: AppColors.blueButtonColor,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            left: MySize.getScaledSizeWidth(18),
            child: Container(
              height: MySize.getScaledSizeHeight(31.2),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: MySize.size28,
                      height: MySize.size28,
                      decoration: BoxDecoration(
                          color: AppColors.white,
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
              width: double.infinity,
              alignment: Alignment.center,
              child: Text("Leaderboard",
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.roboto,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size18),
                  textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }

  Container getChallangeDetail() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
          top: MySize.size14!, left: MySize.getScaledSizeWidth(18)),
      height: MySize.size76,
      color: AppColors.backChalangeColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Founder day Running Challenge",
              style: TextStyle(
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.robotoMedium,
                  fontStyle: FontStyle.normal,
                  fontSize: MySize.size18),
              textAlign: TextAlign.left),
          SizedBox(
            height: MySize.size6,
          ),
          Container(
            height: MySize.size16,
            padding: EdgeInsets.only(right: MySize.getScaledSizeWidth(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("November 12, 2022",
                    style: TextStyle(
                        color: AppColors.textGrayBlackColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.roboto,
                        fontStyle: FontStyle.normal,
                        fontSize: MySize.size12),
                    textAlign: TextAlign.left),
                Text("Total Team 26 ",
                    style: TextStyle(
                        color: AppColors.textGrayBlackColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.roboto,
                        fontStyle: FontStyle.normal,
                        fontSize: MySize.size12),
                    textAlign: TextAlign.left)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container getLeaderBoardSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MySize.getScaledSizeWidth(22),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MySize.size1,
            decoration: BoxDecoration(
              color: AppColors.textGrayBlackColor.withOpacity(0.6),
            ),
          ),
          SizedBox(
            height: MySize.getScaledSizeWidth(3.5),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MySize.getScaledSizeWidth(10),
                right: MySize.getScaledSizeWidth(35)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Rank",
                    style: TextStyle(
                        color: AppColors.textBlackColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamily.robotoBold,
                        fontStyle: FontStyle.normal,
                        fontSize: MySize.size14),
                    textAlign: TextAlign.center),
                SizedBox(
                  width: MySize.getScaledSizeWidth(67),
                ),
                Text("Team",
                    style: TextStyle(
                        color: AppColors.textBlackColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamily.robotoBold,
                        fontStyle: FontStyle.normal,
                        fontSize: MySize.size14),
                    textAlign: TextAlign.left),
                Spacer(),
                Text("Km",
                    style: TextStyle(
                        color: AppColors.textBlackColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamily.robotoBold,
                        fontStyle: FontStyle.normal,
                        fontSize: MySize.size14),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          SizedBox(
            height: MySize.getScaledSizeWidth(3.5),
          ),
          Container(
            width: double.infinity,
            height: MySize.size1,
            decoration: BoxDecoration(
              color: AppColors.textGrayBlackColor.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Container getLeaderBoardRankList() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MySize.getScaledSizeWidth(22),
      ),
      child: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              for (int i = 0; i < controller.len.value; i++)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MySize.size76,
                      decoration:
                          BoxDecoration(color: AppColors.color_FFF2F2F2),
                      padding: EdgeInsets.only(
                          left: MySize.getScaledSizeWidth(12.5),
                          right: MySize.getScaledSizeWidth(30)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${i + 1}",
                              style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.robotoBold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: MySize.size14),
                              textAlign: TextAlign.left),
                          SizedBox(
                            width: MySize.getScaledSizeWidth(25.5),
                          ),
                          CircleAvatar(
                            radius: MySize.size25,
                            backgroundColor: Colors.transparent,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://cdn.pixabay.com/photo/2021/12/18/06/01/sunset-6878021_960_720.jpg",
                              placeholder: (context, url) => SpinKitCircle(
                                color: Colors.green,
                                size: MySize.size25!,
                              ),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: MySize.size50,
                                width: MySize.size50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.white,
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: MySize.size50,
                                width: MySize.size50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.button_green,
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: AppColors.white,
                                  size: MySize.size24,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MySize.getScaledSizeWidth(12),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: MySize.size19,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Team 1",
                                          style: TextStyle(
                                              color: AppColors.textBlackColor,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontFamily.roboto,
                                              fontStyle: FontStyle.normal,
                                              fontSize: MySize.size14),
                                          textAlign: TextAlign.left),
                                      Text("24 Km",
                                          style: TextStyle(
                                              color: AppColors.textBlackColor,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontFamily.roboto,
                                              fontStyle: FontStyle.normal,
                                              fontSize: MySize.size14),
                                          textAlign: TextAlign.left)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MySize.size1,
                                ),
                                Text("Anupriya, Owner ",
                                    style: TextStyle(
                                        color: AppColors.textGray,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: FontFamily.roboto,
                                        fontStyle: FontStyle.normal,
                                        fontSize: MySize.size10),
                                    textAlign: TextAlign.left),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MySize.size6,
                    ),
                  ],
                ),
              Visibility(
                visible: controller.isIWon.value,
                child: InkWell(
                  onTap: () {
                    controller.isIWon.value = !controller.isIWon.value;
                    controller.len.value = 10;
                  },
                  child: Transform.rotate(
                    angle: pi / 2,
                    child: Icon(
                      Icons.double_arrow,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size16,
              ),
              Visibility(
                visible: controller.isIWon.value,
                child: Container(
                  width: double.infinity,
                  height: MySize.size76,
                  decoration: BoxDecoration(color: AppColors.blueButtonColor),
                  padding: EdgeInsets.only(
                      left: MySize.getScaledSizeWidth(12.5),
                      right: MySize.getScaledSizeWidth(30)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("18",
                          style: TextStyle(
                              color: AppColors.offWhiteColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.robotoBold,
                              fontStyle: FontStyle.normal,
                              fontSize: MySize.size14),
                          textAlign: TextAlign.left),
                      SizedBox(
                        width: MySize.getScaledSizeWidth(25.5),
                      ),
                      CircleAvatar(
                        radius: MySize.size25,
                        backgroundColor: Colors.transparent,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://cdn.pixabay.com/photo/2021/12/18/06/01/sunset-6878021_960_720.jpg",
                          placeholder: (context, url) => SpinKitCircle(
                            color: Colors.green,
                            size: MySize.size25!,
                          ),
                          imageBuilder: (context, imageProvider) => Container(
                            height: MySize.size50,
                            width: MySize.size50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.white,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: MySize.size50,
                            width: MySize.size50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.button_green,
                            ),
                            child: Icon(
                              Icons.person,
                              color: AppColors.white,
                              size: MySize.size24,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MySize.getScaledSizeWidth(12),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MySize.size19,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Team 1",
                                      style: TextStyle(
                                          color: AppColors.offWhiteColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamily.roboto,
                                          fontStyle: FontStyle.normal,
                                          fontSize: MySize.size14),
                                      textAlign: TextAlign.left),
                                  Text("24 Km",
                                      style: TextStyle(
                                          color: AppColors.offWhiteColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamily.roboto,
                                          fontStyle: FontStyle.normal,
                                          fontSize: MySize.size14),
                                      textAlign: TextAlign.left)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MySize.size1,
                            ),
                            Text("Anupriya, Owner ",
                                style: TextStyle(
                                    color: AppColors.textGray,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.roboto,
                                    fontStyle: FontStyle.normal,
                                    fontSize: MySize.size10),
                                textAlign: TextAlign.left),
                            Row(
                              children: [
                                Spacer(),
                                Text("Your Team",
                                    style: TextStyle(
                                        color: AppColors.offWhiteColor,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: FontFamily.roboto,
                                        fontStyle: FontStyle.normal,
                                        fontSize: MySize.size10),
                                    textAlign: TextAlign.right)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
