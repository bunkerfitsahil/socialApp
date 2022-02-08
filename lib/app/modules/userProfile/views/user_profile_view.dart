import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetWidget<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SafeArea(
          child: (controller.hasData.value)
              ? (controller.userDataResp != null)
                  ? SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Column(
                        children: [
                          Container(
                            height: MySize.getScaledSizeHeight(298),
                            child: Stack(
                              children: [
                                Container(
                                  height: MySize.getScaledSizeHeight(298),
                                  decoration: BoxDecoration(
                                    color: AppColors.button_green,
                                  ),
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: MySize.size140,
                                        width: double.infinity,
                                        child: Image(
                                          image: AssetImage(Assets.profBack),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                        top: MySize.size19,
                                        left: MySize.getScaledSizeHeight(21),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Container(
                                                width:
                                                    MySize.getScaledSizeWidth(
                                                        Dimens.d_28),
                                                height: MySize.size28,
                                                decoration: BoxDecoration(
                                                    color: AppColors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
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
                                      Positioned(
                                        top: MySize.size19,
                                        child: Container(
                                          height:
                                              MySize.getScaledSizeHeight(30.2),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          child: Text(
                                              "${controller.userDataResp!.firstName} ${controller.userDataResp!.lastName}",
                                              style: TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: FontFamily.roboto,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: MySize.size14),
                                              textAlign: TextAlign.center),
                                        ),
                                      ),
                                      getUserAllDetail(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MySize.getScaledSizeHeight(272),
                            child: Stack(
                              children: [
                                Container(
                                  height: MySize.size254,
                                  color: AppColors.profileBack,
                                ),
                                getPostFollowerCount(),
                                getBadgeSection(),
                                Positioned(
                                  top: MySize.getScaledSizeHeight(236),
                                  child: (!controller.isLogInUser)
                                      ? getStatusButtonTag()
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
                          (controller.isLogInUser)
                              ? (controller.hasPostData.value)
                                  ? (controller.allPostList.value.isNotEmpty)
                                      ? getAllImageData()
                                      : noDataFound()
                                  : SpinKitCircle(
                                      color: AppColors.greenColor,
                                    )
                              : ((controller
                                          .userDataResp!.followRequestStatus ==
                                      "Following")
                                  ? ((controller.hasPostData.value)
                                      ? (controller
                                              .allPostList.value.isNotEmpty)
                                          ? getAllImageData()
                                          : noDataFound()
                                      : SpinKitCircle(
                                          color: AppColors.greenColor,
                                        ))
                                  : Container()),
                        ],
                      ),
                    )
                  : Center(
                      child: Text(
                        "No Data Found",
                        style: TextStyle(
                            color: AppColors.textBlackColor,
                            fontSize: MySize.size23),
                      ),
                    )
              : Center(
                  child: SpinKitCircle(
                  size: MySize.size35!,
                  color: AppColors.button_green,
                )),
        );
      }),
    );
  }

  getPostFollowerCount() {
    return Container(
      width: MySize.screenWidth,
      alignment: Alignment.center,
      height: MySize.getScaledSizeHeight(52),
      decoration: BoxDecoration(
          color: AppColors.button_green,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(MySize.size21!),
              bottomRight: Radius.circular(MySize.size21!))),
      child: Column(
        children: [
          Container(
            width: MySize.getScaledSizeWidth(298),
            height: MySize.size38,
            // color: Colors.red,
            alignment: Alignment.center,
            child: Container(
              height: MySize.size38,
              child: Row(
                children: [
                  Expanded(
                    child: columnPost(
                        name: "Post",
                        number: PrefUtils.isNullEmptyOrFalse(
                                controller.userDataResp!.postCount!)
                            ? 0
                            : controller.userDataResp!.postCount!),
                  ),
                  VerticalDivider(
                    color: Colors.white,
                  ),
                  Expanded(
                    child: columnPost(
                        name: "Followers",
                        number: PrefUtils.isNullEmptyOrFalse(
                                controller.userDataResp!.followerCount!)
                            ? 0
                            : controller.userDataResp!.followerCount!),
                  ),
                  VerticalDivider(
                    color: Colors.white,
                  ),
                  Expanded(
                    child: columnPost(
                        name: "Following",
                        number: PrefUtils.isNullEmptyOrFalse(
                                controller.userDataResp!.followingCount!)
                            ? 0
                            : controller.userDataResp!.followingCount!),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MySize.size14,
          ),
        ],
      ),
    );
  }

  getBadgeSection() {
    return Positioned(
      top: MySize.size72,
      child: Container(
        width: MySize.screenWidth,
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MySize.getScaledSizeWidth(Dimens.d_39)),
          child: Column(
            children: [
              Container(
                height: MySize.size19,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Badges Earned",
                        style: TextStyle(
                            color: AppColors.textBlackColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.robotoBold,
                            fontStyle: FontStyle.normal,
                            fontSize: MySize.size12),
                        textAlign: TextAlign.center),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.BADGES_SCREEN);
                      },
                      child: Text("See all",
                          style: TextStyle(
                              color: AppColors.textGrayBlackColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.roboto,
                              fontStyle: FontStyle.normal,
                              fontSize: MySize.size12),
                          textAlign: TextAlign.left),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MySize.size24,
              ),
              Container(
                height: MySize.getScaledSizeHeight(105.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    streakWidget(
                        name: "3 Day Streak", img: Assets.streak1, number: 5),
                    streakWidget(
                        name: "3 Day Streak", img: Assets.streak2, number: 2),
                    streakWidget(
                        name: "3 Day Streak", img: Assets.streak3, number: 2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getUserAllDetail() {
    return Positioned(
      top: MySize.size73,
      child: Container(
        width: MySize.safeWidth,
        height: MySize.getScaledSizeHeight(229),
        alignment: Alignment.center,
        child: Column(
          children: [
            CircleAvatar(
              radius: MySize.size41,
              backgroundColor: Colors.transparent,
              child: CachedNetworkImage(
                imageUrl: PrefUtils.isNullEmptyOrFalse(
                        controller.userDataResp!.profilePicture)
                    ? ""
                    : controller.userDataResp!.profilePicture!,
                placeholder: (context, url) => SpinKitCircle(
                  color: Colors.green,
                  size: MySize.size25!,
                ),
                imageBuilder: (context, imageProvider) => Container(
                  height: MySize.size82,
                  width: MySize.size82,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.white,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  height: MySize.size82,
                  width: MySize.size82,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.button_green,
                  ),
                  child: Icon(
                    Icons.person,
                    color: AppColors.white,
                    size: MySize.size40,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MySize.size8,
            ),
            Text(
                "${controller.userDataResp!.firstName} ${controller.userDataResp!.lastName}",
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.roboto,
                    fontStyle: FontStyle.normal,
                    fontSize: MySize.size14),
                textAlign: TextAlign.center),
            SizedBox(
              height: MySize.size5,
            ),
            Container(
              height: MySize.size32,
              child: Text(
                  "New Delhi \n${controller.userDataResp!.user!.userType}",
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.roboto,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size12),
                  textAlign: TextAlign.center),
            ),
            Container(
              child: Divider(
                color: Colors.white,
                indent: MySize.getScaledSizeWidth(38.5),
                endIndent: MySize.getScaledSizeWidth(37.5),
              ),
            ),
            (PrefUtils.isNullEmptyOrFalse(controller.userDataResp!.bio))
                ? Container()
                : Container(
                    width: MySize.screenWidth,
                    alignment: Alignment.center,
                    child: Container(
                      width: MySize.getScaledSizeWidth(264),
                      alignment: Alignment.center,
                      child: Text(
                        controller.userDataResp!.bio.toString(),
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.roboto,
                            fontStyle: FontStyle.normal,
                            fontSize: MySize.size12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  getStatusButtonTag() {
    return Container(
      width: MySize.screenWidth,
      height: MySize.size32,
      alignment: Alignment.center,
      child: Container(
        width: MySize.size150,
        // height: getSize(50, context),
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            if (controller.userDataResp!.followRequestStatus ==
                "No follow request yet") {
              controller.createFollowRequest();
            } else if (controller.userDataResp!.followRequestStatus ==
                "Following") {
              controller.unfollowUser();
            }
          },
          child: Container(
            // height: 100,
            decoration: BoxDecoration(
                color: AppColors.button_green,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(controller.followStatus!.value,
                  style: TextStyle(
                      color: AppColors.profileFollowText,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.roboto,
                      fontStyle: FontStyle.normal,
                      fontSize: MySize.size15),
                  textAlign: TextAlign.left),
            ),
          ),
        ),
      ),
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
                    // TimeAgo.timeAgoSinceDate(
                    //     controller
                    //         .allPostList[i]
                    //         .createdAt
                    //         .toString()),
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

  Widget columnPost({int? number, String? name}) {
    return InkWell(
      onTap: () {
        if (controller.isLogInUser) {
          if (name == "Followers") {
            Get.toNamed(Routes.FOLLOWER_SCREEN);
          }
          if (name == "Following") {
            Get.toNamed(Routes.FOLLOWING_SCREEN);
          }
          if (name == "Post") {
            Get.toNamed(Routes.FOLLOW_REQUEST_SCREEN);
          }
        }
      },
      child: Container(
        height: MySize.size38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${number}",
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.roboto,
                    fontStyle: FontStyle.normal,
                    fontSize: MySize.getScaledSizeHeight(15)),
                textAlign: TextAlign.center),
            SizedBox(
              height: MySize.size2,
            ),
            Text("${name}",
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.roboto,
                    fontStyle: FontStyle.normal,
                    fontSize: MySize.getScaledSizeWidth(Dimens.d_12)),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }

  Widget streakWidget({int? number, String? name, String? img}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          radius: MySize.size30,
          child: SvgPicture.asset(img!),
        ),
        SizedBox(
          height: MySize.size9,
        ),
        Text(name!,
            style: TextStyle(
                color: AppColors.textBlackColor,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.roboto,
                fontStyle: FontStyle.normal,
                fontSize: MySize.size10),
            textAlign: TextAlign.center),
        SizedBox(
          height: MySize.size9,
        ),
        Text("${number.toString()}",
            style: TextStyle(
                color: AppColors.textGrayBlackColor,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.roboto,
                fontStyle: FontStyle.normal,
                fontSize: MySize.size12),
            textAlign: TextAlign.center)
      ],
    );
  }
}
