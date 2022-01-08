import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_indicator.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/activity/activity_model.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:flutter_drive/feed/ui/page/setting_drawer_page.dart';
import 'package:flutter_drive/feed/ui/user/feed_user_appbar_widget.dart';
import 'package:flutter_drive/feed/ui/user/feed_user_grid_widget.dart';
import 'package:flutter_drive/feed/ui/user/feed_user_info_widget.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/page/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class FeedUserProfilePage extends StatelessWidget {
  final List<CourseModel> allCourseModel;

  final String userKey;
  final bool isProfileUpdate;
  const FeedUserProfilePage({
    Key? key,
    required this.allCourseModel,
    required this.userKey,
    required this.isProfileUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel? _user = context
        .watch<AuthProvider>()
        .allUserProfile
        .where((u) => userKey.contains(u.userKey))
        .firstOrNull;
    final ActivityModel? _activity = context
        .watch<AuthProvider>()
        .allUserActivity
        .where((a) => userKey.contains(a.userKey))
        .firstOrNull;
    if (context.watch<AuthProvider>().isUserLoading ||
        context.watch<AuthProvider>().user == null ||
        _user == null ||
        _activity == null) {
      return const AppIndicator();
    }

    return DefaultTabController(
      length: 3,
      child: Stack(
        children: [
          AnimatedContainer(
            curve: Curves.ease,
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.translationValues(
                context.watch<FeedUserProvider>().isShowDrawer
                    ? -size.width * 0.5
                    : 0,
                0,
                0),
            child: Scaffold(
              appBar: feedUserAppbarWidget(
                isLikeUser: context
                    .read<AuthProvider>()
                    .allUserActivity
                    .where((u) => context
                        .read<AuthProvider>()
                        .user!
                        .userKey
                        .contains(u.userKey))
                    .map((a) => a.likesUserKey.contains(_user.userKey))
                    .firstOrNull!,
                likeMeUserKey: _user.userKey,
                context: context,
                isProfileUpdate: isProfileUpdate,
                isMe: _user.userKey
                    .contains(context.watch<AuthProvider>().user!.userKey),
              ),
              body: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    feedUserInfoWidget(
                      userKey: _user.userKey,
                      isLockBookmarks: _user.privacyBookmarks,
                      isLockLikes: _user.privacyLikes,
                      context: context,
                      profileOnTap: () {
                        context.read<ProfileProvider>().started(
                              isSocialImage: _user.isSocialImage,
                            );
                        pushNewScreen(context, screen: const ProfilePage());
                      },
                      isProfileUpdate: isProfileUpdate,
                      userNickName: _user.nickName,
                      userImage: _user.isSocialImage
                          ? _user.socialProfileUrl
                          : _user.localProfileUrl,
                      likesUserLength: _activity.likesUserKey.length.toString(),
                      contentLength: allCourseModel
                          .where((c) =>
                              _activity.contentsDocKey.contains(c.docKey) &&
                              !c.isBlocked)
                          .length
                          .toString(),
                      userIntroduction: _user.introduction,
                      cars: _user.cars,
                      city: _user.city,
                    )
                  ];
                },
                body: Column(
                  children: [
                    TabBar(
                      tabs: [
                        _tabBarButton(
                            title: '게시물', icon: Icons.view_quilt_rounded),
                        _tabBarButton(
                            title: '좋아요',
                            icon: _user.privacyLikes
                                ? Icons.lock
                                : CustomIcon.heartEmpty),
                        _tabBarButton(
                            title: '북마크',
                            icon: _user.privacyBookmarks
                                ? Icons.lock
                                : CustomIcon.bookmarkEmpty),
                      ],
                      indicatorColor: appMainColor,
                      indicatorSize: TabBarIndicatorSize.label,
                    ),
                    FeedUserGridWidget(
                      allCourseModel: allCourseModel
                          .where((c) =>
                              !c.isBlocked &&
                              !c.blockedUserKey.contains(
                                  context.watch<AuthProvider>().user == null
                                      ? ""
                                      : context
                                          .watch<AuthProvider>()
                                          .user!
                                          .userKey))
                          .toList(),
                      contentsDocKey: _activity.contentsDocKey,
                      likesDocKey: _activity.likesDocKey,
                      userNickName: _user.nickName,
                      bookmarksDocKey: _activity.bookmarksDocKey,
                      privacyLikes: _user.privacyLikes,
                      privacyBookmarks: _user.privacyBookmarks,
                      isMe: _user.userKey.contains(
                          context.watch<AuthProvider>().user!.userKey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SettingDrawerPage(),
        ],
      ),
    );
  }

  Tab _tabBarButton({
    required IconData icon,
    required String title,
  }) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: theme.textTheme.bodyText2!.copyWith(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
