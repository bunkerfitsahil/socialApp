import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

import '../controllers/no_team_exist_alert_screen_controller.dart';

class NoTeamExistAlertScreenView
    extends GetWidget<NoTeamExistAlertScreenController> {
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
                height: MySize.size66,
              ),
              getNoTeamView(),
              SizedBox(
                height: MySize.size31,
              ),
              createOwnTeamMessage(),
              getCreateTeamButton(),
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

  Container getNoTeamView() {
    return Container(
      height: MySize.getScaledSizeHeight(116),
      width: MySize.getScaledSizeWidth(231),
      child: Stack(
        children: [
          Positioned(
            top: MySize.size47,
            child: Container(
              height: MySize.size60,
              width: MySize.getScaledSizeWidth(231),
              padding: EdgeInsets.only(
                  top: MySize.size14!,
                  left: MySize.getScaledSizeWidth(16),
                  right: MySize.getScaledSizeWidth(15)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: AppColors.backGray, width: 1),
                  color: AppColors.backChalangeColor),
              child: Container(
                child: Center(
                  child: Text("No team has been created for \nthis challenge",
                      style: TextStyle(
                          color: AppColors.textBlackColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamily.roboto,
                          fontStyle: FontStyle.normal,
                          fontSize: MySize.size14),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          ),
          Container(
            height: MySize.getScaledSizeHeight(59),
            width: MySize.getScaledSizeWidth(231),
            child: Center(
              child: SvgPicture.asset(
                Assets.no_team,
                width: MySize.getScaledSizeWidth(69),
                height: MySize.getScaledSizeHeight(59),
              ),
            ),
          ),
        ],
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
          Text("Total Teams 0",
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

  Expanded getCreateTeamButton() {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Expanded(child: Container()),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MySize.getScaledSizeWidth(22),
                  vertical: MySize.size35!),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.CREATE_TEAM_SCREEN);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size3!)),
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
                    child: Text("Create",
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
            ),
          ],
        ),
      ),
    );
  }

  Container createOwnTeamMessage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(74)),
      child: Container(
        height: MySize.size38,
        child: FittedBox(
          child: Text(
              "Create your own team and invite \nyour friends and participate",
              style: TextStyle(
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.roboto,
                  fontStyle: FontStyle.normal,
                  fontSize: MySize.size14),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
