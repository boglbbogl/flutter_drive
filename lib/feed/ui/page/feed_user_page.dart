import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:collection/collection.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/content/ui/card/content_main_card.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:provider/provider.dart';

class FeedUserPage extends StatelessWidget {
  final String appBarUserKey;
  const FeedUserPage({
    Key? key,
    required this.appBarUserKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedUserProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            context
                .watch<AuthProvider>()
                .allUserProfile
                .where((element) => appBarUserKey.contains(element.userKey))
                .firstOrNull!
                .nickName,
            style: theme.textTheme.bodyText2!
                .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        body: ContentMainCard(
          courseList: provider.courseList,
          explanationIndex: provider.explanationIndex,
          feedImageOrCourse: provider.feedImageOrCourse,
          isMain: false,
        ),
      );
    });
  }
}
