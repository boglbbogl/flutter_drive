import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_indicator.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/content/ui/card/content_main_card.dart';
import 'package:flutter_drive/feed/provider/feed_main_provider.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:provider/provider.dart';

class FeedUserPage extends StatelessWidget {
  const FeedUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedUserProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const AppIndicator();
        }
        return WillPopScope(
          onWillPop: () => _feedStateIniaialization(context: context),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  _feedStateIniaialization(context: context);
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_rounded),
              ),
              title: Text(
                provider.userProfile == null
                    ? ""
                    : provider.userProfile!.nickName,
                style: theme.textTheme.bodyText2!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    profileCircleImageWidget(
                        imageUrl: provider.userProfile!.isSocialImage
                            ? provider.userProfile!.socialProfileUrl
                            : provider.userProfile!.localProfileUrl),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text('게시물'),
                            Text('100'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('게시물'),
                            Text('100'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('게시물'),
                            Text('100'),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            // body: ContentMainCard(
            //   courseList: provider.courseList,
            //   imageOrCouseSpotIndex: provider.imageOrCouseSpotIndex,
            //   isImageOrCouseSpot: provider.isImageOrCouseSpot,
            //   explanationIndex: provider.explanationIndex,
            // ),
          ),
        );
      },
    );
  }

  Future<bool> _feedStateIniaialization({
    required BuildContext context,
  }) async {
    context.read<FeedUserProvider>().initialization();
    context.read<FeedMainProvider>().initialization();
    return true;
  }
}
