import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/provider/feed_main_provider.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:flutter_drive/feed/ui/page/feed_user_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class FeedUserGridWidget extends StatelessWidget {
  final List<CourseModel> contentFeedCourse;
  final List<CourseModel> allCourseModel;
  final List<String> likesDocKey;
  final List<String> bookmarksDocKey;
  const FeedUserGridWidget({
    Key? key,
    required this.contentFeedCourse,
    required this.allCourseModel,
    required this.likesDocKey,
    required this.bookmarksDocKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        Tab(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              children: [
                ...contentFeedCourse.map((feed) =>
                    _contentFeedGridListItem(context: context, feed: feed))
              ],
            ),
          ),
        ),
        Tab(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              children: [
                ...allCourseModel
                    .where((course) => likesDocKey.contains(course.docKey))
                    .map((feed) =>
                        _contentFeedGridListItem(context: context, feed: feed))
              ],
            ),
          ),
        ),
        Tab(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              children: [
                ...allCourseModel
                    .where((course) => bookmarksDocKey.contains(course.docKey))
                    .map((feed) =>
                        _contentFeedGridListItem(context: context, feed: feed))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

InkWell _contentFeedGridListItem({
  required BuildContext context,
  required CourseModel feed,
}) {
  return InkWell(
    onTap: () {
      context.read<FeedMainProvider>().initialization();
      context.read<FeedUserProvider>()
        ..initialization()
        ..getFeedUserCourse(userKey: feed.userKey);
      pushNewScreen(context,
          screen: const FeedUserPage(),
          pageTransitionAnimation: PageTransitionAnimation.cupertino);
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
                  imageUrl: feed.imageUrl.firstOrNull!,
                  fit: BoxFit.cover,
                ),
                if (feed.imageUrl.length > 1) ...[
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
                                borderRadius: BorderRadius.circular(2),
                                color: const Color.fromRGBO(235, 235, 235, 1)),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                width: 15,
                                height: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 3,
                                      color: const Color.fromRGBO(
                                          235, 235, 235, 1)),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              )),
                        ],
                      ))
                ],
              ],
            ),
    ),
  );
}
