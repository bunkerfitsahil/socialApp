import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/constants/assets.dart';
import 'package:social_feed_flutter/constants/math_utils.dart';

import '../controllers/follow_request_screen_controller.dart';

class FollowRequestScreenView extends GetWidget<FollowRequestScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: getSize(70, context),
                color: const Color(0xff3ba27f),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Positioned(
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
                                  borderRadius: BorderRadius.circular(50)),
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
                    Positioned(
                      child: Container(
                        height: getSize(32, context),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Text("Follower Requests  ",
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontSize: getSize(18, context)),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color(0xffe6e6e6),
                  padding: EdgeInsets.only(top: getSize(20, context)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getSize(20, context)),
                    child: ListView.separated(
                      itemCount: 15,
                      itemBuilder: (context, i) {
                        return Container(
                          height: getSize(110, context),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(getSize(10, context))),
                          padding: EdgeInsets.all(getSize(10, context)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: getSize(30, context),
                                        backgroundImage:
                                            AssetImage(Assets.avtar),
                                      ),
                                      SizedBox(
                                        width: getSize(10, context),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Sahil Soni",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff1c1414),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Roboto",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize:
                                                      getSize(14, context)),
                                              textAlign: TextAlign.left),
                                          SizedBox(
                                            height: getSize(8, context),
                                          ),
                                          Text("New Delhi,  Sales & Marketing",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff6d6d6e),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Roboto",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize:
                                                      getSize(12, context)),
                                              textAlign: TextAlign.left),
                                          SizedBox(
                                            height: getSize(15, context),
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: getSize(80, context),
                                                    height:
                                                        getSize(30, context),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  3)),
                                                      color: const Color(
                                                          0xffffe6e7),
                                                    ),
                                                    child: Center(
                                                      child: Text("Decline",
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xfffa1313),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  "Roboto",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: getSize(
                                                                  14, context)),
                                                          textAlign:
                                                              TextAlign.center),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: getSize(25, context),
                                                  ),
                                                  Container(
                                                    width: getSize(80, context),
                                                    height:
                                                        getSize(30, context),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  3)),
                                                      color: const Color(
                                                          0xffdbf0e9),
                                                    ),
                                                    child: Center(
                                                      child: Text("Accept",
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xff3ba27f),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  "Roboto",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: getSize(
                                                                  14, context)),
                                                          textAlign:
                                                              TextAlign.center),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                          )
                                        ],
                                      ),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("03 : 30 am",
                                          style: TextStyle(
                                              color: const Color(0xff1c1414),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Roboto",
                                              fontStyle: FontStyle.normal,
                                              fontSize: getSize(10, context)),
                                          textAlign: TextAlign.left),
                                      SizedBox(
                                        height: getSize(8, context),
                                      ),
                                      Text("12 Dec 22",
                                          style: TextStyle(
                                              color: const Color(0xff1c1414),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Roboto",
                                              fontStyle: FontStyle.normal,
                                              fontSize: getSize(10, context)),
                                          textAlign: TextAlign.left),
                                      SizedBox(
                                        height: getSize(30, context),
                                      ),
                                      Icon(
                                        Icons.delete,
                                        size: getSize(20, context),
                                      ),
                                    ],
                                  )
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return SizedBox(
                          height: getSize(15, context),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
