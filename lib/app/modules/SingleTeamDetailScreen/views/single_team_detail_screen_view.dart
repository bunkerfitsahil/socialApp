import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

import '../controllers/single_team_detail_screen_controller.dart';

class SingleTeamDetailScreenView
    extends GetWidget<SingleTeamDetailScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              getTopAppBarSection(),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: AppColors.blueButtonColor,
                  padding: EdgeInsets.only(
                      left: MySize.getScaledSizeWidth(26),
                      right: MySize.getScaledSizeWidth(25),
                      top: MySize.size22!,
                      bottom: MySize.size23!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: MySize.size26,
                        backgroundColor: AppColors.button_green,
                        child: Icon(
                          Icons.people,
                          color: AppColors.white,
                          size: MySize.size30,
                        ),
                      ),
                      SizedBox(
                        height: MySize.size4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: MySize.size24,
                            child: Text("Team 1",
                                style: TextStyle(
                                    color: AppColors.color_FFF2F2F2,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.robotoMedium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: MySize.size18),
                                textAlign: TextAlign.left),
                          ),
                          Row(
                            children: [
                              Text("Members",
                                  style: TextStyle(
                                      color: AppColors.color_FFF2F2F2,
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
                                      color: AppColors.color_FFF2F2F2,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontFamily.roboto,
                                      fontStyle: FontStyle.normal,
                                      fontSize: MySize.size14),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Owner: Parnai Das",
                              style: TextStyle(
                                  color: AppColors.color_FFF2F2F2,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.roboto,
                                  fontStyle: FontStyle.normal,
                                  fontSize: MySize.size10),
                              textAlign: TextAlign.left),
                          Container(
                            child: Text("2 slots left",
                                style: TextStyle(
                                    color: AppColors.color_FFF2F2F2,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.roboto,
                                    fontStyle: FontStyle.normal,
                                    fontSize: MySize.size10),
                                textAlign: TextAlign.left),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MySize.size8,
                      ),
                      getTeamDescription(),
                      SizedBox(
                        height: MySize.size4,
                      ),
                      Expanded(
                        child: getAllTeamMemberDetail(),
                      ),
                    ],
                  ),
                ),
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
          width: MySize.getScaledSizeWidth(28),
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

  Container getTeamDescription() {
    return Container(
      height: MySize.size56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //height: MySize.size56,
            width: MySize.getScaledSizeWidth(162),
            child: AutoSizeText(
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr. Lorem ipsum dolor sit ",
                style: TextStyle(
                    color: AppColors.color_FFF2F2F2,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.roboto,
                    fontStyle: FontStyle.normal,
                    fontSize: MySize.size12),
                textAlign: TextAlign.left),
          ),
          Container(
              width: MySize.getScaledSizeWidth(90),
              height: MySize.size24,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  color: AppColors.button_green),
              child: Center(
                child: Text(
                  "Join",
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.roboto,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size14),
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }

  Container getAllTeamMemberDetail() {
    return Container(
      child: ListView.separated(
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                // Get.toNamed(Routes.SINGLE_TEAM_DETAIL_SCREEN);
              },
              child: Container(
                width: double.infinity,
                height: MySize.size76,
                color: AppColors.color_FFF2F2F2,
                padding: EdgeInsets.only(
                    left: MySize.getScaledSizeWidth(25),
                    top: MySize.size13!,
                    right: MySize.getScaledSizeWidth(23)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      //height: MySize.size50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: MySize.size25,
                                backgroundColor: Colors.transparent,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://cdn.pixabay.com/photo/2021/12/18/06/01/sunset-6878021_960_720.jpg",
                                  // imageUrl: "",
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
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    height: MySize.size50,
                                    width: MySize.size50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: AppColors.button_green,
                                    ),
                                    child: Icon(
                                      Icons.people,
                                      color: AppColors.white,
                                      size: MySize.size25,
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
                                  Text("Parnai Das",
                                      style: TextStyle(
                                          color: AppColors.textBlackColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamily.roboto,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.0),
                                      textAlign: TextAlign.left),
                                  SizedBox(
                                    height: MySize.size3,
                                  ),
                                  Text("Sales & Marketing",
                                      style: TextStyle(
                                          color: AppColors.textBlackColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamily.roboto,
                                          fontStyle: FontStyle.normal,
                                          fontSize: MySize.size10),
                                      textAlign: TextAlign.left),
                                  SizedBox(
                                    height: MySize.size3,
                                  ),
                                  Text("New Delhi",
                                      style: TextStyle(
                                          color: AppColors.textBlackColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamily.roboto,
                                          fontStyle: FontStyle.normal,
                                          fontSize: MySize.size10),
                                      textAlign: TextAlign.left)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
