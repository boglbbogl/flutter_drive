import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/feed/content/provider/content_provider.dart';
import 'package:flutter_drive/feed/content/ui/card/content_course_card.dart';
import 'package:flutter_drive/feed/content/ui/card/content_explanation_card.dart';
import 'package:flutter_drive/feed/content/ui/card/content_icons_card.dart';
import 'package:flutter_drive/feed/content/ui/card/content_image_card.dart';
import 'package:flutter_drive/feed/content/ui/card/content_user_info_card.dart';
import 'package:flutter_drive/feed/content/ui/widgets/image_or_course_widget.dart';
import 'package:flutter_drive/feed/content/ui/widgets/like_or_comment_widget.dart';
import 'package:flutter_drive/feed/user/feed_user_main_page.dart';
import 'package:flutter_drive/feed/user/provider/user_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:provider/provider.dart';

class ContentMainCard extends StatelessWidget {
  const ContentMainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
            itemCount: provider.courseList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: darkThemeCardColor,
                  ),
                  child: Column(
                    children: [
                      contentUserInfoCard(
                          onTap: () {
                            context.read<ContentProvider>().getUserCourse(
                                userKey: provider.courseList[index].userKey);
                            pushNewScreen(context, screen: FeedUserMainPage());
                          },
                          imageUrl: provider
                                  .courseList[index].userProfile.isSocialImage
                              ? provider.courseList[index].userProfile
                                  .socialProfileUrl
                              : provider.courseList[index].userProfile
                                  .localProfileUrl,
                          nickName:
                              provider.courseList[index].userProfile.nickName),
                      _divider(),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: provider.imageOrCouseSpotIndex == index &&
                                provider.isImageOrCouseSpot
                            ? ContentImageCard(
                                imageUrl: provider.courseList[index].imageUrl,
                              )
                            : ContentCourseCard(
                                courseList: provider.courseList[index]),
                      ),
                      if (provider.courseList[index].imageUrl.isNotEmpty) ...[
                        AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: provider.imageOrCouseSpotIndex == index &&
                                    provider.isImageOrCouseSpot
                                ? contentCourseWidget(
                                    context: context,
                                    startPlaceName: provider.courseList[index]
                                        .spot.firstOrNull!.placeName,
                                    endPlaceName: provider.courseList[index]
                                        .spot.lastOrNull!.placeName,
                                    index: index,
                                  )
                                : contentImageWidget(
                                    context: context,
                                    imageUrls:
                                        provider.courseList[index].imageUrl,
                                    index: index)),
                      ],
                      _divider(),
                      contentIconsCard(),
                      likeOrCommentWidget(
                          onTap: () {}, title: '좋아요 98개', bottom: 2),
                      contentExplanationCard(
                        context: context,
                        nickName:
                            provider.courseList[index].userProfile.nickName,
                        explanation: provider.courseList[index].explanation,
                        index: index,
                        explanationIndex: provider.explanationIndex,
                      ),
                      likeOrCommentWidget(
                          onTap: () {},
                          title: '댓글 105개 전체보기',
                          top: 4,
                          bottom: 15),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }

  Container _divider() {
    return Container(
      width: size.width,
      height: 1,
      color: darkThemeMainColor,
    );
  }
}
