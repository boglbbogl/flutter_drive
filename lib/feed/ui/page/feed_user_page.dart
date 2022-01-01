import 'package:flutter/material.dart';
import 'package:flutter_drive/content/ui/card/content_main_card.dart';
import 'package:flutter_drive/feed/provider/feed_main_provider.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:provider/provider.dart';

class FeedUserPage extends StatelessWidget {
  const FeedUserPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedUserProvider>(builder: (context, provider, child) {
      return WillPopScope(
        onWillPop: () => _feedStateInitialization(context: context),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                _feedStateInitialization(context: context);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_rounded),
            ),
            // title: Text(
            //   provider.userProfile == null ? "" : provider.userProfile!.nickName,
            //   style: theme.textTheme.bodyText2!
            //       .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
            // ),
          ),
          body: ContentMainCard(
            courseList: provider.courseList,
            imageOrCouseSpotIndex: provider.imageOrCouseSpotIndex,
            isImageOrCouseSpot: provider.isImageOrCouseSpot,
            explanationIndex: provider.explanationIndex,
          ),
        ),
      );
    });
  }

  Future<bool> _feedStateInitialization({
    required BuildContext context,
  }) async {
    context.read<FeedUserProvider>().initialization();
    context.read<FeedMainProvider>().initialization();
    return true;
  }
}
