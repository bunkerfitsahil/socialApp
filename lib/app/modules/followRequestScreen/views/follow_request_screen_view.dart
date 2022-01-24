import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/math_utils.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

import '../controllers/follow_request_screen_controller.dart';

class FollowRequestScreenView extends GetWidget<FollowRequestScreenController> {
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
                        child: Text("Follower Requests  ",
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
                child: Container(
                  color: AppColors.backGray,
                  padding: EdgeInsets.only(top: MySize.size23!),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MySize.size18!),
                    child: ListView.separated(
                      itemCount: 15,
                      itemBuilder: (context, i) {
                        return Container(
                          height: MySize.size95,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(MySize.size10!)),
                          padding: EdgeInsets.only(
                              left: MySize.getScaledSizeWidth(7),
                              top: MySize.size4!,
                              right: MySize.getScaledSizeWidth(3)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: MySize.size55,
                                        child: CircleAvatar(
                                          radius: MySize.size27,
                                          backgroundImage:
                                              AssetImage(Assets.avtar),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MySize.getScaledSizeWidth(5),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: MySize.size55,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Sahil Soni",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .textBlackColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: FontFamily
                                                            .robotoMedium,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize:
                                                            MySize.size14),
                                                    textAlign: TextAlign.left),
                                                SizedBox(
                                                  height: MySize.size3,
                                                ),
                                                Text(
                                                    "New Delhi,  Sales & Marketing",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .textGrayBlackColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            FontFamily.roboto,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize:
                                                            MySize.size12),
                                                    textAlign: TextAlign.left),
                                              ],
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: getSize(15, context),
                                          // ),
                                          Container(
                                            height: MySize.size26,
                                            child: Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: MySize
                                                          .getScaledSizeWidth(
                                                              75),
                                                      height: MySize.size26,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    3)),
                                                        color: const Color(
                                                            0xffffe6e7),
                                                      ),
                                                      child: Center(
                                                        child: Text("Decline",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .robotoMedium,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: MySize
                                                                    .size14),
                                                            textAlign: TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: MySize
                                                          .getScaledSizeWidth(
                                                              17),
                                                    ),
                                                    Container(
                                                      width: MySize
                                                          .getScaledSizeWidth(
                                                              75),
                                                      height: MySize.size26,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    3)),
                                                        color: const Color(
                                                            0xffdbf0e9),
                                                      ),
                                                      child: Center(
                                                        child: Text("Accept",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .button_green,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .robotoMedium,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: MySize
                                                                    .size14),
                                                            textAlign: TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("03 : 30 am",
                                          style: TextStyle(
                                              color: AppColors.textBlackColor,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontFamily.roboto,
                                              fontStyle: FontStyle.normal,
                                              fontSize: MySize.size9),
                                          textAlign: TextAlign.left),
                                      SizedBox(
                                        height: MySize.size3,
                                      ),
                                      Text("12 Dec 22",
                                          style: TextStyle(
                                              color: AppColors.textBlackColor,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontFamily.roboto,
                                              fontStyle: FontStyle.normal,
                                              fontSize: MySize.size9),
                                          textAlign: TextAlign.left),
                                      SizedBox(
                                        height: MySize.size36,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: MySize.getScaledSizeWidth(
                                                15.1)),
                                        child: Icon(
                                          Icons.delete,
                                          size: MySize.size13,
                                          color: AppColors.textGray,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return SizedBox(
                          height: getSize(15, context),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
