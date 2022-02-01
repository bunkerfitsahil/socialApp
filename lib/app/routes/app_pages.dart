import 'package:get/get.dart';

import 'package:social_feed_flutter/app/modules/NoTeamExistAlertScreen/bindings/no_team_exist_alert_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/NoTeamExistAlertScreen/views/no_team_exist_alert_screen_view.dart';
import 'package:social_feed_flutter/app/modules/SingleTeamDetailScreen/bindings/single_team_detail_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/SingleTeamDetailScreen/views/single_team_detail_screen_view.dart';
import 'package:social_feed_flutter/app/modules/badgesScreen/bindings/badges_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/badgesScreen/views/badges_screen_view.dart';
import 'package:social_feed_flutter/app/modules/createTeamScreen/bindings/create_team_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/createTeamScreen/views/create_team_screen_view.dart';
import 'package:social_feed_flutter/app/modules/followRequestScreen/bindings/follow_request_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/followRequestScreen/views/follow_request_screen_view.dart';
import 'package:social_feed_flutter/app/modules/followerScreen/bindings/follower_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/followerScreen/views/follower_screen_view.dart';
import 'package:social_feed_flutter/app/modules/followingScreen/bindings/following_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/followingScreen/views/following_screen_view.dart';
import 'package:social_feed_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:social_feed_flutter/app/modules/home/views/home_view.dart';
import 'package:social_feed_flutter/app/modules/individual_chalange_screen/bindings/individual_chalange_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/individual_chalange_screen/views/individual_chalange_screen_view.dart';
import 'package:social_feed_flutter/app/modules/joinTeamScreen/bindings/join_team_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/joinTeamScreen/views/join_team_screen_view.dart';
import 'package:social_feed_flutter/app/modules/leader_board_screen/bindings/leader_board_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/leader_board_screen/views/leader_board_screen_view.dart';
import 'package:social_feed_flutter/app/modules/my_upcoming_individual_screen/bindings/my_upcoming_individual_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/my_upcoming_individual_screen/views/my_upcoming_individual_screen_view.dart';
import 'package:social_feed_flutter/app/modules/participationScreen/bindings/participation_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/participationScreen/views/participation_screen_view.dart';
import 'package:social_feed_flutter/app/modules/postCommentReplyScreen/bindings/post_comment_reply_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/postCommentReplyScreen/views/post_comment_reply_screen_view.dart';
import 'package:social_feed_flutter/app/modules/postDetailScreen/bindings/post_detail_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/postDetailScreen/views/post_detail_screen_view.dart';
import 'package:social_feed_flutter/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/splashScreen/views/splash_screen_view.dart';
import 'package:social_feed_flutter/app/modules/teamChalangeDetailScreen/bindings/team_chalange_detail_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/teamChalangeDetailScreen/views/team_chalange_detail_screen_view.dart';
import 'package:social_feed_flutter/app/modules/teamInviteScreen/bindings/team_invite_screen_binding.dart';
import 'package:social_feed_flutter/app/modules/teamInviteScreen/views/team_invite_screen_view.dart';
import 'package:social_feed_flutter/app/modules/temp/bindings/temp_binding.dart';
import 'package:social_feed_flutter/app/modules/temp/views/temp_view.dart';
import 'package:social_feed_flutter/app/modules/userProfile/bindings/user_profile_binding.dart';
import 'package:social_feed_flutter/app/modules/userProfile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TEMP;

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
    GetPage(
      name: _Paths.TEAM_CHALANGE_DETAIL_SCREEN,
      page: () => TeamChalangeDetailScreenView(),
      binding: TeamChalangeDetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_TEAM_SCREEN,
      page: () => CreateTeamScreenView(),
      binding: CreateTeamScreenBinding(),
    ),
    GetPage(
      name: _Paths.JOIN_TEAM_SCREEN,
      page: () => JoinTeamScreenView(),
      binding: JoinTeamScreenBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_TEAM_DETAIL_SCREEN,
      page: () => SingleTeamDetailScreenView(),
      binding: SingleTeamDetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.NO_TEAM_EXIST_ALERT_SCREEN,
      page: () => NoTeamExistAlertScreenView(),
      binding: NoTeamExistAlertScreenBinding(),
    ),
    GetPage(
      name: _Paths.TEAM_INVITE_SCREEN,
      page: () => TeamInviteScreenView(),
      binding: TeamInviteScreenBinding(),
    ),
    GetPage(
      name: _Paths.LEADER_BOARD_SCREEN,
      page: () => LeaderBoardScreenView(),
      binding: LeaderBoardScreenBinding(),
    ),
    GetPage(
      name: _Paths.TEMP,
      page: () => TempView(),
      binding: TempBinding(),
    ),
    GetPage(
      name: _Paths.INDIVIDUAL_CHALANGE_SCREEN,
      page: () => IndividualChalangeScreenView(),
      binding: IndividualChalangeScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_UPCOMING_INDIVIDUAL_SCREEN,
      page: () => MyUpcomingIndividualScreenView(),
      binding: MyUpcomingIndividualScreenBinding(),
    ),
    GetPage(
      name: _Paths.PARTICIPATION_SCREEN,
      page: () => ParticipationScreenView(),
      binding: ParticipationScreenBinding(),
    ),
  ];
}
