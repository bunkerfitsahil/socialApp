import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/DateUtilities.dart';
import 'package:social_feed_flutter/constants/argumentConstant.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/dateConstant.dart';
import 'package:social_feed_flutter/constants/dimention.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';
import 'package:social_feed_flutter/utils/pref_utils.dart';
import 'package:social_feed_flutter/utils/progress_dialog_utils.dart';
import 'package:video_player/video_player.dart';

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
            appBar: getAppBarPart(),
            body: Obx(() {
              return (controller.hasPostData.value)
                  ? SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MySize.size30,
                          ),
                          getTopProfilePostCreate(),
                          (controller.allPostList.isNotEmpty)
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

  PreferredSizeWidget getAppBarPart() {
    return AppBar(
      leading: Icon(
        Icons.menu,
        color: AppColors.darkText,
        size: MySize.size25,
      ),
      leadingWidth: MySize.getScaledSizeWidth(80),
      actions: [
        Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              Container(
                height: MySize.size36,
                width: MySize.getScaledSizeWidth(Dimens.d_95),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.d_100),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.bAppBarLogo,
                        height: MySize.size30,
                        width: MySize.size30,
                      ),
                      SizedBox(
                        width: MySize.getScaledSizeWidth(5),
                      ),
                      Flexible(
                        child: Text(
                          "83245",
                          style: TextStyle(
                              fontSize: MySize.size14,
                              color: AppColors.nearlyBlack),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MySize.getScaledSizeWidth(Dimens.d_20),
              )
            ],
          ),
        ),
      ],
      backgroundColor: AppColors.nearlyWhite,
    );
  }

  getAllImageData() {
    if (controller.allPostList.isNotEmpty) {
      return Stack(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return Obx(() {
                return Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MySize.size22,
                      ),
                      getUserTopPostData(i),
                      SizedBox(
                        height: MySize.size18,
                      ),
                      getPostDescriptionData(i),
                      getPostImageView(i),
                      SizedBox(
                        height: MySize.size21,
                      ),
                      getPostCommentLikeSection(i),
                      SizedBox(
                        height: MySize.getScaledSizeHeight(15.6),
                      ),
                    ],
                  ),
                );
              });
            },
            itemCount: controller.allPostList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                  width: double.infinity,
                  height: MySize.getScaledSizeHeight(0.5),
                  decoration: BoxDecoration(color: AppColors.textGray));
            },
          ),
          if (controller.isLoading.value) ...[
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                height: MySize.size80,
                width: MySize.screenWidth,
                child: SpinKitCircle(
                  color: AppColors.button_green,
                ),
              ),
            ),
          ]
        ],
      );
    } else {
      return Container(
        child: Text("No Data Found"),
      );
    }
  }

  Widget getPostCommentLikeSection(int i) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MySize.getScaledSizeWidth(Dimens.d_22)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MySize.getScaledSizeWidth(Dimens.d_50),
            child: LikeButton(
              circleColor: CircleColor(
                  start: AppColors.buttonStartColor,
                  end: AppColors.buttonEndColor),
              bubblesColor: BubblesColor(
                dotPrimaryColor: AppColors.dotPrimaryColor,
                dotSecondaryColor: AppColors.dotPrimaryColor,
              ),
              likeBuilder: (bool isLiked) {
                return SvgPicture.asset(
                  Assets.trophy,
                  color: isLiked ? AppColors.button_green : AppColors.grey,
                  width: MySize.getScaledSizeWidth(13.3),
                  height: MySize.size17,
                );
              },
              onTap: (isLiked) async {
                if (controller.allPostList[i].isLiked == true) {
                  controller.isLikeSuccess.value = false;
                  await controller.deletePostLike(
                    id: controller.allPostList[i].loggedInUserPostLikeId,
                    successCall: () {
                      controller.allPostList[i].isLiked = false;

                      controller.allPostList[i].numberOfLikes =
                          controller.allPostList[i].numberOfLikes! - 1;
                    },
                  );
                } else {
                  controller.isLikeSuccess.value = false;
                  await controller.createPostLike(
                    id: controller.allPostList[i].id,
                    postDataModel: controller.allPostList[i],
                    successCall: () {
                      controller.allPostList[i].isLiked = true;

                      controller.allPostList[i].numberOfLikes =
                          controller.allPostList[i].numberOfLikes! + 1;
                    },
                  );
                }

                return (controller.isLikeSuccess.value) ? !isLiked : isLiked;
              },
              likeCount: controller.allPostList[i].numberOfLikes,
              countPostion: CountPostion.left,
              isLiked: controller.allPostList[i].isLiked,
              countBuilder: (int? count, bool isLiked, String text) {
                var color = isLiked ? AppColors.deepColor : AppColors.grey;
                Widget result;
                if (count == 0) {
                  result = Text(
                    "0",
                    style: TextStyle(color: color),
                  );
                } else
                  result = Text(
                    text,
                    style: TextStyle(color: color),
                  );
                return result;
              },
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.POST_DETAIL_SCREEN,
                  arguments: {Argument.postData: controller.allPostList[i]});
            },
            child: Container(
              height: MySize.size26,
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.comment,
                    color: AppColors.grey,
                    width: MySize.getScaledSizeWidth(13.7),
                    height: MySize.getScaledSizeHeight(13.7),
                  ),
                  SizedBox(
                    width: MySize.getScaledSizeWidth(Dimens.d_8),
                  ),
                  Text(
                    "${controller.allPostList[i].numberOfComments} comments",
                    style: TextStyle(
                        color: AppColors.textGrayBlackColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.roboto,
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
                width: MySize.getScaledSizeWidth(Dimens.d_14),
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
    );
  }

  Widget getPostImageView(int i) {
    return Container(
      width: double.infinity,
      height: MySize.size240,
      child: (controller.allPostList[i].fileType == "Video")
          ? VideoPlayerItem(
              url: controller.allPostList[i].attachment.toString(),
              videoPlayerController: VideoPlayerController.network(
                  controller.allPostList[i].attachment.toString()),
            )
          : CachedNetworkImage(
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
    );
  }

  Widget getPostDescriptionData(int i) {
    return Column(
      children: [
        (PrefUtils.isNullEmptyOrFalse(controller.allPostList[i].postBody))
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MySize.getScaledSizeWidth(Dimens.d_22)),
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
      ],
    );
  }

  Widget getUserTopPostData(int i) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MySize.getScaledSizeWidth(Dimens.d_22)),
      child: InkWell(
        onTap: () {
          controller.goToUserProfileScreen(
              id: controller.allPostList[i].userData!.userProfileId,
              isLoginUser: false);
        },
        child: Row(
          children: [
            Container(
              height: MySize.size35,
              width: MySize.size35,
              child: CircleAvatar(
                radius: MySize.size35,
                child: CachedNetworkImage(
                  imageUrl: controller.allPostList[i].userData!.profilePicture
                      .toString(),
                  placeholder: (context, url) => SpinKitCircle(
                    color: AppColors.greenColor,
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
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(
              width: MySize.getScaledSizeWidth(Dimens.d_12),
            ),
            Column(
              children: [
                Text(controller.allPostList[i].userData!.name.toString(),
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
                    TimeAgo.timeAgoSinceDate(DateFormat("dd-MM-yyyy hh:mma")
                        .format(DateUtilities()
                            .getDateFromString(
                                controller.allPostList[i].createdAt.toString())
                            .toLocal()
                            .add(Duration(hours: 5, minutes: 30)))),
                    style: TextStyle(
                        color: AppColors.textGrayBlackColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.roboto,
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
      padding: EdgeInsets.symmetric(
          horizontal: MySize.getScaledSizeWidth(Dimens.d_22)),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  controller.goToUserProfileScreen(id: 2, isLoginUser: true);
                },
                child: Container(
                  height: MySize.size35,
                  width: MySize.size35,
                  child: CircleAvatar(
                    radius: MySize.size35,
                    child: CachedNetworkImage(
                      imageUrl: "",
                      placeholder: (context, url) => SpinKitCircle(
                        color: AppColors.greenColor,
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
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MySize.getScaledSizeWidth(Dimens.d_15),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.d_500),
                    color: AppColors.grey.withOpacity(0.4),
                  ),
                  height: MySize.size35,
                  child: TextField(
                    controller: controller.postData.value,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      fillColor: AppColors.borderWhite,
                      filled: true,
                      contentPadding: EdgeInsets.only(
                          bottom: MySize.size35! / 2,
                          left: MySize.getScaledSizeWidth(Dimens.d_10)),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(Dimens.d_100)),
                        borderSide: BorderSide(
                            color: AppColors.grey, width: Dimens.d_1),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(Dimens.d_100)),
                        borderSide: BorderSide(
                            color: AppColors.borderWhite, width: Dimens.d_1),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(Dimens.d_100)),
                        borderSide: BorderSide(
                            color: AppColors.borderWhite, width: Dimens.d_1),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(Dimens.d_100)),
                        borderSide: BorderSide(
                            color: AppColors.grey, width: Dimens.d_1),
                      ),
                      hintText: "What's New, ",
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
                        width: MySize.getScaledSizeWidth(Dimens.d_20),
                      ),
                      SizedBox(
                        width: MySize.getScaledSizeWidth(Dimens.d_12),
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
                width: MySize.getScaledSizeWidth(Dimens.d_64),
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
                  width: MySize.getScaledSizeWidth(Dimens.d_65),
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
        ],
      ),
    );
  }

  Widget svgImage(context, {String? img, double? height, double? width}) {
    return SvgPicture.asset(
      Assets.share,
      color: AppColors.grey,
      width: MySize.getScaledSizeWidth(20),
      height: MySize.size20,
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
  }

  _onCreateAuthloginError() {
    print("Eroorrrrrrr........");
  }
}
