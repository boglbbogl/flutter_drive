import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:collection/collection.dart';
import 'package:flutter_drive/content/ui/card/content_main_card.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:provider/provider.dart';

class FeedUserPage extends StatelessWidget {
  const FeedUserPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedUserProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            provider.showCourseListIndex == 1
                ? "${provider.userProfile!.nickName} 님이 좋아요한 게시물"
                : provider.showCourseListIndex == 2
                    ? "${provider.userProfile!.nickName} 님이 북마크한 게시물"
                    : "${provider.userProfile!.nickName} 님의 게시물",
            style: theme.textTheme.bodyText2!
                .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        body: ContentMainCard(
          courseList: provider.showCourseListIndex == 1
              ? provider.likesCourseList
              : provider.showCourseListIndex == 2
                  ? provider.bookmarksCourseList
                  : provider.courseList,
          explanationIndex: provider.explanationIndex,
          feedImageOrCourse: provider.feedImageOrCourse,
          isMain: false,
        ),
      );
    });
  }
}
