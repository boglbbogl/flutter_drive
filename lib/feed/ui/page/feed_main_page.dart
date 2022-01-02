import 'package:flutter/material.dart';
import 'package:flutter_drive/content/ui/card/content_main_card.dart';
import 'package:flutter_drive/feed/provider/feed_main_provider.dart';
import 'package:provider/provider.dart';

class FeedMainPage extends StatelessWidget {
  const FeedMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedMainProvider>(
      builder: (context, provider, child) {
        return ContentMainCard(
          courseList: provider.courseList,
          explanationIndex: provider.explanationIndex,
          feedImageOrCourse: provider.feedImageOrCourse,
        );
      },
    );
  }
}
