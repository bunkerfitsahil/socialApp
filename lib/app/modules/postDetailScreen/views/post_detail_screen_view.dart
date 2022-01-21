import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/app/routes/app_pages.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/math_utils.dart';

import '../controllers/post_detail_screen_controller.dart';

class PostDetailScreenView extends GetView<PostDetailScreenController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Stack(
        children: [
          Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: getSize(320, context),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: getSize(320, context),
                            child: Image(
                              image: AssetImage(Assets.gymImage),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            top: getSize(10, context),
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getSize(20, context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(18, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "6",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getSize(16, context)),
                              ),
                              SizedBox(
                                width: getSize(10, context),
                              ),
                              SvgPicture.asset(
                                Assets.trophy,
                                color: AppColors.button_green,
                                width: getSize(16, context),
                                height: getSize(16, context),
                              ),
                            ],
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
                                  width: getSize(13, context),
                                  height: getSize(16, context),
                                ),
                                SizedBox(
                                  width: getSize(10, context),
                                ),
                                Text("20 comments",
                                    style: TextStyle(
                                      color: const Color(0xff6d6d6e),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: getSize(16, context),
                                    ),
                                    textAlign: TextAlign.right)
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            Assets.share,
                            color: Colors.black.withOpacity(0.7),
                            width: getSize(18, context),
                            height: getSize(18, context),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getSize(20, context),
                    ),
                    Divider(
                      color: const Color(0xffacacac),
                      thickness: 2,
                      indent: getSize(18, context),
                      endIndent: getSize(18, context),
                    ),
                    SizedBox(
                      height: getSize(20, context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(18, context)),
                      child: ListView.separated(
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
                                    CircleAvatar(
                                      radius: getSize(20, context),
                                      backgroundImage: AssetImage(Assets.avtar),
                                    ),
                                    SizedBox(
                                      width: getSize(10, context),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Text("Sarfaraz ",
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xff1c1414),
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "Roboto",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize:
                                                        getSize(14, context)),
                                                textAlign: TextAlign.left),
                                            SizedBox(
                                              height: getSize(7, context),
                                            ),
                                            Text("Excellent dvjhsv scvjsvhj",
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xff1c1414),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Roboto",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize:
                                                        getSize(14, context)),
                                                textAlign: TextAlign.left)
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffeef0f0),
                                          borderRadius: BorderRadius.circular(
                                              getSize(8, context)),
                                        ),
                                        padding: EdgeInsets.only(
                                            left: getSize(10, context),
                                            top: getSize(10, context),
                                            bottom: getSize(10, context)),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: getSize(50, context),
                                      top: getSize(10, context)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("6",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff6d6d6e),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Roboto",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize:
                                                      getSize(14, context)),
                                              textAlign: TextAlign.right),
                                          SizedBox(
                                            width: getSize(10, context),
                                          ),
                                          SvgPicture.asset(
                                            Assets.trophy,
                                            color: AppColors.button_green,
                                            width: getSize(13, context),
                                            height: getSize(16, context),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                              Routes.POST_COMMENT_REPLY_SCREEN);
                                        },
                                        child: Row(
                                          children: [
                                            Text("Reply",
                                                style: const TextStyle(
                                                    color:
                                                        const Color(0xff6d6d6e),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Roboto",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12.0),
                                                textAlign: TextAlign.right),
                                            SizedBox(
                                              width: getSize(10, context),
                                            ),
                                            Container(
                                                width: 3,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                    color: const Color(
                                                        0xff1c1414))),
                                            SizedBox(
                                              width: getSize(10, context),
                                            ),
                                            Text("1",
                                                style: const TextStyle(
                                                    color:
                                                        const Color(0xff1c1414),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Roboto",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.0),
                                                textAlign: TextAlign.right)
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
                        itemCount: 100,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: getSize(20, context),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomSheet: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: getSize(15, context)),
                width: double.infinity,
                height: getSize(70, context),
                child: Form(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          // controller: _controller,
                          decoration: InputDecoration(
                            isDense: true,
                            fillColor: Color(0xffF0F0F0),
                            //filled: true,
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                  color: Color(0xffacacac), width: 1),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                  color: Color(0xffacacac), width: 1),
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                  color: Color(0xffacacac), width: 1),
                            ),
                            hintText: "",
                            suffixIcon: Icon(
                              Icons.close,
                              color: Colors.black,
                              size: getSize(24, context),
                            ),
                            hintStyle: TextStyle(
                                color: Color(0xffacacac),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontSize: getSize(16, context)),
                          ),
                          cursorColor: Colors.black12.withOpacity(0.6),
                        ),
                      ),
                      Container(
                        child: SvgPicture.asset(
                          Assets.sendIcon,
                          height: getSize(40, context),
                          width: getSize(40, context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
