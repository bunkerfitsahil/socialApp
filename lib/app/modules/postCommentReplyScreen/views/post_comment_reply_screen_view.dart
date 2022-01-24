import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/math_utils.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';

import '../controllers/post_comment_reply_screen_controller.dart';

class PostCommentReplyScreenView
    extends GetWidget<PostCommentReplyScreenController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getSize(15, context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MySize.size20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: MySize.getScaledSizeWidth(28),
                        height: MySize.size28,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            size: MySize.size13,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MySize.size17,
                    ),
                    Container(
                      height: MySize.size19,
                      child: Text("Replies to Sarfaraz’s comments",
                          style: TextStyle(
                              color: AppColors.textBlackColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.roboto,
                              fontStyle: FontStyle.normal,
                              fontSize: MySize.size14),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: MySize.size8,
                    ),
                    Container(
                      height: MySize.getScaledSizeHeight(0.5),
                      color: AppColors.textGray,
                    ),
                    SizedBox(
                      height: MySize.size28,
                    ),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (i % 2 != 0)
                                    SizedBox(
                                      width: getSize(20, context),
                                    ),
                                  CircleAvatar(
                                    radius: MySize.size17,
                                    // backgroundImage:
                                    //     AssetImage(Assets.avtar),
                                    child: CachedNetworkImage(
                                      imageUrl: "",
                                      placeholder: (context, url) =>
                                          SpinKitCircle(
                                        color: Colors.green,
                                        size: MySize.size20!,
                                      ),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        height: MySize.size17,
                                        width: MySize.size17,
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
                                  SizedBox(
                                    width: getSize(10, context),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: MySize.size49,
                                      child: Column(
                                        children: [
                                          Text("jus bshushd jsbdushdsud",
                                              style: TextStyle(
                                                  color:
                                                      AppColors.textBlackColor,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily:
                                                      FontFamily.robotoBold,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: MySize.size14),
                                              textAlign: TextAlign.left),
                                          SizedBox(
                                            height: MySize.size3,
                                          ),
                                          Text("hdgd dhvdhVDdgD udguD",
                                              style: TextStyle(
                                                  color: AppColors
                                                      .textGrayBlackColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontFamily.roboto,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: MySize.size14),
                                              textAlign: TextAlign.left)
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.profileFollowText,
                                        borderRadius: BorderRadius.circular(
                                            MySize.size8!),
                                      ),
                                      padding: EdgeInsets.only(
                                          left: MySize.getScaledSizeWidth(7),
                                          top: MySize.size6!,
                                          bottom: MySize.size6!),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MySize.getScaledSizeWidth(49),
                                    top: MySize.size10!),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("6",
                                            style: TextStyle(
                                                color: AppColors
                                                    .textGrayBlackColor,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: FontFamily.roboto,
                                                fontStyle: FontStyle.normal,
                                                fontSize: MySize.size14),
                                            textAlign: TextAlign.right),
                                        SizedBox(
                                          width: MySize.getScaledSizeWidth(8),
                                        ),
                                        SvgPicture.asset(
                                          Assets.trophy,
                                          color: AppColors.button_green,
                                          width: MySize.getScaledSizeWidth(16),
                                          height: MySize.size16,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Reply",
                                            style: TextStyle(
                                                color: AppColors
                                                    .textGrayBlackColor,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: FontFamily.roboto,
                                                fontStyle: FontStyle.normal,
                                                fontSize: MySize.size12),
                                            textAlign: TextAlign.right),
                                        SizedBox(
                                          width: MySize.size7,
                                        ),
                                        Container(
                                            width: MySize.size3,
                                            height: MySize.size3,
                                            decoration: BoxDecoration(
                                                color: AppColors.textBlackColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100))),
                                        SizedBox(
                                          width: MySize.getScaledSizeWidth(16),
                                        ),
                                        Text("1",
                                            style: TextStyle(
                                                color: AppColors.textBlackColor,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: FontFamily.roboto,
                                                fontStyle: FontStyle.normal,
                                                fontSize: MySize.size14),
                                            textAlign: TextAlign.right)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 100,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: getSize(20, context),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MySize.getScaledSizeWidth(29.5)),
              margin: EdgeInsets.only(bottom: MySize.getScaledSizeHeight(20)),
              width: double.infinity,
              height: MySize.size36,
              child: Form(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        // controller: controller.commentController.value,
                        decoration: InputDecoration(
                          isDense: true,
                          fillColor: Color(0xffF0F0F0),
                          //filled: true,
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            borderSide:
                                BorderSide(color: AppColors.textGray, width: 1),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            borderSide:
                                BorderSide(color: AppColors.textGray, width: 1),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            borderSide:
                                BorderSide(color: AppColors.textGray, width: 1),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            borderSide:
                                BorderSide(color: AppColors.textGray, width: 1),
                          ),
                          hintText: "",
                          suffixIcon: InkWell(
                            onTap: () {
                              // controller.commentController.value.text = "";
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                              size: getSize(24, context),
                            ),
                          ),

                          hintStyle: TextStyle(
                              color: Color(0xffacacac),
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.roboto,
                              fontStyle: FontStyle.normal,
                              fontSize: MySize.size16),
                        ),
                        cursorColor: Colors.black12.withOpacity(0.6),
                      ),
                    ),
                    Container(
                      child: SvgPicture.asset(
                        Assets.sendIcon,
                        height: MySize.getScaledSizeHeight(30.5),
                        width: MySize.getScaledSizeWidth(30.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
