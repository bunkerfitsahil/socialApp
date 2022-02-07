import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

import '../controllers/my_upcoming_individual_screen_controller.dart';

class MyUpcomingIndividualScreenView
    extends GetWidget<MyUpcomingIndividualScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              getTopAppbarSection(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      getTopImageSection(),
                      getChalangeNameAndTimeSection(),
                      aboutChalangeandCommentSection(),
                      SizedBox(
                        height: MySize.size21,
                      ),
                      getLeaveChallengeButton(context),
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

  Container getLeaveChallengeButton(BuildContext context) {
    return Container(
      height: MySize.size74,
      width: double.infinity,
      color: AppColors.backChalangeColor,
      padding: EdgeInsets.only(left: MySize.getScaledSizeWidth(30)),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                        height: MySize.size200,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: MySize.size13,
                              backgroundColor: AppColors.white,
                              child: SvgPicture.asset(
                                Assets.question,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: MySize.size27,
                            ),
                            Container(
                              height: MySize.size50,
                              width: double.infinity,
                              alignment: Alignment.topCenter,
                              child: Text(
                                  "Do you really want to leave \nthe challenge",
                                  style: TextStyle(
                                      color: AppColors.dialogueBlackColor,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontFamily.roboto,
                                      fontStyle: FontStyle.normal,
                                      fontSize: MySize.size16),
                                  textAlign: TextAlign.center),
                            ),
                            SizedBox(
                              height: MySize.size12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Container(
                                    width: MySize.getScaledSizeWidth(126),
                                    height: MySize.size47,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.shadowColor,
                                              offset: Offset(-2, 2),
                                              blurRadius: 3,
                                              spreadRadius: 0)
                                        ],
                                        color: AppColors.backGray),
                                    child: Center(
                                      child: Text("Leave",
                                          style: TextStyle(
                                              color: AppColors.textGray,
                                              fontWeight: FontWeight.w500,
                                              fontFamily:
                                                  FontFamily.robotoMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: MySize.size16),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.back();
                                  },
                                ),
                                SizedBox(
                                  width: MySize.getScaledSizeWidth(14),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    width: MySize.getScaledSizeWidth(126),
                                    height: MySize.size47,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.shadowColor,
                                              offset: Offset(-2, 2),
                                              blurRadius: 3,
                                              spreadRadius: 0)
                                        ],
                                        color: AppColors.button_green),
                                    child: Center(
                                      child: Text("No",
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w500,
                                              fontFamily:
                                                  FontFamily.robotoMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: MySize.size16),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              width: MySize.getScaledSizeWidth(124),
              height: MySize.size24,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.shadowColor,
                        offset: Offset(-2, 2),
                        blurRadius: 3,
                        spreadRadius: 0)
                  ],
                  color: AppColors.button_green),
              child: Center(
                child: Text("Leave Challenge",
                    style: TextStyle(
                        color: AppColors.white,
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
              child: Text("Upcoming Challenges",
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

  Container getTopImageSection() {
    return Container(
      height: MySize.getScaledSizeHeight(248),
      width: double.infinity,
      color: AppColors.backChalangeColor,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MySize.getScaledSizeHeight(229),
            //color: Colors.red,
            child: CachedNetworkImage(
              imageUrl:
                  "https://cdn.pixabay.com/photo/2021/12/18/06/01/sunset-6878021_960_720.jpg",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => SpinKitCircle(
                color: Colors.green,
                size: MySize.size30!,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: MySize.getScaledSizeWidth(26),
            bottom: 0,
            child: Container(
              width: MySize.getScaledSizeWidth(122),
              height: MySize.size39,
              decoration: BoxDecoration(
                color: AppColors.blueButtonColor,
                borderRadius: BorderRadius.circular(MySize.size5!),
              ),
              child: Center(
                child: Text("April 21 -  May 1",
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.roboto,
                        fontStyle: FontStyle.normal,
                        fontSize: MySize.size13),
                    textAlign: TextAlign.left),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container getChalangeNameAndTimeSection() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
          left: MySize.getScaledSizeWidth(26), top: MySize.size23!),
      color: AppColors.backChalangeColor,
      height: MySize.size86,
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
            height: MySize.size7,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Begins",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.robotoBold,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size14),
                  textAlign: TextAlign.left),
              SizedBox(
                width: MySize.getScaledSizeWidth(20),
              ),
              Text("11 Days",
                  style: TextStyle(
                      color: AppColors.textGrayBlackColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.roboto,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size12),
                  textAlign: TextAlign.left),
              SizedBox(
                width: MySize.getScaledSizeWidth(25),
              ),
              Text("16 Hours",
                  style: TextStyle(
                      color: AppColors.textGrayBlackColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.roboto,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size12),
                  textAlign: TextAlign.left),
              SizedBox(
                width: MySize.getScaledSizeWidth(25),
              ),
              Text("20 Minutes",
                  style: TextStyle(
                      color: AppColors.textGrayBlackColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.roboto,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size12),
                  textAlign: TextAlign.left),
            ],
          ),
        ],
      ),
    );
  }

  Container aboutChalangeandCommentSection() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
          left: MySize.getScaledSizeWidth(26), top: MySize.size20!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.description,
                color: AppColors.button_green,
                size: MySize.size14,
              ),
              SizedBox(
                width: MySize.getScaledSizeWidth(17),
              ),
              Text("About the challenge",
                  style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.robotoBold,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size14),
                  textAlign: TextAlign.left)
            ],
          ),
          SizedBox(
            height: MySize.size12,
          ),
          Container(
            padding: EdgeInsets.only(right: MySize.getScaledSizeWidth(36)),
            height: MySize.size78,
            width: double.infinity,
            child: AutoSizeText(
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr. Lorem ipsum dolor sit amet, consetetur sadipscing elitr. Lorem ipsum dolor sit amet, consetetur sadipscing elitr. ",
                style: TextStyle(
                    color: AppColors.textBlackColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.roboto,
                    fontStyle: FontStyle.normal,
                    fontSize: MySize.size14),
                softWrap: true,
                maxLines: 4,
                textAlign: TextAlign.left),
          ),
          SizedBox(
            height: MySize.size20,
          ),
          Container(
            width: MySize.getScaledSizeWidth(119),
            height: MySize.size26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: AppColors.textGrayBlackColor),
            child: Center(
              child: Text("Goal 30000 km",
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.robotoBold,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size14),
                  textAlign: TextAlign.left),
            ),
          ),
          SizedBox(
            height: MySize.size40,
          ),
          Container(
            // height: MySize.size19,
            padding: EdgeInsets.only(right: MySize.getScaledSizeWidth(31)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text("Gratification",
                        style: TextStyle(
                            color: AppColors.textGrayBlackColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.roboto,
                            fontStyle: FontStyle.normal,
                            fontSize: MySize.size12),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: MySize.size3,
                    ),
                    Row(
                      children: [
                        Text("₹",
                            style: TextStyle(
                                color: AppColors.textGrayBlackColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: FontFamily.roboto,
                                fontStyle: FontStyle.normal,
                                fontSize: MySize.size14),
                            textAlign: TextAlign.left),
                        SizedBox(
                          width: MySize.getScaledSizeWidth(20),
                        ),
                        Container(
                          height: MySize.size10,
                          width: MySize.getScaledSizeWidth(11),
                          child: SvgPicture.asset(
                            Assets.trophy,
                            color: AppColors.textGrayBlackColor,
                          ),
                        ),
                        SizedBox(
                          width: MySize.getScaledSizeWidth(20),
                        ),
                        Container(
                          height: MySize.size10,
                          width: MySize.getScaledSizeWidth(11),
                          child: SvgPicture.asset(
                            Assets.radio,
                            color: AppColors.textGrayBlackColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.PARTICIPATION_SCREEN);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Participants",
                          style: TextStyle(
                              color: AppColors.textGrayBlackColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.robotoBold,
                              fontStyle: FontStyle.normal,
                              fontSize: MySize.size12),
                          textAlign: TextAlign.right),
                      SizedBox(
                        height: MySize.size3,
                      ),
                      Container(
                        height: MySize.size32,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MySize.size64,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: MySize.size16,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://cdn.pixabay.com/photo/2021/12/18/06/01/sunset-6878021_960_720.jpg",
                                      placeholder: (context, url) =>
                                          SpinKitCircle(
                                        color: Colors.green,
                                        size: MySize.size14!,
                                      ),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        height: MySize.size32,
                                        width: MySize.size32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                  Positioned(
                                    left: MySize.getScaledSizeWidth(16),
                                    child: CircleAvatar(
                                      radius: MySize.size16,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://cdn.pixabay.com/photo/2021/12/18/06/01/sunset-6878021_960_720.jpg",
                                        placeholder: (context, url) =>
                                            SpinKitCircle(
                                          color: Colors.green,
                                          size: MySize.size14!,
                                        ),
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          height: MySize.size32,
                                          width: MySize.size32,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: MySize.getScaledSizeWidth(32),
                                    child: CircleAvatar(
                                      radius: MySize.size16,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://cdn.pixabay.com/photo/2021/12/18/06/01/sunset-6878021_960_720.jpg",
                                        placeholder: (context, url) =>
                                            SpinKitCircle(
                                          color: Colors.green,
                                          size: MySize.size14!,
                                        ),
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          height: MySize.size32,
                                          width: MySize.size32,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MySize.getScaledSizeWidth(7),
                            ),
                            Text("+ 84",
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding joinTeamButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(22)),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.JOIN_TEAM_SCREEN);
          //Get.toNamed(Routes.NO_TEAM_EXIST_ALERT_SCREEN);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size3!)),
            color: AppColors.button_green,
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor,
                  offset: Offset(-2, 2),
                  blurRadius: 3,
                  spreadRadius: 0),
            ],
          ),
          height: MySize.size55,
          width: double.infinity,
          child: Center(
            child: Text("Join Challange",
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.roboto,
                    fontStyle: FontStyle.normal,
                    fontSize: MySize.size19),
                textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
