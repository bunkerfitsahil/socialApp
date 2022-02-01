import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/app/modules/individual_chalange_screen/controllers/individual_chalange_screen_controller.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

class IndividualChalangeScreenView
    extends GetWidget<IndividualChalangeScreenController> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                getTopImageSection(),
                getChalangeNameAndTimeSection(),
                aboutChalangeandCommentSection(),
                Padding(
                  padding: EdgeInsets.only(
                      left: MySize.getScaledSizeWidth(22.5),
                      right: MySize.getScaledSizeWidth(21)),
                  child: Container(
                    height: MySize.getScaledSizeHeight(0.5),
                    width: double.infinity,
                    color: AppColors.textGray,
                  ),
                ),
                SizedBox(
                  height: MySize.size46,
                ),
                joinTeamButton(),
                SizedBox(
                  height: MySize.size18,
                ),
              ],
            ),
          ),
        ),
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
            top: MySize.size19,
            left: MySize.size23,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: MySize.size26,
                    height: MySize.size26,
                    decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        size: MySize.size22!,
                      ),
                    ),
                  ),
                ),
              ],
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
          left: MySize.getScaledSizeWidth(26), top: MySize.size26!),
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
            height: MySize.size40,
          ),
          Container(
            height: MySize.size19,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  width: MySize.getScaledSizeWidth(32),
                ),
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
            ),
          ),
          SizedBox(
            height: MySize.size20,
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
          Get.toNamed(Routes.MY_UPCOMING_INDIVIDUAL_SCREEN);
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
            child: Text("Join Challenges",
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
