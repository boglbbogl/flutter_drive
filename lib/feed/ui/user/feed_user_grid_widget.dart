import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/provider/feed_main_provider.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:flutter_drive/feed/ui/page/feed_user_page.dart';
import 'package:flutter_drive/feed/ui/user/feed_not_image_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class FeedUserGridWidget extends StatelessWidget {
  final List<CourseModel> allCourseModel;
  final List<String> likesDocKey;
  final List<String> bookmarksDocKey;
  final List<String> contentsDocKey;
  final String userNickName;
  final bool privacyLikes;
  final bool privacyBookmarks;
  final bool isMe;

  const FeedUserGridWidget({
    Key? key,
    required this.allCourseModel,
    required this.likesDocKey,
    required this.bookmarksDocKey,
    required this.contentsDocKey,
    required this.userNickName,
    required this.privacyBookmarks,
    required this.privacyLikes,
    required this.isMe,
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
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                children: [
                  ...allCourseModel
                      .where((c) => contentsDocKey.contains(c.docKey))
                      .map((feed) => _contentFeedGridListItem(
                            context: context,
                            feed: feed,
                            contents: contentsDocKey,
                            likes: [],
                            bookmarks: [],
                            userNickName: userNickName,
                          ))
                ],
              )),
        ),
        Tab(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            child: privacyLikes && !isMe
                ? _privacyInfoForm()
                : GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    children: [
                      ...allCourseModel
                          .where((c) => likesDocKey.contains(c.docKey))
                          .map((feed) => _contentFeedGridListItem(
                                context: context,
                                feed: feed,
                                contents: [],
                                likes: likesDocKey,
                                bookmarks: [],
                                userNickName: userNickName,
                              ))
                    ],
                  ),
          ),
        ),
        Tab(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            child: privacyBookmarks && !isMe
                ? _privacyInfoForm()
                : GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    children: [
                      ...allCourseModel
                          .where((c) => bookmarksDocKey.contains(c.docKey))
                          .map((feed) => _contentFeedGridListItem(
                                context: context,
                                feed: feed,
                                contents: [],
                                likes: [],
                                bookmarks: bookmarksDocKey,
                                userNickName: userNickName,
                              ))
                    ],
                  ),
          ),
        ),
      ]),
    );
  }
}

Row _privacyInfoForm() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.lock, size: 24, color: appMainColor),
      const SizedBox(width: 10),
      Text('비공개',
          style: theme.textTheme.bodyText2!.copyWith(
              color: appMainColor, fontSize: 18, fontWeight: FontWeight.bold)),
    ],
  );
}

InkWell _contentFeedGridListItem({
  required BuildContext context,
  required CourseModel feed,
  required List<String> contents,
  required List<String> likes,
  required List<String> bookmarks,
  required String userNickName,
}) {
  return InkWell(
    onTap: () {
      context.read<FeedMainProvider>().initialization();
      context.read<FeedUserProvider>().initialization();
      pushNewScreen(context,
          screen: FeedUserPage(
            docKey: feed.docKey,
            userNickName: userNickName,
            contents: contents,
            likes: likes,
            bookmarks: bookmarks,
            notificationFeedDocKey: const [],
          ),
          pageTransitionAnimation: PageTransitionAnimation.cupertino);
    },
    child: Container(
      child: feed.imageUrl.isEmpty
          ? feedNotImageWidget(feed: feed)
          : Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: feed.imageUrl.firstOrNull!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 70, horizontal: 70),
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: appMainColor,
                    ),
                  ),
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
