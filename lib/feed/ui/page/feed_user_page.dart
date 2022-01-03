import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:collection/collection.dart';
import 'package:flutter_drive/content/ui/card/content_main_card.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:provider/provider.dart';

class FeedUserPage extends StatelessWidget {
  final List<String> contents;
  final List<String> likes;
  final List<String> bookmarks;
  final int scrollIndex;
  const FeedUserPage({
    Key? key,
    required this.contents,
    required this.likes,
    required this.bookmarks,
    required this.scrollIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedUserProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '',
            // "${provider.userProfile!.nickName} 님의 게시물",
            style: theme.textTheme.bodyText2!
                .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        body: ContentMainCard(
          likes: likes,
          bookmarks: bookmarks,
          contents: contents,
          courseList: provider.courseList,
          explanationIndex: provider.explanationIndex,
          feedImageOrCourse: provider.feedImageOrCourse,
          isMain: false,
          scrollIndex: scrollIndex,
        ),
      );
    });
  }
}
