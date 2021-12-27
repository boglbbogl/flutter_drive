import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/content/ui/card/content_main_card.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:provider/provider.dart';

class FeedUserPage extends StatelessWidget {
  const FeedUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedUserProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              provider.userProfile == null
                  ? ""
                  : provider.userProfile!.nickName,
              style: theme.textTheme.bodyText2!
                  .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          body: ContentMainCard(
            courseList: provider.courseList,
            imageOrCouseSpotIndex: provider.imageOrCouseSpotIndex,
            isImageOrCouseSpot: provider.isImageOrCouseSpot,
            explanationIndex: provider.explanationIndex,
          ),
        );
      },
    );
  }
}
