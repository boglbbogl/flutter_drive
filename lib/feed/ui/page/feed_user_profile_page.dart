import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_indicator.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:flutter_drive/feed/ui/user/feed_user_grid_widget.dart';
import 'package:flutter_drive/feed/ui/user/feed_user_info_widget.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class FeedUserProfilePage extends StatelessWidget {
  final List<CourseModel> allCourseModel;
  const FeedUserProfilePage({
    Key? key,
    required this.allCourseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedUserProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const AppIndicator();
        }
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_rounded),
              ),
              automaticallyImplyLeading: false,
            ),
            body: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  feedUserInfoWidget(
                    profileOnTap: () {
                      context.read<ProfileProvider>().started(
                            isSocialImage: context
                                .read<AuthProvider>()
                                .user!
                                .isSocialImage,
                            isPrivacyBookmarks: context
                                .read<AuthProvider>()
                                .user!
                                .privacyBookmarks,
                            isPrivacyLikes:
                                context.read<AuthProvider>().user!.privacyLikes,
                          );
                      pushNewScreen(context, screen: ProfilePage());
                    },
                    isMe: provider.userProfile!.userKey
                        .contains(context.watch<AuthProvider>().user!.userKey),
                    userNickName: provider.userProfile == null
                        ? ""
                        : provider.userProfile!.nickName,
                    userImage: provider.userProfile!.isSocialImage
                        ? provider.userProfile!.socialProfileUrl
                        : provider.userProfile!.localProfileUrl,
                    contentLength:
                        provider.userActivity!.contentsDocKey.length.toString(),
                    userIntroduction: provider.userProfile!.introduction,
                    cars: provider.userProfile!.cars,
                  )
                ];
              },
              body: Column(
                children: [
                  TabBar(
                    tabs: [
                      _tabBarButton(
                          title: '게시물', icon: Icons.grid_4x4_outlined),
                      _tabBarButton(
                          title: '좋아요',
                          icon: provider.userProfile!.privacyLikes
                              ? Icons.lock
                              : CustomIcon.heartEmpty),
                      _tabBarButton(
                          title: '북마크',
                          icon: provider.userProfile!.privacyBookmarks
                              ? Icons.lock
                              : CustomIcon.bookmarkEmpty),
                    ],
                    indicatorColor: appMainColor,
                    indicatorSize: TabBarIndicatorSize.label,
                  ),
                  FeedUserGridWidget(
                    contentFeedCourse: provider.courseList,
                    allCourseModel: allCourseModel,
                    likesDocKey: provider.userActivity!.likesDocKey,
                    bookmarksDocKey: provider.userActivity!.bookmarksDocKey,
                    privacyLikes: provider.userProfile!.privacyLikes,
                    privacyBookmarks: provider.userProfile!.privacyBookmarks,
                    isMe: provider.userProfile!.userKey
                        .contains(context.watch<AuthProvider>().user!.userKey),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
