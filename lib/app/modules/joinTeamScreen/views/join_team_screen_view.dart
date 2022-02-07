import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

import '../controllers/join_team_screen_controller.dart';

class JoinTeamScreenView extends GetWidget<JoinTeamScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              getTopAppBarSection(),
              getChallangeDetail(),
              SizedBox(
                height: MySize.size14,
              ),
              getTeamNoandSizeDetail(),
              SizedBox(
                height: MySize.size9,
              ),
              Expanded(
                child: allTeamDetailList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container getTopAppBarSection() {
    return Container(
      height: MySize.size70,
      padding: EdgeInsets.only(left: MySize.getScaledSizeWidth(22)),
      color: AppColors.blueButtonColor,
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          width: MySize.size28,
          height: MySize.size28,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Icon(
              Icons.arrow_back,
              size: MySize.size13,
            ),
          ),
        ),
      ),
    );
  }

  Container getChallangeDetail() {
    return Container(
      padding: EdgeInsets.only(
          left: MySize.getScaledSizeWidth(26), top: MySize.size23!),
      width: double.infinity,
      height: MySize.size89,
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
            height: MySize.size9,
          ),
          Text("April 21 -  May 1",
              style: TextStyle(
                  color: AppColors.textGrayBlackColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.roboto,
                  fontStyle: FontStyle.normal,
                  fontSize: MySize.size12),
              textAlign: TextAlign.left)
        ],
      ),
    );
  }

  Container getTeamNoandSizeDetail() {
    return Container(
      height: MySize.size22,
      padding: EdgeInsets.only(
          left: MySize.getScaledSizeWidth(26),
          right: MySize.getScaledSizeWidth(26)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total Teams 26",
              style: TextStyle(
                  color: AppColors.textGrayBlackColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.robotoMedium,
                  fontStyle: FontStyle.normal,
                  fontSize: MySize.size12),
              textAlign: TextAlign.left),
          Text("Team Size ( Min - 12, Max 15)",
              style: TextStyle(
                  color: AppColors.textGrayBlackColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.robotoMedium,
                  fontStyle: FontStyle.normal,
                  fontSize: MySize.size12),
              textAlign: TextAlign.right)
        ],
      ),
    );
  }

  Container allTeamDetailList() {
    return Container(
      child: ListView.separated(
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.SINGLE_TEAM_DETAIL_SCREEN);
              },
              child: Container(
                width: double.infinity,
                height: MySize.size103,
                color: AppColors.backChalangeColor,
                padding: EdgeInsets.only(
                    left: MySize.getScaledSizeWidth(25),
                    top: MySize.size21!,
                    right: MySize.getScaledSizeWidth(23)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MySize.size62,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: MySize.size31,
                                backgroundColor: Colors.transparent,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://cdn.pixabay.com/photo/2021/12/18/06/01/sunset-6878021_960_720.jpg",
                                  // imageUrl: "",
                                  placeholder: (context, url) => SpinKitCircle(
                                    color: Colors.green,
                                    size: MySize.size30!,
                                  ),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    height: MySize.size62,
                                    width: MySize.size62,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: AppColors.white,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    height: MySize.size62,
                                    width: MySize.size62,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: AppColors.button_green,
                                    ),
                                    child: Icon(
                                      Icons.people,
                                      color: AppColors.white,
                                      size: MySize.size30,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MySize.getScaledSizeWidth(11),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Team 1",
                                      style: TextStyle(
                                          color: AppColors.textBlackColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamily.roboto,
                                          fontStyle: FontStyle.normal,
                                          fontSize: MySize.size14),
                                      textAlign: TextAlign.left),
                                  SizedBox(
                                    height: MySize.size3,
                                  ),
                                  Container(
                                    height: MySize.size16,
                                    child: Text("Owner: Parnai",
                                        style: TextStyle(
                                            color: AppColors.textGrayBlackColor,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: FontFamily.roboto,
                                            fontStyle: FontStyle.normal,
                                            fontSize: MySize.size10),
                                        textAlign: TextAlign.left),
                                  ),
                                  SizedBox(
                                    height: MySize.size3,
                                  ),
                                  Row(
                                    children: [
                                      Text("Members",
                                          style: TextStyle(
                                              color: AppColors.textBlackColor,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontFamily.roboto,
                                              fontStyle: FontStyle.normal,
                                              fontSize: MySize.size14),
                                          textAlign: TextAlign.left),
                                      SizedBox(
                                        width: MySize.getScaledSizeWidth(17),
                                      ),
                                      Text("13",
                                          style: TextStyle(
                                              color: AppColors.textBlackColor,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontFamily.roboto,
                                              fontStyle: FontStyle.normal,
                                              fontSize: MySize.size14),
                                          textAlign: TextAlign.left)
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          (i % 2 == 0)
                              ? Container(
                                  width: MySize.getScaledSizeWidth(80),
                                  height: MySize.size24,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.shadowColor,
                                            offset: Offset(-2, 2),
                                            blurRadius: 3,
                                            spreadRadius: 0)
                                      ],
                                      color: AppColors.button_green),
                                  child: Center(
                                    child: Text("Join",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: FontFamily.robotoMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: MySize.size14),
                                        textAlign: TextAlign.center),
                                  ),
                                )
                              : Container(
                                  width: MySize.getScaledSizeWidth(80),
                                  height: MySize.size24,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.shadowColor,
                                          offset: Offset(-2, 2),
                                          blurRadius: 3,
                                          spreadRadius: 0)
                                    ],
                                    color: AppColors.textGray,
                                  ),
                                  child: Center(
                                    child: Text("Full",
                                        style: TextStyle(
                                            color: AppColors.backGray,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: FontFamily.robotoMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: MySize.size14),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: MySize.getScaledSizeWidth(74)),
                      child: Text("2 slots left",
                          style: TextStyle(
                              color: AppColors.textGrayBlackColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.roboto,
                              fontStyle: FontStyle.normal,
                              fontSize: MySize.size10),
                          textAlign: TextAlign.left),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, i) {
            return Container(
              height: MySize.size7,
            );
          },
          itemCount: 40),
    );
  }
}
