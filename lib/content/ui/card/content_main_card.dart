import 'package:collection/collection.dart';
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
import 'package:flutter_drive/content/ui/widgets/image_or_course_widget.dart';
import 'package:flutter_drive/content/ui/widgets/like_or_comment_widget.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/model/feed_model.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class ContentMainCard extends StatelessWidget {
  final List<CourseModel> courseList;
  final List<FeedModel> feedImageOrCourse;
  final List<int> explanationIndex;
  const ContentMainCard({
    Key? key,
    required this.courseList,
    required this.feedImageOrCourse,
    required this.explanationIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            itemCount: courseList.length,
            itemBuilder: (context, index) {
              return Padding(
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
                          .where((element) => courseList[index]
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
                                    course: courseList[index],
                                    context: context,
                                    userKey: courseList[index].userKey,
                                    docKey: courseList[index].docKey,
                                    isMe: courseList[index]
                                        .userKey
                                        .contains(user.userKey)),
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
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: feedImageOrCourse.contains(
                                              FeedModel(
                                                  index: index, isShow: true))
                                          ? contentCourseWidget(
                                              isDetail: context
                                                  .read<FeedUserProvider>()
                                                  .isDetail,
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
                                              isDetail: context
                                                  .read<FeedUserProvider>()
                                                  .isDetail,
                                              context: context,
                                              imageUrls:
                                                  courseList[index].imageUrl,
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
                                                courseList[index]
                                                    .bookmarkUserKey,
                                          ),
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.slideUp);
                                    },
                                    bookmarkCount: courseList[index]
                                        .bookmarkUserKey
                                        .length,
                                    likeCount:
                                        courseList[index].likeUserKey.length,
                                    isBookmark: courseList[index]
                                        .bookmarkUserKey
                                        .contains(context
                                            .read<AuthProvider>()
                                            .user!
                                            .userKey),
                                    isLike: courseList[index]
                                        .likeUserKey
                                        .contains(context
                                            .read<AuthProvider>()
                                            .user!
                                            .userKey),
                                    isComment:
                                        courseList[index].commentCount == 0,
                                    bookmarkOnTap: () {
                                      context
                                          .read<ContentProvider>()
                                          .bookmarkAddAndRemove(
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
                                          context: context,
                                          index: index,
                                          docKey: courseList[index].docKey,
                                          allUser: context
                                              .read<AuthProvider>()
                                              .allUserProfile);
                                    }),
                                contentExplanationCard(
                                  isDetail:
                                      context.read<FeedUserProvider>().isDetail,
                                  context: context,
                                  nickName: user.nickName,
                                  explanation: courseList[index].explanation,
                                  index: index,
                                  explanationIndex: explanationIndex,
                                ),
                                if (courseList[index]
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
                                          ...courseList[index]
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
                                          index: index,
                                          docKey: courseList[index].docKey,
                                          allUser: context
                                              .read<AuthProvider>()
                                              .allUserProfile);
                                    },
                                    title: courseList[index].commentCount == 0
                                        ? "댓글 입력..."
                                        : "댓글 ${courseList[index].commentCount}개 전체보기",
                                    top: 4,
                                    bottom: 2),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, bottom: 12, top: 4),
                                  child: Text(
                                    appDateTime(
                                        dateTime: courseList[index].createdAt),
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
              );
            }),
      ],
    );
  }

  Future _commentPushPaged({
    required BuildContext context,
    required int index,
    required List<UserModel> allUser,
    required String docKey,
  }) async {
    return pushNewScreen(
      context,
      screen: ChangeNotifierProvider(
        create: (context) =>
            CommentProvider(allUser)..getComment(docKey: docKey),
        child: CommentMainPage(
          docKey: courseList[index].docKey,
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
