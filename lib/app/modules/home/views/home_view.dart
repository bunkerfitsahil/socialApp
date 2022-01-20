import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:social_feed_flutter/constants/math_utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getSize(10, context),
              ),
              Container(
                //height: getSize(70, context),
                padding: EdgeInsets.symmetric(horizontal: getSize(18, context)),

                width: double.infinity,
                //   color: Colors.red,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: getSize(50, context),
                          width: getSize(50, context),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(Assets.avtar),
                          ),
                        ),
                        SizedBox(
                          width: getSize(15, context),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500.0),
                              color: Colors.grey.withOpacity(0.4),
                            ),
                            height: getSize(50, context),
                            child: TextField(
                              // controller: _controller,
                              decoration: InputDecoration(
                                isDense: true,
                                fillColor: Color(0xffF0F0F0),
                                filled: true,
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
                                      color: Color(0xffF0F0F0), width: 1),
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  borderSide: BorderSide(
                                      color: Color(0xffF0F0F0), width: 1),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                                hintText: "What's New, Surbhi?",
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getSize(17, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.gallery,
                              height: getSize(16, context),
                              width: getSize(20, context),
                            ),
                            SizedBox(
                              width: getSize(20, context),
                            ),
                            Text(
                              "Picture / Video",
                              style: TextStyle(
                                  fontSize: getSize(13, context),
                                  color: AppColors.nearlyBlack),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: getSize(70, context),
                        ),
                        Container(
                          height: getSize(30, context),
                          width: getSize(70, context),
                          decoration: BoxDecoration(
                              color: AppColors.button_green,
                              borderRadius:
                                  BorderRadius.circular(getSize(5, context))),
                          child: Center(
                            child: Text(
                              "Post",
                              style: TextStyle(
                                  fontSize: getSize(12, context),
                                  color: AppColors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.4),
                thickness: 2,
                indent: getSize(18, context),
                endIndent: getSize(18, context),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: getSize(20, context),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getSize(18, context)),
                          child: InkWell(
                            onTap: () {
                              controller.goToUserProfileScreen();
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: getSize(50, context),
                                  width: getSize(50, context),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(Assets.avtar),
                                  ),
                                ),
                                SizedBox(
                                  width: getSize(15, context),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Rahul Shah",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: getSize(17, context),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    SizedBox(
                                      height: getSize(5, context),
                                    ),
                                    Text(
                                      "15 Min",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getSize(12, context),
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getSize(15, context),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getSize(18, context)),
                            // child: AutoSizeText(
                            //   'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy ',
                            //   style:
                            //       TextStyle(fontSize: getFontSize(20, context)),
                            //   maxFontSize: getFontSize(20, context),
                            //   minFontSize: getFontSize(10, context),
                            //   maxLines: 2,
                            // ),
                            child: AutoSizeText(
                              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy ',
                              style: TextStyle(
                                  fontSize: getFontSize(14, context),
                                  color: const Color(0xff1c1414),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  wordSpacing: 1),
                              minFontSize: 16,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                        Container(
                          width: double.infinity,
                          height: getSize(300, context),
                          child: Image(
                            image: AssetImage(Assets.gymImage),
                            fit: BoxFit.fitWidth,
                          ),
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
                                        fontSize: getSize(14, context)),
                                  ),
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
                              Row(
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
                                  Text(
                                    "20 comments",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: getSize(14, context)),
                                  ),
                                ],
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
                          height: getSize(15, context),
                        )
                      ],
                    ),
                  );
                },
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.grey.withOpacity(0.4),
                    thickness: 2,
                    indent: getSize(18, context),
                    endIndent: getSize(18, context),
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          child: Container(
            height: getSize(60, context),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey.withOpacity(0.1),
                    child: Center(
                      child: bottomData(context,
                          name: "Explore", img: Assets.explore),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.grey.withOpacity(0.7),
                  thickness: 2,
                  width: 0,
                  endIndent: 10,
                  indent: 10,
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey.withOpacity(0.1),
                    child: Center(
                      child:
                          bottomData(context, name: "Feed", img: Assets.feed),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
          height: getSize(20, context),
          width: getSize(20, context),
        ),
        SizedBox(
          width: getSize(10, context),
        ),
        Text(
          name!,
          style: TextStyle(
              color: Colors.black, fontSize: getFontSize(20, context)),
        )
      ],
    );
  }
}
