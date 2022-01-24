import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/math_utils.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetWidget<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MySize.getScaledSizeHeight(298),
                child: Stack(
                  children: [
                    Container(
                      height: MySize.getScaledSizeHeight(298),
                      decoration: BoxDecoration(
                        color: AppColors.button_green,
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(getSize(25, context)),
                        //   bottomRight: Radius.circular(getSize(25, context)),
                        // )
                      ),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            height: MySize.size140,
                            width: double.infinity,
                            child: Image(
                              image: AssetImage(Assets.profBack),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            top: MySize.size19,
                            left: MySize.getScaledSizeHeight(21),
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
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
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
                          Positioned(
                            top: MySize.size19,
                            child: Container(
                              height: MySize.getScaledSizeHeight(30.2),
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: Text("Surbhi Mahendru ",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: FontFamily.roboto,
                                      fontStyle: FontStyle.normal,
                                      fontSize: MySize.size14),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Positioned(
                            top: MySize.size73,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MySize.getScaledSizeHeight(229),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: MySize.size41,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: MySize.size41,
                                      backgroundImage: AssetImage(
                                        Assets.avtar,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MySize.size8,
                                  ),
                                  Text("Surbhi Mahendru ",
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: FontFamily.roboto,
                                          fontStyle: FontStyle.normal,
                                          fontSize: MySize.size14),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    height: MySize.size5,
                                  ),
                                  Container(
                                    height: MySize.size32,
                                    child: Text("New Delhi \nSales & Marketing",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: FontFamily.roboto,
                                            fontStyle: FontStyle.normal,
                                            fontSize: MySize.size12),
                                        textAlign: TextAlign.center),
                                  ),
                                  Container(
                                    child: Divider(
                                      color: Colors.white,
                                      indent: MySize.getScaledSizeWidth(38.5),
                                      endIndent:
                                          MySize.getScaledSizeWidth(37.5),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: MySize.getScaledSizeWidth(264),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Personal trainer and have done several certifications and workshops in yoga",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: FontFamily.roboto,
                                            fontStyle: FontStyle.normal,
                                            fontSize: MySize.size12),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Positioned(
                          //   top: MySize.size164,
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     alignment: Alignment.center,
                          //     child: Column(
                          //       children: [
                          //         Text("Surbhi Mahendru ",
                          //             style: TextStyle(
                          //                 color: AppColors.white,
                          //                 fontWeight: FontWeight.w500,
                          //                 fontFamily: FontFamily.roboto,
                          //                 fontStyle: FontStyle.normal,
                          //                 fontSize: MySize.size14),
                          //             textAlign: TextAlign.center),
                          //         SizedBox(
                          //           height: MySize.size5,
                          //         ),
                          //         Container(
                          //           height: MySize.size32,
                          //           child: Text("New Delhi \nSales & Marketing",
                          //               style: TextStyle(
                          //                   color: AppColors.white,
                          //                   fontWeight: FontWeight.w400,
                          //                   fontFamily: FontFamily.roboto,
                          //                   fontStyle: FontStyle.normal,
                          //                   fontSize: MySize.size12),
                          //               textAlign: TextAlign.center),
                          //         ),
                          //         Container(
                          //           child: Divider(
                          //             color: Colors.white,
                          //             indent: MySize.getScaledSizeWidth(38.5),
                          //             endIndent:
                          //                 MySize.getScaledSizeWidth(37.5),
                          //           ),
                          //         ),
                          //         Container(
                          //           width: MediaQuery.of(context).size.width,
                          //           alignment: Alignment.center,
                          //           child: Container(
                          //             width: MySize.getScaledSizeWidth(264),
                          //             alignment: Alignment.center,
                          //             child: Text(
                          //               "Personal trainer and have done several certifications and workshops in yoga",
                          //               style: TextStyle(
                          //                   color: AppColors.white,
                          //                   fontWeight: FontWeight.w400,
                          //                   fontFamily: FontFamily.roboto,
                          //                   fontStyle: FontStyle.normal,
                          //                   fontSize: MySize.size12),
                          //               textAlign: TextAlign.center,
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: MySize.size30,
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Positioned(
                          //   top: MediaQuery.of(context).padding.top +
                          //       getSize(260, context),
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     alignment: Alignment.center,
                          //     child: Container(
                          //       width: getSize(300, context),
                          //       alignment: Alignment.center,
                          //       child: Text(
                          //         "Personal trainer and have done several certifications and workshops in yoga",
                          //         style: TextStyle(
                          //             color: Color(0xffffffff),
                          //             fontWeight: FontWeight.w400,
                          //             fontFamily: "Roboto",
                          //             fontStyle: FontStyle.normal,
                          //             fontSize: getFontSize(14, context)),
                          //         textAlign: TextAlign.center,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MySize.getScaledSizeHeight(272),
                child: Stack(
                  children: [
                    Container(
                      height: MySize.size254,
                      color: AppColors.profileBack,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      height: MySize.getScaledSizeHeight(52),
                      decoration: BoxDecoration(
                          color: AppColors.button_green,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(MySize.size21!),
                              bottomRight: Radius.circular(MySize.size21!))),
                      child: Column(
                        children: [
                          Container(
                            width: MySize.getScaledSizeWidth(298),
                            height: MySize.size38,
                            // color: Colors.red,
                            alignment: Alignment.center,
                            child: Container(
                              height: MySize.size38,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: columnPost(context,
                                        name: "Post", number: 12),
                                  ),
                                  VerticalDivider(
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: columnPost(context,
                                        name: "Followers", number: 444),
                                  ),
                                  VerticalDivider(
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: columnPost(context,
                                        name: "Following", number: 1012),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MySize.size14,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: MySize.size72,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MySize.getScaledSizeWidth(39)),
                          child: Column(
                            children: [
                              Container(
                                height: MySize.size19,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Badges Earned",
                                        style: TextStyle(
                                            color: AppColors.textBlackColor,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: FontFamily.robotoBold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: MySize.size12),
                                        textAlign: TextAlign.center),
                                    Expanded(child: Container()),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.BADGES_SCREEN);
                                      },
                                      child: Text("See all",
                                          style: TextStyle(
                                              color:
                                                  AppColors.textGrayBlackColor,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontFamily.roboto,
                                              fontStyle: FontStyle.normal,
                                              fontSize: MySize.size12),
                                          textAlign: TextAlign.left),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MySize.size24,
                              ),
                              Container(
                                height: MySize.getScaledSizeHeight(105.9),
                                // width: MySize.getScaledSizeWidth(61),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    streakWidget(context,
                                        name: "3 Day Streak",
                                        img: Assets.streak1,
                                        number: 5),
                                    streakWidget(context,
                                        name: "3 Day Streak",
                                        img: Assets.streak2,
                                        number: 2),
                                    streakWidget(context,
                                        name: "3 Day Streak",
                                        img: Assets.streak3,
                                        number: 2),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MySize.getScaledSizeHeight(236),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MySize.size32,
                        alignment: Alignment.center,
                        child: Container(
                          width: getSize(180, context),
                          // height: getSize(50, context),
                          alignment: Alignment.center,
                          child: Container(
                            // height: 100,
                            decoration: BoxDecoration(
                                color: AppColors.button_green,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text("Follow",
                                  style: TextStyle(
                                      color: AppColors.profileFollowText,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontFamily.roboto,
                                      fontStyle: FontStyle.normal,
                                      fontSize: MySize.size15),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 700,
                width: double.infinity,
                // color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget columnPost(context, {int? number, String? name}) {
    return InkWell(
      onTap: () {
        if (name == "Followers") {
          Get.toNamed(Routes.FOLLOWER_SCREEN);
        }
        if (name == "Following") {
          Get.toNamed(Routes.FOLLOWING_SCREEN);
        }
        if (name == "Post") {
          Get.toNamed(Routes.FOLLOW_REQUEST_SCREEN);
        }
      },
      child: Container(
        height: MySize.size38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${number}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.roboto,
                    fontStyle: FontStyle.normal,
                    fontSize: MySize.getScaledSizeHeight(15)),
                textAlign: TextAlign.center),
            SizedBox(
              height: MySize.size2,
            ),
            Text("${name}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.roboto,
                    fontStyle: FontStyle.normal,
                    fontSize: MySize.getScaledSizeWidth(12)),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }

  Widget streakWidget(context, {int? number, String? name, String? img}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          radius: MySize.size30,
          child: SvgPicture.asset(img!),
        ),
        SizedBox(
          height: MySize.size9,
        ),
        Text(name!,
            style: TextStyle(
                color: const Color(0xff1c1414),
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.roboto,
                fontStyle: FontStyle.normal,
                fontSize: MySize.size10),
            textAlign: TextAlign.center),
        SizedBox(
          height: MySize.size9,
        ),
        Text("${number.toString()}",
            style: TextStyle(
                color: AppColors.textGrayBlackColor,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.roboto,
                fontStyle: FontStyle.normal,
                fontSize: MySize.size12),
            textAlign: TextAlign.center)
      ],
    );
  }
}
