import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/math_utils.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

import '../controllers/badges_screen_controller.dart';

class BadgesScreenView extends GetWidget<BadgesScreenController> {
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
                        child: Text("Surbhi Mahendru",
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
                  padding: EdgeInsets.only(top: getSize(15, context)),
                  color: const Color(0xffeef0f0),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getSize(40, context)),
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
                          ],
                        ),
                        SizedBox(
                          height: getSize(15, context),
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
                        SizedBox(
                          height: getSize(15, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            streakWidget(context,
                                name: "3 Day Streak",
                                img: Assets.streak4,
                                number: 5),
                            streakWidget(context,
                                name: "3 Day Streak",
                                img: Assets.streak5,
                                number: 2),
                            streakWidget(context,
                                name: "3 Day Streak",
                                img: Assets.streak6,
                                number: 2),
                          ],
                        ),
                      ],
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

  Widget streakWidget(context, {int? number, String? name, String? img}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: getSize(30, context),
          child: SvgPicture.asset(
            img!,
          ),
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
                fontSize: getSize(14, context)),
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
                fontSize: getSize(14, context)),
            textAlign: TextAlign.center)
      ],
    );
  }
}
