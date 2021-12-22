import 'package:flutter/material.dart';
import 'package:flutter_drive/feed/provider/feed_provider.dart';
import 'package:flutter_drive/feed/ui/card/feed_course_card.dart';
import 'package:flutter_drive/feed/ui/card/feed_user_info_card.dart';
import 'package:flutter_drive/feed/ui/widgets/feed_icons_widget.dart';
import 'package:provider/provider.dart';

class FeedMainCard extends StatelessWidget {
  const FeedMainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
            itemCount: provider.courseList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    feedUserInfoCard(
                        imageUrl:
                            provider.courseList[index].userProfile.isSocialImage
                                ? provider.courseList[index].userProfile
                                    .socialProfileUrl
                                : provider.courseList[index].userProfile
                                    .localProfileUrl,
                        nickName:
                            provider.courseList[index].userProfile.nickName),
                    // FeedImageCard(imageUrl: course.imageUrl),
                    FeedCourseCard(
                        index: index,
                        isExpanded: provider.isExpanded,
                        expandableIndex: provider.expandableIndex,
                        courseList: provider.courseList),
                    feedIconsWidget(),
                  ],
                ),
              );
            });
      },
    );
  }
}
