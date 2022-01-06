import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:collection/collection.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/content/ui/card/content_main_card.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:provider/provider.dart';

class FeedUserPage extends StatelessWidget {
  final List<String> contents;
  final List<String> likes;
  final List<String> bookmarks;
  final String docKey;
  final String userNickName;
  const FeedUserPage({
    Key? key,
    required this.contents,
    required this.likes,
    required this.bookmarks,
    required this.docKey,
    required this.userNickName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedUserProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                userNickName,
                style: theme.textTheme.bodyText2!.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(225, 225, 225, 1)),
              ),
              Text(
                likes.isNotEmpty
                    ? " 님이 좋아한 게시물"
                    : bookmarks.isNotEmpty
                        ? " 님이 북마크한 게시물"
                        : " 님의 게시물",
                style: theme.textTheme.bodyText2!.copyWith(
                    fontSize: 11,
                    color: const Color.fromRGBO(225, 225, 225, 1)),
              ),
              const SizedBox(width: 10),
              Icon(
                likes.isNotEmpty
                    ? CustomIcon.heart
                    : bookmarks.isNotEmpty
                        ? CustomIcon.bookmark
                        : Icons.feed_rounded,
                size: 15,
                color: likes.isNotEmpty
                    ? Colors.redAccent
                    : bookmarks.isNotEmpty
                        ? Colors.green
                        : appMainColor,
              ),
            ],
          ),
        ),
        body: ContentMainCard(
          docKey: docKey,
          likes: likes,
          bookmarks: bookmarks,
          contents: contents,
          courseList: provider.courseList,
          explanationIndex: provider.explanationIndex,
          feedImageOrCourse: provider.feedImageOrCourse,
          isMain: false,
        ),
      );
    });
  }
}
