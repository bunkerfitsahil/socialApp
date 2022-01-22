import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/math_utils.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetWidget<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      height: getSize(600, context),
                      color: const Color(0xffeef0f0),
                    ),
                    Container(
                      height: getSize(625, context),
                      // color: const Color(0xffeef0f0),
                    ),
                  ],
                ),
                // Positioned(
                //   top: MediaQuery.of(context).padding.top +
                //       getSize(550, context),
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     height: 100,
                //     //  color: Colors.red,
                //     alignment: Alignment.center,
                //   ),
                // ),
                Container(
                  height: getSize(415, context),
                  decoration: BoxDecoration(
                      color: const Color(0xff3ba27f),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(getSize(25, context)),
                        bottomRight: Radius.circular(getSize(25, context)),
                      )),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        height: getSize(200, context),
                        width: double.infinity,
                        child: Image(
                          image: AssetImage(Assets.profBack),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top +
                            getSize(10, context),
                        left: getSize(20, context),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: getSize(32, context),
                                height: getSize(32, context),
                                decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: getSize(22, context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top +
                            getSize(10, context),
                        child: Container(
                          height: getSize(32, context),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Text("Surbhi Mahendru ",
                              style: TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontSize: getSize(18, context)),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top +
                            getSize(62, context),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: getSize(54, context),
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: getSize(54, context),
                              backgroundImage: AssetImage(
                                Assets.avtar,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top +
                            getSize(182, context),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text("Surbhi Mahendru ",
                                  style: TextStyle(
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: getSize(16, context)),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: getSize(10, context),
                              ),
                              Text("New Delhi \nSales & Marketing",
                                  style: TextStyle(
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: getSize(13, context)),
                                  textAlign: TextAlign.center),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  child: Divider(
                                    color: Colors.white,
                                    indent: getSize(50, context),
                                    endIndent: getSize(50, context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top +
                            getSize(260, context),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Container(
                            width: getSize(300, context),
                            alignment: Alignment.center,
                            child: Text(
                              "Personal trainer and have done several certifications and workshops in yoga",
                              style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontSize: getFontSize(14, context)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top +
                            getSize(314, context),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Container(
                            width: getSize(300, context),
                            height: getSize(50, context),
                            alignment: Alignment.center,
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
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: getSize(425, context),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(50, context)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Badges Earned",
                                  style: TextStyle(
                                      color: const Color(0xff1c1414),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: getFontSize(16, context)),
                                  textAlign: TextAlign.center),
                              Expanded(child: Container()),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.BADGES_SCREEN);
                                },
                                child: Text("See all",
                                    style: TextStyle(
                                        color: const Color(0xff6d6d6e),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roboto",
                                        fontStyle: FontStyle.normal,
                                        fontSize: getSize(13, context)),
                                    textAlign: TextAlign.left),
                              )
                            ],
                          ),
                          SizedBox(
                            height: getSize(10, context),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: getSize(572, context),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Container(
                      width: getSize(180, context),
                      height: getSize(50, context),
                      alignment: Alignment.center,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: const Color(0xff3ba27f),
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Text("Follow",
                              style: TextStyle(
                                  color: const Color(0xfff7f7f7),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontSize: getSize(16, context)),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 700,
              width: double.infinity,
              // color: Colors.blue,
            ),
          ],
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
        //color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${number}",
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: getFontSize(16, context)),
                textAlign: TextAlign.center),
            SizedBox(
              height: getSize(4, context),
            ),
            Text("${name}",
                style: TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: getFontSize(14, context)),
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
          backgroundColor: Colors.white,
          radius: getSize(30, context),
          child: SvgPicture.asset(img!),
        ),
        SizedBox(
          height: getSize(8, context),
        ),
        Text(name!,
            style: TextStyle(
                color: const Color(0xff1c1414),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: getSize(12, context)),
            textAlign: TextAlign.center),
        SizedBox(
          height: getSize(8, context),
        ),
        Text("${number.toString()}",
            style: TextStyle(
                color: const Color(0xff6d6d6e),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: getSize(12, context)),
            textAlign: TextAlign.center)
      ],
    );
  }
}
