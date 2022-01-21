import 'package:get/get.dart';

import 'package:social_feed_flutter/app/modules/badgesScreen/bindings/badges_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/badgesScreen/views/badges_screen_view.dart';
import 'package:social_feed_flutter/app/modules/followRequestScreen/bindings/follow_request_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/followRequestScreen/views/follow_request_screen_view.dart';
import 'package:social_feed_flutter/app/modules/followerScreen/bindings/follower_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/followerScreen/views/follower_screen_view.dart';
import 'package:social_feed_flutter/app/modules/followingScreen/bindings/following_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/followingScreen/views/following_screen_view.dart';
import 'package:social_feed_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:social_feed_flutter/app/modules/home/views/home_view.dart';
import 'package:social_feed_flutter/app/modules/postCommentReplyScreen/bindings/post_comment_reply_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/postCommentReplyScreen/views/post_comment_reply_screen_view.dart';
import 'package:social_feed_flutter/app/modules/postDetailScreen/bindings/post_detail_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/postDetailScreen/views/post_detail_screen_view.dart';
import 'package:social_feed_flutter/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/splashScreen/views/splash_screen_view.dart';
import 'package:social_feed_flutter/app/modules/userProfile/bindings/user_profile_binding.dart';
import 'package:social_feed_flutter/app/modules/userProfile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.BADGES_SCREEN,
      page: () => BadgesScreenView(),
      binding: BadgesScreenBinding(),
    ),
    GetPage(
      name: _Paths.FOLLOWER_SCREEN,
      page: () => FollowerScreenView(),
      binding: FollowerScreenBinding(),
    ),
    GetPage(
      name: _Paths.FOLLOWING_SCREEN,
      page: () => FollowingScreenView(),
      binding: FollowingScreenBinding(),
    ),
    GetPage(
      name: _Paths.FOLLOW_REQUEST_SCREEN,
      page: () => FollowRequestScreenView(),
      binding: FollowRequestScreenBinding(),
    ),
    GetPage(
      name: _Paths.POST_DETAIL_SCREEN,
      page: () => PostDetailScreenView(),
      binding: PostDetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.POST_COMMENT_REPLY_SCREEN,
      page: () => PostCommentReplyScreenView(),
      binding: PostCommentReplyScreenBinding(),
    ),
  ];
}
