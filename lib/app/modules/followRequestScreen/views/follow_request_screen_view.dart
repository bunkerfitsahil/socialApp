import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:social_feed_flutter/constants/DateUtilities.dart';
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
                child: Obx(() {
                  return (controller.hasData.value)
                      ? Container(
                          color: AppColors.backGray,
                          padding: EdgeInsets.only(top: MySize.size23!),
                          child: (controller.pendingData!.value.isEmpty)
                              ? Center(
                                  child: Text("No Request Pending"),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MySize.size18!),
                                  child: ListView.separated(
                                    itemCount:
                                        controller.pendingData!.value.length,
                                    itemBuilder: (context, i) {
                                      return Container(
                                        height: MySize.size95,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                MySize.size10!)),
                                        padding: EdgeInsets.only(
                                            left: MySize.getScaledSizeWidth(7),
                                            top: MySize.size4!,
                                            right:
                                                MySize.getScaledSizeWidth(3)),
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
                                                        backgroundColor:
                                                            AppColors
                                                                .button_green,
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: controller
                                                              .pendingData![i]
                                                              .follower!
                                                              .profilePicture!,
                                                          placeholder:
                                                              (context, url) =>
                                                                  SpinKitCircle(
                                                            color: Colors.green,
                                                            size:
                                                                MySize.size18!,
                                                          ),
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                            height:
                                                                MySize.size54,
                                                            width:
                                                                MySize.size54,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Container(
                                                            height:
                                                                MySize.size54,
                                                            width:
                                                                MySize.size54,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                              color: AppColors
                                                                  .button_green,
                                                            ),
                                                            child: Icon(
                                                              Icons.person,
                                                              color: AppColors
                                                                  .white,
                                                              size:
                                                                  MySize.size40,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: MySize
                                                          .getScaledSizeWidth(
                                                              5),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: MySize.size55,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                  controller
                                                                          .pendingData![
                                                                              i]
                                                                          .follower!
                                                                          .firstName! +
                                                                      " " +
                                                                      controller
                                                                          .pendingData![
                                                                              i]
                                                                          .follower!
                                                                          .lastName!,
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .textBlackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .robotoMedium,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize:
                                                                          MySize
                                                                              .size14),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
                                                              SizedBox(
                                                                height: MySize
                                                                    .size3,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      controller
                                                                              .pendingData![
                                                                                  i]
                                                                              .follower!
                                                                              .location! +
                                                                          ", ",
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .textGrayBlackColor,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontFamily: FontFamily
                                                                              .roboto,
                                                                          fontStyle: FontStyle
                                                                              .normal,
                                                                          fontSize: MySize
                                                                              .size12),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left),
                                                                  Text(
                                                                      controller
                                                                          .pendingData![
                                                                              i]
                                                                          .follower!
                                                                          .dept!,
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .textGrayBlackColor,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontFamily: FontFamily
                                                                              .roboto,
                                                                          fontStyle: FontStyle
                                                                              .normal,
                                                                          fontSize: MySize
                                                                              .size12),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left),
                                                                ],
                                                              ),
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
                                                                  InkWell(
                                                                    child:
                                                                        Container(
                                                                      width: MySize
                                                                          .getScaledSizeWidth(
                                                                              75),
                                                                      height: MySize
                                                                          .size26,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(3)),
                                                                        color: const Color(
                                                                            0xffffe6e7),
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child: Text(
                                                                            "Decline",
                                                                            style: TextStyle(
                                                                                color: AppColors.red,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontFamily: FontFamily.robotoMedium,
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: MySize.size14),
                                                                            textAlign: TextAlign.center),
                                                                      ),
                                                                    ),
                                                                    onTap: () {
                                                                      controller.createAcceptOrDecline(
                                                                          acceptOrDecline:
                                                                              "DECLINED",
                                                                          follow_id: controller
                                                                              .pendingData![i]
                                                                              .id!);
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    width: MySize
                                                                        .getScaledSizeWidth(
                                                                            17),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      controller.createAcceptOrDecline(
                                                                          acceptOrDecline:
                                                                              "ACCEPTED",
                                                                          follow_id: controller
                                                                              .pendingData![i]
                                                                              .id!);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: MySize
                                                                          .getScaledSizeWidth(
                                                                              75),
                                                                      height: MySize
                                                                          .size26,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(3)),
                                                                        color: const Color(
                                                                            0xffdbf0e9),
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child: Text(
                                                                            "Accept",
                                                                            style: TextStyle(
                                                                                color: AppColors.button_green,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontFamily: FontFamily.robotoMedium,
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: MySize.size14),
                                                                            textAlign: TextAlign.center),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                        DateFormat("hh:mma")
                                                            .format(DateUtilities()
                                                                .getDateFromString(
                                                                    controller
                                                                        .pendingData![
                                                                            i]
                                                                        .createdAt
                                                                        .toString())
                                                                .toLocal()
                                                                .add(Duration(
                                                                    hours: 5,
                                                                    minutes:
                                                                        30))),
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .textBlackColor,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                FontFamily
                                                                    .roboto,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize:
                                                                MySize.size9),
                                                        textAlign:
                                                            TextAlign.left),
                                                    SizedBox(
                                                      height: MySize.size3,
                                                    ),
                                                    Text(
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(DateUtilities()
                                                                .getDateFromString(controller
                                                                    .pendingData![
                                                                        i]
                                                                    .createdAt
                                                                    .toString())
                                                                .toLocal()
                                                                .add(Duration(
                                                                    hours: 5,
                                                                    minutes:
                                                                        30))),
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .textBlackColor,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                FontFamily
                                                                    .roboto,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize:
                                                                MySize.size9),
                                                        textAlign:
                                                            TextAlign.left),
                                                    SizedBox(
                                                      height: MySize.size36,
                                                    ),
                                                    InkWell(
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            right: MySize
                                                                .getScaledSizeWidth(
                                                                    15.1)),
                                                        child: Icon(
                                                          Icons.delete,
                                                          size: MySize.size13,
                                                          color: AppColors
                                                              .textGray,
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        controller
                                                            .createAcceptOrDecline(
                                                                acceptOrDecline:
                                                                    "DECLINED",
                                                                follow_id:
                                                                    controller
                                                                        .pendingData![
                                                                            i]
                                                                        .id!);
                                                      },
                                                    ),
                                                  ],
                                                )
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                        )
                      : Container();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
