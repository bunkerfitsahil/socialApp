import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/DateUtilities.dart';
import 'package:social_feed_flutter/constants/argumentConstant.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/dateConstant.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/math_utils.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';
import 'package:social_feed_flutter/utils/pref_utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              leading: Icon(
                Icons.menu,
                color: AppColors.darkText,
                size: getSize(50, context),
              ),
              leadingWidth: getSize(80, context),
              actions: [
                Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      Container(
                        height: getSize(36, context),
                        width: getSize(95, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.bAppBarLogo,
                                height: getSize(30, context),
                                width: getSize(30, context),
                              ),
                              SizedBox(
                                width: getSize(5, context),
                              ),
                              Flexible(
                                child: Text(
                                  "83245",
                                  style: TextStyle(
                                      fontSize: getSize(14, context),
                                      color: AppColors.nearlyBlack),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getSize(20, context),
                      )
                    ],
                  ),
                ),
              ],
              backgroundColor: AppColors.nearlyWhite,
            ),
            body: Obx(() {
              return (controller.hasPostData.value)
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MySize.size30,
                          ),
                          getTopProfilePostCreate(),
                          (controller.allPostList.value.isNotEmpty)
                              ? getAllImageData()
                              : noDataFound(),
                        ],
                      ),
                    )
                  : SpinKitCircle(
                      color: AppColors.greenColor,
                      size: MySize.size50!,
                    );
            }),
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: getBottomData(context),
          ),
        ],
      ),
    );
  }

  Widget getAllImageData() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return Container(
          child: Column(
            children: [
              SizedBox(
                height: MySize.size22,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MySize.getScaledSizeWidth(22)),
                child: InkWell(
                  onTap: () {
                    controller.goToUserProfileScreen();
                  },
                  child: Row(
                    children: [
                      Container(
                        height: MySize.size35,
                        width: MySize.size35,
                        child: CircleAvatar(
                          radius: MySize.size35,
                          child: CachedNetworkImage(
                            imageUrl: controller
                                .allPostList[i].userData!.profilePicture
                                .toString(),
                            placeholder: (context, url) => SpinKitCircle(
                              color: Colors.green,
                              size: MySize.size25!,
                            ),
                            imageBuilder: (context, imageProvider) => Container(
                              height: MySize.size35,
                              width: MySize.size35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
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
                      SizedBox(
                        width: MySize.getScaledSizeWidth(12),
                      ),
                      Column(
                        children: [
                          Text(
                              controller.allPostList[i].userData!.name
                                  .toString(),
                              style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.robotoBold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: MySize.size14),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: MySize.size1,
                          ),
                          Text(
                              // TimeAgo.timeAgoSinceDate(
                              //     controller
                              //         .allPostList[i]
                              //         .createdAt
                              //         .toString()),
                              TimeAgo.timeAgoSinceDate(DateFormat(
                                      "dd-MM-yyyy hh:mma")
                                  .format(DateUtilities()
                                      .getDateFromString(controller
                                          .allPostList[i].createdAt
                                          .toString())
                                      .toLocal()
                                      .add(Duration(hours: 5, minutes: 30)))),
                              style: TextStyle(
                                  color: AppColors.textGrayBlackColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontSize: MySize.size12),
                              textAlign: TextAlign.left),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size18,
              ),
              (PrefUtils.isNullEmptyOrFalse(controller.allPostList[i].postBody))
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MySize.getScaledSizeWidth(22)),
                      // child: AutoSizeText(
                      //   'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy ',
                      //   style:
                      //       TextStyle(fontSize: getFontSize(20, context)),
                      //   maxFontSize: getFontSize(20, context),
                      //   minFontSize: getFontSize(10, context),
                      //   maxLines: 2,
                      // ),
                      child: Container(
                        child: AutoSizeText(
                          controller.allPostList[i].postBody.toString(),
                          style: TextStyle(
                              fontSize: MySize.size14,
                              color: AppColors.textBlackColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.roboto,
                              fontStyle: FontStyle.normal,
                              wordSpacing: 1),
                          minFontSize: 12,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        alignment: Alignment.centerLeft,
                      )),
              (PrefUtils.isNullEmptyOrFalse(controller.allPostList[i].postBody))
                  ? Container()
                  : SizedBox(
                      height: MySize.size10,
                    ),
              Container(
                width: double.infinity,
                height: MySize.size240,
                child: CachedNetworkImage(
                  imageUrl: controller.allPostList[i].attachment.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => SpinKitCircle(
                    color: AppColors.greenColor,
                    size: MySize.size30!,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: MySize.size21,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getSize(18, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              controller.allPostList[i].numberOfLikes
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: MySize.size14),
                            ),
                            SizedBox(
                              width: MySize.getScaledSizeWidth(8),
                            ),
                            SvgPicture.asset(
                              Assets.trophy,
                              color: AppColors.button_green,
                              width: MySize.getScaledSizeWidth(13.3),
                              height: MySize.size17,
                            ),
                          ],
                        ),
                        height: MySize.size26,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.POST_DETAIL_SCREEN, arguments: {
                          Argument.postData: controller.allPostList[i]
                        });
                      },
                      child: Container(
                        height: MySize.size26,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.comment,
                              color: Colors.grey,
                              width: MySize.getScaledSizeWidth(13.7),
                              height: MySize.getScaledSizeHeight(13.7),
                            ),
                            SizedBox(
                              width: MySize.getScaledSizeWidth(8),
                            ),
                            Text(
                              "${controller.allPostList[i].numberOfComments} comments",
                              style: TextStyle(
                                  color: AppColors.textGrayBlackColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontSize: MySize.size14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        height: MySize.size26,
                        child: SvgPicture.asset(
                          Assets.share,
                          color: AppColors.textGrayBlackColor.withOpacity(0.7),
                          width: MySize.getScaledSizeWidth(14),
                          height: MySize.size14,
                        ),
                      ),
                      onTap: () {
                        var text = (controller.allPostList[i].postBody != null)
                            ? controller.allPostList[i].postBody
                            : null;
                        var msg = (text != null)
                            ? "${controller.allPostList[i].attachment!} \n $text"
                            : controller.allPostList[i].attachment!;
                        Share.share(msg);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MySize.getScaledSizeHeight(15.6),
              ),
            ],
          ),
        );
      },
      itemCount: controller.allPostList.value.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
            width: double.infinity,
            height: MySize.getScaledSizeHeight(0.5),
            decoration: BoxDecoration(color: AppColors.textGray));
      },
    );
  }

  Widget noDataFound() {
    return Container(
      height: MySize.size300,
      width: double.infinity,
      child: Text("No Posts",
          style: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontFamily: FontFamily.roboto,
              fontStyle: FontStyle.normal,
              fontSize: MySize.size20),
          textAlign: TextAlign.center),
      alignment: Alignment.center,
    );
  }

  Widget getBottomData(context) {
    return SafeArea(
      child: Container(
        child: Container(
          height: MySize.size60,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: AppColors.grey.withOpacity(0.1),
                  child: Center(
                    child: bottomData(context,
                        name: "Explore", img: Assets.explore),
                  ),
                ),
              ),
              VerticalDivider(
                color: AppColors.grey.withOpacity(0.7),
                thickness: 2,
                width: 0,
                endIndent: 10,
                indent: 10,
              ),
              Expanded(
                child: Container(
                  color: AppColors.grey.withOpacity(0.1),
                  child: Center(
                    child: bottomData(context, name: "Feed", img: Assets.feed),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTopProfilePostCreate() {
    return Container(
      //height: getSize(70, context),
      padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(22)),

      width: double.infinity,

      //   color: Colors.red,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: MySize.size35,
                width: MySize.getScaledSizeWidth(35),
                child: CircleAvatar(
                  backgroundImage: AssetImage(Assets.avtar),
                ),
              ),
              SizedBox(
                width: MySize.getScaledSizeWidth(15),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500.0),
                    color: AppColors.grey.withOpacity(0.4),
                  ),
                  height: MySize.size35,
                  child: TextField(
                    controller: controller.postData.value,
                    textAlign: TextAlign.left,
                    // controller: _controller,
                    decoration: InputDecoration(
                      // isDense: true,
                      fillColor: Color(0xffF0F0F0),
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(color: AppColors.grey, width: 1),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide:
                            BorderSide(color: AppColors.borderWhite, width: 1),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide:
                            BorderSide(color: AppColors.borderWhite, width: 1),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(color: AppColors.grey, width: 1),
                      ),
                      hintText: "What's New, Surbhi?",
                      hintStyle: TextStyle(
                          color: AppColors.textGray,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamily.roboto,
                          fontStyle: FontStyle.normal,
                          fontSize: MySize.size14),
                    ),
                    cursorColor: AppColors.blackColor.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MySize.size14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  controller.getImage();
                },
                child: Container(
                  height: MySize.size27,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.gallery,
                        height: MySize.size16,
                        width: MySize.getScaledSizeWidth(20),
                      ),
                      SizedBox(
                        width: MySize.getScaledSizeWidth(12),
                      ),
                      Text("Picture / Video",
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
              ),
              SizedBox(
                width: MySize.getScaledSizeWidth(64),
              ),
              InkWell(
                onTap: () {
                  if (controller.isImageSelected.value) {
                    controller.postData.value.text = "";
                    controller.onClickPostButton(
                        successCall: _onCreateAuthloginSuccess,
                        errCall: _onCreateAuthloginError);
                  } else {
                    Fluttertoast.showToast(msg: "Please Select Picture.");
                  }
                },
                child: Container(
                  height: MySize.size27,
                  width: MySize.getScaledSizeWidth(65),
                  decoration: BoxDecoration(
                      color: AppColors.button_green,
                      borderRadius: BorderRadius.circular(MySize.size3!)),
                  child: Center(
                    child: Text("Post",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.roboto,
                            fontStyle: FontStyle.normal,
                            fontSize: MySize.size12),
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MySize.size27,
          ),
          Container(
              width: double.infinity,
              height: MySize.getScaledSizeHeight(0.5),
              decoration: BoxDecoration(color: AppColors.textGray)),
          // Divider(
          //   color: AppColors.grey.withOpacity(0.4),
          //   thickness: 2,
          //   indent: MySize.getScaledSizeWidth(22),
          //   endIndent: MySize.getScaledSizeWidth(22),
          // ),
        ],
      ),
    );
  }

  Widget svgImage(context, {String? img, double? height, double? width}) {
    return SvgPicture.asset(
      Assets.share,
      color: Colors.grey,
      width: getSize(20, context),
      height: getSize(20, context),
    );
  }

  Widget bottomData(context, {String? name, String? img}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          img!,
          color: AppColors.button_green,
          height: MySize.size16,
          width: MySize.getScaledSizeWidth(16),
        ),
        SizedBox(
          width: MySize.getScaledSizeWidth(8.3),
        ),
        Text(name!,
            style: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.roboto,
                fontStyle: FontStyle.normal,
                fontSize: MySize.size14),
            textAlign: TextAlign.left)
      ],
    );
  }

  void _onCreateAuthloginSuccess() {
    print("YESSsssssssssss........");
    // controller.sharedPreferences
    //     .setString("UserName", controller.userNameController.text.toString());
    //Get.offAllNamed(AppRoutes.homeScreen);
  }

  _onCreateAuthloginError() {
    print("Eroorrrrrrr........");
  }
}
