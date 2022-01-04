import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_date_time.dart';
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
import 'package:flutter_drive/content/ui/widgets/content_refresher_widget.dart';
import 'package:flutter_drive/content/ui/widgets/image_or_course_widget.dart';
import 'package:flutter_drive/content/ui/widgets/like_or_comment_widget.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/model/feed_model.dart';
import 'package:flutter_drive/feed/provider/feed_main_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ContentMainCard extends StatelessWidget {
  final RefreshController _controller = RefreshController();
  final AutoScrollController _scrollController =
      AutoScrollController(initialScrollOffset: 1);
  final List<CourseModel> courseList;
  final List<FeedModel> feedImageOrCourse;
  final List<int> explanationIndex;
  final bool isMain;
  final List<String> contents;
  final List<String> likes;
  final int scrollPositionIndex;
  final List<String> bookmarks;
  ContentMainCard({
    Key? key,
    required this.courseList,
    required this.feedImageOrCourse,
    required this.explanationIndex,
    required this.isMain,
    required this.contents,
    required this.scrollPositionIndex,
    required this.likes,
    required this.bookmarks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _courseList = contents.isNotEmpty
        ? courseList.where((c) => contents.contains(c.docKey)).toList()
        : likes.isNotEmpty
            ? courseList.where((c) => likes.contains(c.docKey)).toList()
            : bookmarks.isNotEmpty
                ? courseList.where((c) => bookmarks.contains(c.docKey)).toList()
                : courseList;
    return SmartRefresher(
      enablePullDown: false,
      enablePullUp: true,
      controller: _controller,
      onLoading: () {
        if (isMain) {
          if (courseList.length == context.read<FeedMainProvider>().limit) {
            context.read<FeedMainProvider>().courseStreamMoreFeed();
            _controller.loadComplete();
          } else {
            _controller.loadNoData();
          }
        } else {
          // user not loading
        }
      },
      footer: contentRefreshFooter(isMain: isMain),
      child: ListView(
        controller: _scrollController,
        children: [
          ...List.generate(_courseList.length, (index) {
            if (!isMain) {
              _scrollController.scrollToIndex(scrollPositionIndex,
                  duration: const Duration(milliseconds: 100),
                  preferPosition: AutoScrollPosition.begin);
            }
            return AutoScrollTag(
              key: ValueKey(index),
              index: index,
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: darkThemeCardColor,
                  ),
                  child: Column(
                    children: [
                      ...context
                          .watch<AuthProvider>()
                          .allUserProfile
                          .where((element) => _courseList[index]
                              .userKey
                              .contains(element.userKey))
                          .map(
                            (user) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                contentUserInfoCard(
                                    imageUrl: user.isSocialImage
                                        ? user.socialProfileUrl
                                        : user.localProfileUrl,
                                    nickName: user.nickName,
                                    course: _courseList[index],
                                    context: context,
                                    userKey: _courseList[index].userKey,
                                    docKey: _courseList[index].docKey,
                                    isMe: _courseList[index]
                                        .userKey
                                        .contains(user.userKey)),
                                _divider(),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: feedImageOrCourse.contains(
                                          FeedModel(index: index, isShow: true))
                                      ? ContentImageCard(
                                          imageUrl: _courseList[index].imageUrl,
                                        )
                                      : ContentCourseCard(
                                          courseList: _courseList[index]),
                                ),
                                if (_courseList[index].imageUrl.isNotEmpty) ...[
                                  AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: feedImageOrCourse.contains(
                                              FeedModel(
                                                  index: index, isShow: true))
                                          ? contentCourseWidget(
                                              isMain: isMain,
                                              context: context,
                                              startPlaceName: _courseList[index]
                                                  .spot
                                                  .firstOrNull!
                                                  .placeName,
                                              endPlaceName: _courseList[index]
                                                  .spot
                                                  .lastOrNull!
                                                  .placeName,
                                              index: index,
                                            )
                                          : contentImageWidget(
                                              isMain: isMain,
                                              context: context,
                                              imageUrls:
                                                  _courseList[index].imageUrl,
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
                                                _courseList[index].likeUserKey,
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
                                                _courseList[index]
                                                    .bookmarkUserKey,
                                          ),
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.slideUp);
                                    },
                                    bookmarkCount: _courseList[index]
                                        .bookmarkUserKey
                                        .length,
                                    likeCount:
                                        _courseList[index].likeUserKey.length,
                                    isBookmark: _courseList[index]
                                        .bookmarkUserKey
                                        .contains(context
                                            .read<AuthProvider>()
                                            .user!
                                            .userKey),
                                    isLike: _courseList[index]
                                        .likeUserKey
                                        .contains(context
                                            .read<AuthProvider>()
                                            .user!
                                            .userKey),
                                    isComment:
                                        _courseList[index].commentCount == 0,
                                    bookmarkOnTap: () {
                                      context
                                          .read<ContentProvider>()
                                          .bookmarkAddAndRemove(
                                              docKey: _courseList[index].docKey,
                                              userKey: context
                                                  .read<AuthProvider>()
                                                  .user!
                                                  .userKey,
                                              isBookmark: _courseList[index]
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
                                              isLike: _courseList[index]
                                                  .likeUserKey
                                                  .contains(context
                                                      .read<AuthProvider>()
                                                      .user!
                                                      .userKey),
                                              docKey: _courseList[index].docKey,
                                              userKey: context
                                                  .read<AuthProvider>()
                                                  .user!
                                                  .userKey);
                                    },
                                    commentOnTap: () async {
                                      await _commentPushPaged(
                                          context: context,
                                          docKey: _courseList[index].docKey,
                                          allUser: context
                                              .read<AuthProvider>()
                                              .allUserProfile);
                                    }),
                                contentExplanationCard(
                                  isDetail: isMain,
                                  context: context,
                                  nickName: user.nickName,
                                  explanation: _courseList[index].explanation,
                                  index: index,
                                  explanationIndex: explanationIndex,
                                ),
                                if (_courseList[index]
                                    .srcKeyword
                                    .isNotEmpty) ...[
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
                                          ..._courseList[index]
                                              .srcKeyword
                                              .map((e) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: Center(
                                                      child: Text(
                                                        "#$e",
                                                        style: theme.textTheme
                                                            .bodyText2!
                                                            .copyWith(
                                                                color: const Color
                                                                        .fromRGBO(
                                                                    195,
                                                                    195,
                                                                    195,
                                                                    1),
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
                                          context: context,
                                          docKey: _courseList[index].docKey,
                                          allUser: context
                                              .read<AuthProvider>()
                                              .allUserProfile);
                                    },
                                    title: _courseList[index].commentCount == 0
                                        ? "댓글 입력..."
                                        : "댓글 ${_courseList[index].commentCount}개 전체보기",
                                    top: 4,
                                    bottom: 2),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, bottom: 12, top: 4),
                                  child: Text(
                                    appDateTime(
                                        dateTime: _courseList[index].createdAt),
                                    style: theme.textTheme.bodyText2!.copyWith(
                                        color: const Color.fromRGBO(
                                            195, 195, 195, 1),
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
            );
          })
        ],
      ),
    );
  }

  Future _commentPushPaged({
    required BuildContext context,
    required List<UserModel> allUser,
    required String docKey,
  }) async {
    return pushNewScreen(
      context,
      screen: ChangeNotifierProvider(
        create: (context) =>
            CommentProvider(allUser)..getComment(docKey: docKey),
        child: CommentMainPage(
          docKey: docKey,
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
