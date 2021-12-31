import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_indicator.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/provider/feed_main_provider.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:flutter_drive/feed/ui/user/feed_user_info_widget.dart';
import 'package:provider/provider.dart';

class FeedUserPage extends StatelessWidget {
  final List<CourseModel> allCourseModel;
  const FeedUserPage({
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
              // title: Text(
              //   provider.userProfile == null
              //       ? ""
              //       : provider.userProfile!.nickName,
              //   style: theme.textTheme.bodyText2!
              //       .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
              // ),
              leading: IconButton(
                onPressed: () {
                  _feedStateIniaialization(context: context);
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
                        child: ListView(
                          children: [
                            ...provider.courseList.map((e) => Text(e.docKey)),
                          ],
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
        // return WillPopScope(
        //   onWillPop: () => _feedStateIniaialization(context: context),
        //   child: Scaffold(
        //     appBar: AppBar(
        //       leading: IconButton(
        //         onPressed: () {
        //           _feedStateIniaialization(context: context);
        //           Navigator.of(context).pop();
        //         },
        //         icon: const Icon(Icons.arrow_back_rounded),
        //       ),
        //       title: Text(
        //         provider.userProfile == null
        //             ? ""
        //             : provider.userProfile!.nickName,
        //         style: theme.textTheme.bodyText2!
        //             .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     body: Column(
        //       children: [
        //         profileCircleImageWidget(
        //             imageUrl: provider.userProfile!.isSocialImage
        //                 ? provider.userProfile!.socialProfileUrl
        //                 : provider.userProfile!.localProfileUrl)
        //       ],
        //     ),
        //     // body: ContentMainCard(
        //     //   courseList: provider.courseList,
        //     //   imageOrCouseSpotIndex: provider.imageOrCouseSpotIndex,
        //     //   isImageOrCouseSpot: provider.isImageOrCouseSpot,
        //     //   explanationIndex: provider.explanationIndex,
        //     // ),
        //   ),
        // );
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

  Future<bool> _feedStateIniaialization({
    required BuildContext context,
  }) async {
    context.read<FeedUserProvider>().initialization();
    context.read<FeedMainProvider>().initialization();
    return true;
  }
}
