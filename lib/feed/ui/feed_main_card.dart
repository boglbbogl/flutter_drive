import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/feed/provider/feed_provider.dart';
import 'package:flutter_drive/feed/ui/feed_image_card.dart';
import 'package:provider/provider.dart';

class FeedMainCard extends StatelessWidget {
  const FeedMainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedProvider>(
      builder: (context, provider, child) {
        return ListView(
          children: [
            ...provider.courseList.map((course) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 8, top: 12),
                      child: Row(
                        children: [
                          userCircleImageWidget(
                              imageUrl: course.userProfile.isSocialImage
                                  ? course.userProfile.socialProfileUrl
                                  : course.userProfile.localProfileUrl),
                          const SizedBox(width: 8),
                          Text(
                            course.userProfile.nickName,
                            style: theme.textTheme.bodyText2!
                                .copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    FeedImageCard(imageUrl: course.imageUrl),
                    Container(
                      width: size.width,
                      height: 2,
                      color: Colors.red,
                    ),
                  ],
                )),
          ],
        );
      },
    );
  }
}
