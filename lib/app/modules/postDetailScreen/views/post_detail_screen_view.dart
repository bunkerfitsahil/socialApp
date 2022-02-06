import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/argumentConstant.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/font_family.dart';
import 'package:social_feed_flutter/constants/math_utils.dart';
import 'package:social_feed_flutter/constants/sizeConstant.dart';
import 'package:social_feed_flutter/utils/pref_utils.dart';
import 'package:social_feed_flutter/utils/progress_dialog_utils.dart';
import 'package:video_player/video_player.dart';

import '../controllers/post_detail_screen_controller.dart';

class PostDetailScreenView extends GetWidget<PostDetailScreenController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Obx(() {
        return Stack(
          children: [
            Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MySize.getScaledSizeHeight(206.3),
                        width: double.infinity,
                        child: Stack(
                          children: [
                            getImageView(),
                            getBackButton(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MySize.size23,
                      ),
                      getLikeCommentrow(),
                      SizedBox(
                        height: MySize.size54,
                      ),
                      Divider(
                        color: AppColors.textGrayBlackColor,
                        thickness: 2,
                        indent: getSize(18, context),
                        endIndent: getSize(18, context),
                      ),
                      SizedBox(
                        height: MySize.size35,
                      ),
                      (controller.hasPostData.value)
                          ? (!controller.postComments.isNotEmpty)
                              ? Container(
                                  width: double.infinity,
                                  height: MySize.size14,
                                  child: Center(
                                    child: Text("No Comments",
                                        style: TextStyle(
                                            color: AppColors.textBlackColor,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: FontFamily.roboto,
                                            fontStyle: FontStyle.normal,
                                            fontSize: MySize.size14),
                                        textAlign: TextAlign.center),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MySize.getScaledSizeWidth(22)),
                                  child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, i) {
                                      return Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  radius: MySize.size17,
                                                  // backgroundImage:
                                                  //     AssetImage(Assets.avtar),
                                                  child: CachedNetworkImage(
                                                    imageUrl: controller
                                                        .postComments[i]
                                                        .userData!
                                                        .profilePicture
                                                        .toString(),
                                                    placeholder:
                                                        (context, url) =>
                                                            SpinKitCircle(
                                                      color: Colors.green,
                                                      size: MySize.size20!,
                                                    ),
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      height: MySize.size34,
                                                      width: MySize.size34,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      MySize.getScaledSizeWidth(
                                                          11),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: MySize.size49,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            controller
                                                                .postComments[i]
                                                                .userData!
                                                                .name
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .textBlackColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .robotoBold,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: MySize
                                                                    .size14),
                                                            textAlign:
                                                                TextAlign.left),
                                                        SizedBox(
                                                          height: MySize.size3,
                                                        ),
                                                        Text(
                                                            (PrefUtils.isNullEmptyOrFalse(controller
                                                                    .postComments[
                                                                        i]
                                                                    .commentBody))
                                                                ? ""
                                                                : controller
                                                                    .postComments[
                                                                        i]
                                                                    .commentBody
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .textGrayBlackColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .roboto,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: MySize
                                                                    .size14),
                                                            textAlign:
                                                                TextAlign.left)
                                                      ],
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .profileFollowText,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              MySize.size8!),
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        left: MySize
                                                            .getScaledSizeWidth(
                                                                7),
                                                        top: MySize.size6!,
                                                        bottom: MySize.size6!),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left:
                                                      MySize.getScaledSizeWidth(
                                                          49),
                                                  top: MySize.size10!),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    //width: MySize.getScaledSizeWidth(30),
                                                    child: LikeButton(
                                                      circleColor: CircleColor(
                                                          start:
                                                              Color(0xff00ddff),
                                                          end: Color(
                                                              0xff0099cc)),
                                                      bubblesColor:
                                                          BubblesColor(
                                                        dotPrimaryColor:
                                                            Color(0xff33b5e5),
                                                        dotSecondaryColor:
                                                            Color(0xff0099cc),
                                                      ),
                                                      likeBuilder:
                                                          (bool isLiked) {
                                                        return SvgPicture.asset(
                                                          Assets.trophy,
                                                          color: isLiked
                                                              ? AppColors
                                                                  .button_green
                                                              : AppColors.grey,
                                                          width: MySize
                                                              .getScaledSizeWidth(
                                                                  17),
                                                          height: MySize.size17,
                                                        );
                                                      },
                                                      onTap: (isLiked) async {
                                                        if (controller
                                                                .postComments[i]
                                                                .isLiked ==
                                                            true) {
                                                          controller
                                                              .isLikeSuccessForComment
                                                              .value = false;
                                                          await controller
                                                              .CreateCommentDelete(
                                                            id: controller
                                                                .postComments[i]
                                                                .commentLikeId,
                                                            successCall: () {
                                                              controller
                                                                  .postComments[
                                                                      i]
                                                                  .isLiked = false;

                                                              controller
                                                                  .postComments[
                                                                      i]
                                                                  .numberOfLikes = controller
                                                                      .postComments[
                                                                          i]
                                                                      .numberOfLikes! -
                                                                  1;
                                                            },
                                                          );
                                                        } else {
                                                          controller
                                                              .isLikeSuccessForComment
                                                              .value = false;
                                                          await controller
                                                              .createCommentLike(
                                                            id: controller
                                                                .postComments[i]
                                                                .id,
                                                            commentData: controller
                                                                .postComments[i],
                                                            successCall: () {
                                                              controller
                                                                  .postComments[
                                                                      i]
                                                                  .isLiked = true;

                                                              controller
                                                                  .postComments[
                                                                      i]
                                                                  .numberOfLikes = controller
                                                                      .postComments[
                                                                          i]
                                                                      .numberOfLikes! +
                                                                  1;
                                                            },
                                                          );
                                                        }

                                                        return (controller
                                                                .isLikeSuccessForComment
                                                                .value)
                                                            ? !isLiked
                                                            : isLiked;
                                                      },
                                                      likeCount: controller
                                                          .postComments[i]
                                                          .numberOfLikes,
                                                      countPostion:
                                                          CountPostion.left,
                                                      isLiked: controller
                                                          .postComments[i]
                                                          .isLiked,
                                                      countBuilder: (int? count,
                                                          bool isLiked,
                                                          String text) {
                                                        var color = isLiked
                                                            ? Colors
                                                                .deepPurpleAccent
                                                            : Colors.grey;
                                                        Widget result;
                                                        if (count == 0) {
                                                          result = Text(
                                                            "0",
                                                            style: TextStyle(
                                                                color: color),
                                                          );
                                                        } else
                                                          result = Text(
                                                            text,
                                                            style: TextStyle(
                                                                color: color),
                                                          );
                                                        return result;
                                                      },
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          Routes
                                                              .POST_COMMENT_REPLY_SCREEN,
                                                          arguments: {
                                                            Argument.commentData:
                                                                controller
                                                                    .postComments[
                                                                        i]
                                                                    .obs,
                                                          });
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Text("Reply",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .textGrayBlackColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .roboto,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: MySize
                                                                    .size12),
                                                            textAlign: TextAlign
                                                                .right),
                                                        SizedBox(
                                                          width: MySize.size7,
                                                        ),
                                                        Container(
                                                            width: MySize.size3,
                                                            height:
                                                                MySize.size3,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .textBlackColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100))),
                                                        SizedBox(
                                                          width: MySize
                                                              .getScaledSizeWidth(
                                                                  16),
                                                        ),
                                                        Text(
                                                            controller
                                                                .postComments[i]
                                                                .numberOfReplies
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .textBlackColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .roboto,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: MySize
                                                                    .size14),
                                                            textAlign:
                                                                TextAlign.right)
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: controller.postComments.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: MySize.size20,
                                      );
                                    },
                                  ),
                                )
                          : SpinKitCircle(
                              color: Colors.green,
                              size: MySize.size30!,
                            ),
                      SizedBox(
                        height: getSize(90, context),
                      ),
                    ],
                  ),
                ),
              ),
              bottomSheet: SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MySize.getScaledSizeWidth(29.5)),
                  margin:
                      EdgeInsets.only(bottom: MySize.getScaledSizeHeight(20)),
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
                              fillColor: Color(0xffF0F0F0),
                              //filled: true,
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                borderSide: BorderSide(
                                    color: AppColors.textGray, width: 1),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                borderSide: BorderSide(
                                    color: AppColors.textGray, width: 1),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                borderSide: BorderSide(
                                    color: AppColors.textGray, width: 1),
                              ),
                              disabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                borderSide: BorderSide(
                                    color: AppColors.textGray, width: 1),
                              ),
                              hintText: "",
                              suffixIcon: InkWell(
                                onTap: () {
                                  controller.commentController.value.text = "";
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
                        InkWell(
                          onTap: () {
                            if (controller.commentController.value.text
                                        .trim() ==
                                    "" ||
                                controller.commentController.value.text
                                        .trim() ==
                                    " ") {
                              Fluttertoast.showToast(
                                  msg: "Please Enter Comment First");
                            } else {
                              controller.addCommentsData();
                              FocusManager.instance.primaryFocus!.unfocus();
                              controller.commentController.value.text = "";
                              controller.postData.numberOfComments =
                                  controller.postData.numberOfComments! + 1;
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
              ),
            ),
          ],
        );
      }),
    );
  }

  Container getImageView() {
    return Container(
      width: double.infinity,
      height: MySize.getScaledSizeHeight(206.3),
      child: (controller.postData.fileType == "Video")
          ? VideoPlayerItem(
              url: controller.postData.attachment.toString(),
              videoPlayerController: VideoPlayerController.network(
                  controller.postData.attachment.toString()),
            )
          : CachedNetworkImage(
              imageUrl: controller.postData.attachment.toString(),
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
                size: getSize(30, context),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
    );
  }

  Positioned getBackButton() {
    return Positioned(
      top: MySize.size20,
      left: MySize.size20,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: MySize.size28,
              height: MySize.size28,
              decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  size: MySize.size22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding getLikeCommentrow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(22)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //width: MySize.getScaledSizeWidth(30),
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
                if (controller.postData.isLiked == true) {
                  controller.isLikeSuccess.value = false;
                  await controller.deletePostLike(
                    id: controller.postData.postLikeid,
                    successCall: () {
                      controller.postData.isLiked = false;

                      controller.postData.numberOfLikes =
                          controller.postData.numberOfLikes! - 1;
                    },
                  );
                } else {
                  controller.isLikeSuccess.value = false;
                  await controller.createPostLike(
                    id: controller.postData.id,
                    successCall: () {
                      controller.postData.isLiked = true;

                      controller.postData.numberOfLikes =
                          controller.postData.numberOfLikes! + 1;
                    },
                  );
                }

                return (controller.isLikeSuccess.value) ? !isLiked : isLiked;
              },
              likeCount: controller.postData.numberOfLikes,
              countPostion: CountPostion.left,
              isLiked: controller.postData.isLiked,
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
          ),
          InkWell(
            onTap: () {
              // Get.toNamed(Routes.POST_DETAIL_SCREEN);
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.comment,
                  color: Colors.grey,
                  width: MySize.getScaledSizeWidth(14),
                  height: MySize.size14,
                ),
                SizedBox(
                  width: MySize.getScaledSizeWidth(9),
                ),
                Text("${controller.postData.numberOfComments} comments",
                    style: TextStyle(
                        color: AppColors.textGrayBlackColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.roboto,
                        fontStyle: FontStyle.normal,
                        fontSize: MySize.size14),
                    textAlign: TextAlign.right)
              ],
            ),
          ),
          InkWell(
            onTap: () {
              var text = (controller.postData.postBody != null)
                  ? controller.postData.postBody
                  : null;
              var msg = (text != null)
                  ? "${controller.postData.attachment!} \n $text"
                  : controller.postData.attachment!;
              Share.share(msg);
            },
            child: SvgPicture.asset(
              Assets.share,
              color: AppColors.textGrayBlackColor.withOpacity(0.7),
              width: MySize.getScaledSizeWidth(14),
              height: MySize.size14,
            ),
          ),
        ],
      ),
    );
  }
}
