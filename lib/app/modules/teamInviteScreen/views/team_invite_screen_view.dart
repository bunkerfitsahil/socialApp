import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/argumentConstant.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

import '../controllers/team_invite_screen_controller.dart';

class TeamInviteScreenView extends GetWidget<TeamInviteScreenController> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  getTopAppBarSection(),
                  getTeamNameAndViewSection(),
                  SizedBox(
                    height: MySize.size22,
                  ),
                  getGropuDescriptionSection(),
                  SizedBox(
                    height: MySize.size12,
                  ),
                  getMemberCountSection(),
                  SizedBox(
                    height: MySize.size45,
                  ),
                  addFriendsSection(),
                  SizedBox(
                    height: MySize.size52,
                  ),
                  for (int i = 0; i < 10; i++)
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MySize.getScaledSizeWidth(26),
                              right: MySize.getScaledSizeWidth(26)),
                          child: Container(
                            width: double.infinity,
                            height: MySize.size76,
                            decoration:
                                BoxDecoration(color: AppColors.color_FFF2F2F2),
                            padding: EdgeInsets.only(
                                left: MySize.getScaledSizeWidth(12.5),
                                right: MySize.getScaledSizeWidth(20)),
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
                                    placeholder: (context, url) =>
                                        SpinKitCircle(
                                      color: Colors.green,
                                      size: MySize.size25!,
                                    ),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      height: MySize.size50,
                                      width: MySize.size50,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Parnai Das",
                                              style: TextStyle(
                                                  color:
                                                      AppColors.textBlackColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontFamily.roboto,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: MySize.size14),
                                              textAlign: TextAlign.left),
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
                                          SizedBox(
                                            height: MySize.size1,
                                          ),
                                          Text("New Delhi",
                                              style: TextStyle(
                                                  color: AppColors.textGray,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontFamily.roboto,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: MySize.size10),
                                              textAlign: TextAlign.left),
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                        width: MySize.getScaledSizeWidth(69),
                                        height: MySize.size24,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xffd6d6d6),
                                                offset: Offset(-2, 2),
                                                blurRadius: 3,
                                                spreadRadius: 0)
                                          ],
                                          color: const Color(0xfff39b33),
                                        ),
                                        child: Center(
                                          child: Text("Invited",
                                              style: TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: FontFamily.roboto,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: MySize.size14),
                                              textAlign: TextAlign.center),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MySize.size6,
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container getTopAppBarSection() {
    return Container(
      height: MySize.size70,
      padding: EdgeInsets.only(
          left: MySize.getScaledSizeWidth(22),
          right: MySize.getScaledSizeWidth(38)),
      color: AppColors.blueButtonColor,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          InkWell(
            onTap: () {
              Get.toNamed(
                Routes.CREATE_TEAM_SCREEN,
                arguments: {Argument.modify: true},
              );
            },
            child: Text("Modify",
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.roboto,
                    fontStyle: FontStyle.normal,
                    fontSize: MySize.size14),
                textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }

  Container addFriendsSection() {
    return Container(
      padding: EdgeInsets.only(
          left: MySize.getScaledSizeWidth(31),
          right: MySize.getScaledSizeWidth(26)),
      child: Obx(() {
        return Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Friends",
                  style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.robotoBold,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size14),
                  textAlign: TextAlign.left),
              SizedBox(
                height: MySize.size8,
              ),
              for (var i = 0; i < controller.controllersList.length; i++)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MySize.getScaledSizeWidth(200),
                          height: MySize.size31,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(
                                color: AppColors.borderColor,
                                width: MySize.getScaledSizeWidth(0.5)),
                          ),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    bottom: MySize.size31! / 2,
                                    left: MySize.getScaledSizeWidth(
                                        10) // HERE THE IMPORTANT PART
                                    ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.LEADER_BOARD_SCREEN);
                          },
                          child: Container(
                            width: MySize.getScaledSizeWidth(80),
                            height: MySize.size31,
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
                              child: Text("Invite",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: FontFamily.robotoMedium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: MySize.size14),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MySize.size22,
                    ),
                  ],
                ),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  InkWell(
                    onTap: () {
                      controller.controllersList.add(TextEditingController());
                    },
                    child: Text("+ Add More",
                        style: TextStyle(
                            color: AppColors.textGrayBlackColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.roboto,
                            fontStyle: FontStyle.normal,
                            fontSize: MySize.size12),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Container getTeamNameAndViewSection() {
    return Container(
      height: MySize.size85,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: MySize.size69,
            color: AppColors.backChalangeColor,
            width: double.infinity,
          ),
          Positioned(
            top: MySize.size23,
            left: MySize.size26,
            child: Container(
              child: Text("Team 1",
                  style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.robotoMedium,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size18),
                  textAlign: TextAlign.left),
            ),
          ),
          Positioned(
            top: MySize.size23,
            right: MySize.getScaledSizeWidth(28),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: MySize.size63,
                width: MySize.size63,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: MySize.size31,
                      backgroundColor: AppColors.button_green,
                      child: Icon(
                        Icons.people,
                        color: AppColors.white,
                        size: MySize.size30,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: MySize.size10,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(Assets.image),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container getGropuDescriptionSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(26)),
      width: double.infinity,
      height: MySize.size64,
      child: Column(
        children: [
          Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr. Lorem ipsum dolor sit ",
              style: TextStyle(
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.roboto,
                  fontStyle: FontStyle.normal,
                  fontSize: MySize.size14),
              textAlign: TextAlign.left),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: MySize.size10!),
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                      width: double.infinity,
                      height: MySize.getScaledSizeHeight(0.5),
                      decoration: BoxDecoration(color: AppColors.textGray))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container getMemberCountSection() {
    return Container(
      padding: EdgeInsets.only(left: MySize.getScaledSizeWidth(26)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                width: MySize.getScaledSizeWidth(35),
              ),
              Text("0",
                  style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.roboto,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size14),
                  textAlign: TextAlign.left)
            ],
          ),
          SizedBox(
            height: MySize.size5,
          ),
          Text("15 slots left",
              style: TextStyle(
                  color: AppColors.textGrayBlackColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.roboto,
                  fontStyle: FontStyle.normal,
                  fontSize: MySize.size10),
              textAlign: TextAlign.left)
        ],
      ),
    );
  }
}
