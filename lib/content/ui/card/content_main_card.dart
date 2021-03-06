import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_date_time.dart';
import 'package:flutter_drive/_constant/app_indicator.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/comment/provider/comment_provider.dart';
import 'package:flutter_drive/comment/ui/comment_main_page.dart';
import 'package:flutter_drive/content/provider/content_provider.dart';
import 'package:flutter_drive/content/ui/card/content_course_card.dart';
import 'package:flutter_drive/content/ui/card/content_explanation_card.dart';
import 'package:flutter_drive/content/ui/card/content_icons_card.dart';
import 'package:flutter_drive/content/ui/card/content_image_card.dart';
import 'package:flutter_drive/content/ui/card/content_user_info_card.dart';
import 'package:flutter_drive/content/ui/page/content_like_bookmark_page.dart';
import 'package:flutter_drive/content/ui/widgets/content_delete_card_widget.dart';
import 'package:flutter_drive/content/ui/widgets/content_refresher_widget.dart';
import 'package:flutter_drive/content/ui/widgets/image_or_course_widget.dart';
import 'package:flutter_drive/content/ui/widgets/like_or_comment_widget.dart';
import 'package:flutter_drive/content/ui/widgets/route_course_widget.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/model/feed_model.dart';
import 'package:flutter_drive/feed/provider/feed_main_provider.dart';
import 'package:flutter_drive/recommendation/recommendation_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ContentMainCard extends StatelessWidget {
  final List<CourseModel> courseList;
  final String docKey;
  final List<FeedModel> feedImageOrCourse;
  final List<int> explanationIndex;
  final bool isMain;
  final List<String> contents;
  final List<String> likes;
  final List<String> bookmarks;
  final List<String> notificationFeedDocKey;

  const ContentMainCard({
    Key? key,
    required this.courseList,
    required this.feedImageOrCourse,
    required this.explanationIndex,
    required this.docKey,
    required this.isMain,
    required this.contents,
    required this.likes,
    required this.bookmarks,
    required this.notificationFeedDocKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _userKey = context.watch<AuthProvider>().user == null
        ? ""
        : context.watch<AuthProvider>().user!.userKey;
    final _courseList = contents.isNotEmpty
        ? courseList
            .where((c) =>
                contents.contains(c.docKey) &&
                !c.isBlocked &&
                !c.blockedUserKey.contains(_userKey))
            .toList()
        : likes.isNotEmpty
            ? courseList
                .where((c) =>
                    likes.contains(c.docKey) &&
                    !c.isBlocked &&
                    !c.blockedUserKey.contains(_userKey))
                .toList()
            : bookmarks.isNotEmpty
                ? courseList
                    .where((c) =>
                        bookmarks.contains(c.docKey) &&
                        !c.isBlocked &&
                        !c.blockedUserKey.contains(_userKey))
                    .toList()
                : notificationFeedDocKey.isNotEmpty
                    ? courseList
                        .where((c) =>
                            notificationFeedDocKey.contains(c.docKey) &&
                            !c.isBlocked &&
                            !c.blockedUserKey.contains(_userKey))
                        .toList()
                    : courseList
                        .where((c) =>
                            !c.isBlocked &&
                            !c.blockedUserKey.contains(_userKey))
                        .toList();
    final _index = _courseList.indexWhere((e) => docKey.contains(e.docKey));
    if (context.read<AuthProvider>().user == null) {
      return const AppIndicator();
    }
    if (notificationFeedDocKey.isNotEmpty && _courseList.isEmpty) {
      return contentDeleteCardWidget();
    }
    return SmartRefresher(
      enablePullDown: false,
      enablePullUp: true,
      controller: isMain
          ? context.read<FeedMainProvider>().refreshController
          : RefreshController(),
      onLoading: () {
        if (isMain) {
          if (courseList.length == context.read<FeedMainProvider>().limit) {
            context.read<FeedMainProvider>().courseStreamMoreFeed();
            context.read<FeedMainProvider>().refreshController.loadComplete();
          } else {
            context.read<FeedMainProvider>().refreshController.loadNoData();
          }
        } else {
          // user not loading
        }
      },
      footer: contentRefreshFooter(isMain: isMain, context: context),
      child: ListView(
        children: [
          if (isMain &&
              context
                  .watch<RecommendationProvider>()
                  .routeCourseList
                  .isNotEmpty) ...[
            const SizedBox(height: 8),
            routeCourseWidget(context: context),
            const SizedBox(height: 10),
          ],
          if (!isMain && notificationFeedDocKey.isEmpty) ...[
            ..._courseList.where((e) => docKey.contains(e.docKey)).map((e) =>
                _card(
                    isFirst: true,
                    context: context,
                    courseList: _courseList,
                    index: _index)),
          ],
          ...List.generate(isMain ? _courseList.length : _courseList.length - 1,
              (index) {
            return _card(
                isFirst: false,
                context: context,
                courseList: isMain
                    ? _courseList
                    : _courseList
                        .where((e) => !docKey.contains(e.docKey))
                        .toList(),
                index: index);
          })
        ],
      ),
    );
  }

  Stack _card({
    required BuildContext context,
    required List<CourseModel> courseList,
    required int index,
    required bool isFirst,
  }) {
    return Stack(
      children: [
        if (courseList.isNotEmpty) ...[
          Padding(
            padding: isFirst
                ? const EdgeInsets.only(top: 12, bottom: 20, left: 8, right: 8)
                : const EdgeInsets.all(8.0),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: isFirst
                    ? Border.all(
                        color: const Color.fromRGBO(91, 91, 91, 1), width: 2)
                    : Border.all(),
                color: darkThemeBlackCardColor,
              ),
              child: Column(
                children: [
                  ...context
                      .watch<AuthProvider>()
                      .allUserProfile
                      .where((element) =>
                          courseList[index].userKey.contains(element.userKey))
                      .map(
                        (user) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: contentUserInfoCard(
                                  imageUrl: user.isSocialImage
                                      ? user.socialProfileUrl
                                      : user.localProfileUrl,
                                  nickName: user.nickName,
                                  course: courseList[index],
                                  context: context,
                                  userKey: courseList[index].userKey,
                                  docKey: courseList[index].docKey,
                                  isMe: courseList[index].userKey.contains(
                                      context
                                          .read<AuthProvider>()
                                          .user!
                                          .userKey)),
                            ),
                            _divider(),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: feedImageOrCourse.contains(
                                      FeedModel(index: index, isShow: true))
                                  ? ContentImageCard(
                                      imageUrl: courseList[index].imageUrl,
                                    )
                                  : ContentCourseCard(
                                      courseList: courseList[index]),
                            ),
                            if (courseList[index].imageUrl.isNotEmpty) ...[
                              AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  child: feedImageOrCourse.contains(
                                          FeedModel(index: index, isShow: true))
                                      ? contentCourseWidget(
                                          isMain: isMain,
                                          context: context,
                                          startPlaceName: courseList[index]
                                              .spot
                                              .firstOrNull!
                                              .placeName,
                                          endPlaceName: courseList[index]
                                              .spot
                                              .lastOrNull!
                                              .placeName,
                                          index: index,
                                        )
                                      : contentImageWidget(
                                          isMain: isMain,
                                          context: context,
                                          imageUrls: courseList[index].imageUrl,
                                          index: index)),
                            ],
                            _divider(),
                            contentIconsCard(
                                likePageTap: () {
                                  pushNewScreen(context,
                                      screen: ContentLikeBookmarkPage(
                                        isLike: true,
                                        userId: user.nickName,
                                        likeAndBookMarkUserKey:
                                            courseList[index].likeUserKey,
                                      ),
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.slideUp);
                                },
                                bookMarkPageTap: () {
                                  pushNewScreen(context,
                                      screen: ContentLikeBookmarkPage(
                                        isLike: false,
                                        userId: user.nickName,
                                        likeAndBookMarkUserKey:
                                            courseList[index].bookmarkUserKey,
                                      ),
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.slideUp);
                                },
                                bookmarkCount:
                                    courseList[index].bookmarkUserKey.length,
                                likeCount: courseList[index].likeUserKey.length,
                                isBookmark: courseList[index]
                                    .bookmarkUserKey
                                    .contains(context
                                        .read<AuthProvider>()
                                        .user!
                                        .userKey),
                                isLike: courseList[index].likeUserKey.contains(
                                    context.read<AuthProvider>().user!.userKey),
                                isComment: courseList[index].commentCount == 0,
                                bookmarkOnTap: () {
                                  context
                                      .read<ContentProvider>()
                                      .bookmarkAddAndRemove(
                                          notiUserKey:
                                              courseList[index].userKey,
                                          docKey: courseList[index].docKey,
                                          userKey: context
                                              .read<AuthProvider>()
                                              .user!
                                              .userKey,
                                          isBookmark: courseList[index]
                                              .bookmarkUserKey
                                              .contains(context
                                                  .read<AuthProvider>()
                                                  .user!
                                                  .userKey));
                                },
                                likeOnTap: () {
                                  context
                                      .read<ContentProvider>()
                                      .likeAddAndRemove(
                                          notiUserKey:
                                              courseList[index].userKey,
                                          isLike: courseList[index]
                                              .likeUserKey
                                              .contains(context
                                                  .read<AuthProvider>()
                                                  .user!
                                                  .userKey),
                                          docKey: courseList[index].docKey,
                                          userKey: context
                                              .read<AuthProvider>()
                                              .user!
                                              .userKey);
                                },
                                commentOnTap: () async {
                                  await _commentPushPaged(
                                      feedExplanation:
                                          courseList[index].explanation,
                                      userKey: courseList[index].userKey,
                                      context: context,
                                      docKey: courseList[index].docKey,
                                      allUser: context
                                          .read<AuthProvider>()
                                          .allUserProfile);
                                }),
                            contentExplanationCard(
                              isDetail: isMain,
                              context: context,
                              nickName: user.nickName,
                              explanation: courseList[index].explanation,
                              index: index,
                              explanationIndex: explanationIndex,
                            ),
                            if (courseList[index].srcKeyword.isNotEmpty) ...[
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                ),
                                child: SizedBox(
                                  width: size.width,
                                  height: size.height * 0.018,
                                  child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      ...courseList[index].srcKeyword.map((e) =>
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Center(
                                              child: Text(
                                                "#$e",
                                                style: theme
                                                    .textTheme.bodyText2!
                                                    .copyWith(
                                                        color: const Color
                                                                .fromRGBO(
                                                            195, 195, 195, 1),
                                                        fontSize: 10),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            likeOrCommentWidget(
                                onTap: () async {
                                  await _commentPushPaged(
                                      feedExplanation:
                                          courseList[index].explanation,
                                      userKey: courseList[index].userKey,
                                      context: context,
                                      docKey: courseList[index].docKey,
                                      allUser: context
                                          .read<AuthProvider>()
                                          .allUserProfile);
                                },
                                title: courseList[index].commentCount == 0
                                    ? "?????? ??????..."
                                    : "?????? ${courseList[index].commentCount}??? ????????????",
                                top: 4,
                                bottom: 2),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, bottom: 12, top: 4),
                              child: Text(
                                appDateTime(
                                    dateTime: courseList[index].createdAt),
                                style: theme.textTheme.bodyText2!.copyWith(
                                    color:
                                        const Color.fromRGBO(195, 195, 195, 1),
                                    fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Future _commentPushPaged({
    required BuildContext context,
    required List<UserModel> allUser,
    required String docKey,
    required String userKey,
    required String feedExplanation,
  }) async {
    pushNewScreen(
      context,
      screen: ChangeNotifierProvider(
        create: (context) =>
            CommentProvider(allUser)..getComment(docKey: docKey),
        child: CommentMainPage(
          feedExplanation: feedExplanation,
          docKey: docKey,
          userKey: userKey,
        ),
      ),
    );
  }

  Container _divider() {
    return Container(
      width: size.width,
      height: 1,
      color: darkThemeMainColor,
    );
  }
}
