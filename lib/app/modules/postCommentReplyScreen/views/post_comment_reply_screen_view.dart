import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';
import 'package:social_feed_flutter/utils/pref_utils.dart';

import '../controllers/post_comment_reply_screen_controller.dart';

class PostCommentReplyScreenView
    extends GetWidget<PostCommentReplyScreenController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Obx(() {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MySize.getScaledSizeWidth(15)),
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
                        child: Text(
                            "Replies to ${controller.postCommentsModel.value.userData!.name.toString()}’s comments",
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
                      getMainCommentData(),
                      SizedBox(
                        height: MySize.size8,
                      ),
                      (controller.postCommentsModel.value.replies!.isEmpty)
                          ? Container()
                          : getCommentReplySection(),
                      SizedBox(
                        height: MySize.size90,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          bottomSheet: getBottomSheet(context),
        ),
      ],
    );
  }

  getBottomSheet(context) {
    return SafeArea(
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(29.5)),
        margin: EdgeInsets.only(bottom: MySize.getScaledSizeHeight(20)),
        width: double.infinity,
        height: MySize.size36,
        child: Form(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.commentController.value,
                  decoration: InputDecoration(
                    isDense: true,
                    fillColor: AppColors.borderWhite,
                    //filled: true,
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      borderSide:
                          BorderSide(color: AppColors.textGray, width: 1),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      borderSide:
                          BorderSide(color: AppColors.textGray, width: 1),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      borderSide:
                          BorderSide(color: AppColors.textGray, width: 1),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      borderSide:
                          BorderSide(color: AppColors.textGray, width: 1),
                    ),
                    hintText: "",
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.commentController.value.text = "";
                      },
                      child: Icon(
                        Icons.close,
                        color: AppColors.blackColor,
                        size: MySize.size24,
                      ),
                    ),

                    hintStyle: TextStyle(
                        color: AppColors.textGray,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.roboto,
                        fontStyle: FontStyle.normal,
                        fontSize: MySize.size16),
                  ),
                  cursorColor: Colors.black12.withOpacity(0.6),
                ),
              ),
              InkWell(
                onTap: () {
                  if (controller.commentController.value.text.trim() == "" ||
                      controller.commentController.value.text.trim() == " ") {
                    Fluttertoast.showToast(msg: "Please Enter Comment First");
                  } else {
                    controller.addCommentsData();
                    FocusManager.instance.primaryFocus!.unfocus();
                    controller.commentController.value.text = "";
                  }
                },
                child: Container(
                  child: SvgPicture.asset(
                    Assets.sendIcon,
                    height: MySize.getScaledSizeHeight(30.5),
                    width: MySize.getScaledSizeWidth(30.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getMainCommentData() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: MySize.size17,
                // backgroundImage:
                //     AssetImage(Assets.avtar),
                child: CachedNetworkImage(
                  imageUrl: controller
                      .postCommentsModel.value.userData!.userProfileId
                      .toString(),
                  placeholder: (context, url) => SpinKitCircle(
                    color: AppColors.greenColor,
                    size: MySize.size20!,
                  ),
                  imageBuilder: (context, imageProvider) => Container(
                    height: MySize.size17,
                    width: MySize.size17,
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
              SizedBox(
                width: MySize.getScaledSizeWidth(10),
              ),
              Expanded(
                child: Container(
                  height: MySize.size49,
                  child: Column(
                    children: [
                      Text(
                          controller.postCommentsModel.value.userData!.name
                              .toString(),
                          style: TextStyle(
                              color: AppColors.textBlackColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.robotoBold,
                              fontStyle: FontStyle.normal,
                              fontSize: MySize.size14),
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: MySize.size3,
                      ),
                      Text(
                          controller.postCommentsModel.value.commentBody
                              .toString(),
                          style: TextStyle(
                              color: AppColors.textGrayBlackColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.roboto,
                              fontStyle: FontStyle.normal,
                              fontSize: MySize.size14),
                          textAlign: TextAlign.left)
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.profileFollowText,
                    borderRadius: BorderRadius.circular(MySize.size8!),
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
                left: MySize.getScaledSizeWidth(49), top: MySize.size10!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getLikeButtonForComment(),
                Row(
                  children: [
                    Text("Reply",
                        style: TextStyle(
                            color: AppColors.textGrayBlackColor,
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
                            borderRadius: BorderRadius.circular(100))),
                    SizedBox(
                      width: MySize.getScaledSizeWidth(16),
                    ),
                    Text(
                        controller.postCommentsModel.value.numberOfReplies
                            .toString(),
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
  }

  getCommentReplySection() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.only(left: MySize.size20!),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: MySize.size17,
                    // backgroundImage:
                    //     AssetImage(Assets.avtar),
                    child: CachedNetworkImage(
                      imageUrl: controller.postCommentsModel.value.replies![i]
                          .userData!.profilePicture
                          .toString(),
                      placeholder: (context, url) => SpinKitCircle(
                        color: AppColors.greenColor,
                        size: MySize.size20!,
                      ),
                      imageBuilder: (context, imageProvider) => Container(
                        height: MySize.size34,
                        width: MySize.size34,
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
                  SizedBox(
                    width: MySize.getScaledSizeWidth(11),
                  ),
                  Expanded(
                    child: Container(
                      height: MySize.size49,
                      child: Column(
                        children: [
                          Text(
                              controller.postCommentsModel.value.replies![i]
                                  .userData!.name
                                  .toString(),
                              style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.robotoBold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: MySize.size14),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: MySize.size3,
                          ),
                          Text(
                              (PrefUtils.isNullEmptyOrFalse(controller
                                      .postCommentsModel
                                      .value
                                      .replies![i]
                                      .commentBody))
                                  ? ""
                                  : controller.postCommentsModel.value
                                      .replies![i].commentBody
                                      .toString(),
                              style: TextStyle(
                                  color: AppColors.textGrayBlackColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.roboto,
                                  fontStyle: FontStyle.normal,
                                  fontSize: MySize.size14),
                              textAlign: TextAlign.left)
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.profileFollowText,
                        borderRadius: BorderRadius.circular(MySize.size8!),
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
                    left: MySize.getScaledSizeWidth(49), top: MySize.size10!),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //width: MySize.getScaledSizeWidth(30),
                      width: MySize.getScaledSizeWidth(50),
                      height: MySize.size16,
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
                            color: isLiked
                                ? AppColors.button_green
                                : AppColors.grey,
                            width: MySize.getScaledSizeWidth(13.3),
                            height: MySize.size17,
                          );
                        },
                        onTap: (isLiked) async {
                          if (controller.postCommentsModel.value.replies![i]
                                  .isLiked ==
                              true) {
                            controller.isReplyLike.value = false;
                            await controller.ReplyLikeDelete(
                              id: controller.postCommentsModel.value.replies![i]
                                  .replyLikeId,
                              successCall: () {
                                controller.postCommentsModel.value.replies![i]
                                    .isLiked = false;

                                controller.postCommentsModel.value.replies![i]
                                    .numberOfLikes = controller
                                        .postCommentsModel
                                        .value
                                        .replies![i]
                                        .numberOfLikes! -
                                    1;
                              },
                            );
                          } else {
                            controller.isReplyLike.value = false;
                            await controller.createReplyLike(
                              id: controller
                                  .postCommentsModel.value.replies![i].id,
                              commentData: controller
                                  .postCommentsModel.value.replies![i],
                              successCall: () {
                                controller.postCommentsModel.value.replies![i]
                                    .isLiked = true;

                                controller.postCommentsModel.value.replies![i]
                                    .numberOfLikes = controller
                                        .postCommentsModel
                                        .value
                                        .replies![i]
                                        .numberOfLikes! +
                                    1;
                              },
                            );
                          }

                          return (controller.isReplyLike.value)
                              ? !isLiked
                              : isLiked;
                        },
                        likeCount: controller
                            .postCommentsModel.value.replies![i].numberOfLikes,
                        countPostion: CountPostion.left,
                        isLiked: controller
                            .postCommentsModel.value.replies![i].isLiked,
                        countBuilder: (int? count, bool isLiked, String text) {
                          var color =
                              isLiked ? AppColors.deepColor : AppColors.grey;
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
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: controller.postCommentsModel.value.replies!.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: MySize.size20,
        );
      },
    );
  }

  Container getLikeButtonForComment() {
    return Container(
      width: MySize.getScaledSizeWidth(50),
      height: MySize.size16,
      child: LikeButton(
        circleColor:
            CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
        bubblesColor: BubblesColor(
          dotPrimaryColor: Color(0xff33b5e5),
          dotSecondaryColor: Color(0xff0099cc),
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
          if (controller.postCommentsModel.value.isLiked == true) {
            controller.isLikeSuccessForComment.value = false;
            await controller.CreateCommentDelete(
              id: controller.postCommentsModel.value.commentLikeId,
              successCall: () {
                controller.postCommentsModel.value.isLiked = false;

                controller.postCommentsModel.value.numberOfLikes =
                    controller.postCommentsModel.value.numberOfLikes! - 1;
              },
            );
          } else {
            controller.isLikeSuccessForComment.value = false;
            await controller.createCommentLike(
              id: controller.postCommentsModel.value.id,
              commentData: controller.postCommentsModel.value,
              successCall: () {
                controller.postCommentsModel.value.isLiked = true;

                controller.postCommentsModel.value.numberOfLikes =
                    controller.postCommentsModel.value.numberOfLikes! + 1;
              },
            );
          }

          return (controller.isLikeSuccessForComment.value)
              ? !isLiked
              : isLiked;
        },
        likeCount: controller.postCommentsModel.value.numberOfLikes,
        countPostion: CountPostion.left,
        isLiked: controller.postCommentsModel.value.isLiked,
        countBuilder: (int? count, bool isLiked, String text) {
          var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
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
    );
  }
}
