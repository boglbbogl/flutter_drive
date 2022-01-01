import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_indicator.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/provider/feed_main_provider.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:flutter_drive/feed/ui/page/feed_user_page.dart';
import 'package:flutter_drive/feed/ui/user/feed_user_info_widget.dart';
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
                      _tabBarButton(title: '좋아요', icon: CustomIcon.heartEmpty),
                      _tabBarButton(
                          title: '북마크', icon: CustomIcon.bookmarkEmpty),
                    ],
                    indicatorColor: appMainColor,
                    indicatorSize: TabBarIndicatorSize.label,
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      Tab(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 12, right: 12),
                          child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            children: [
                              ...provider.courseList.map((feed) => InkWell(
                                    onTap: () {
                                      context
                                          .read<FeedUserProvider>()
                                          .initialization();
                                      context
                                          .read<FeedMainProvider>()
                                          .initialization();

                                      pushNewScreen(context,
                                          screen: const FeedUserPage(),
                                          pageTransitionAnimation:
                                              PageTransitionAnimation
                                                  .cupertino);
                                    },
                                    child: Container(
                                      child: feed.imageUrl.isEmpty
                                          ? Container(
                                              color: Colors.amber,
                                            )
                                          : Stack(
                                              fit: StackFit.expand,
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl: feed
                                                      .imageUrl.firstOrNull!,
                                                ),
                                                if (feed.imageUrl.length >
                                                    1) ...[
                                                  Positioned(
                                                      bottom: 5,
                                                      right: 5,
                                                      child: Wrap(
                                                        spacing: -8,
                                                        children: [
                                                          Container(
                                                            width: 15,
                                                            height: 20,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
                                                                color:
                                                                    appSubColor),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 5),
                                                              child: Container(
                                                                width: 15,
                                                                height: 20,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                          width:
                                                                              3,
                                                                          color:
                                                                              appSubColor),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2),
                                                                ),
                                                              )),
                                                        ],
                                                      ))
                                                ],
                                              ],
                                            ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Tab(
                          child: ListView(
                        children: [
                          ...allCourseModel
                              .where((element) => provider
                                  .userActivity!.likesDocKey
                                  .contains(element.docKey))
                              .map((e) => Text(e.docKey))
                        ],
                      )),
                      Tab(
                          child: ListView(
                        children: [
                          ...allCourseModel
                              .where((element) => provider
                                  .userActivity!.bookmarksDocKey
                                  .contains(element.docKey))
                              .map((e) => Text(e.docKey))
                        ],
                      )),
                    ]),
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
