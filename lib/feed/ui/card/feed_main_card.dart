import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/feed/provider/feed_provider.dart';
import 'package:flutter_drive/feed/ui/card/feed_course_card.dart';
import 'package:flutter_drive/feed/ui/card/feed_icons_card.dart';
import 'package:flutter_drive/feed/ui/card/feed_image_card.dart';
import 'package:flutter_drive/feed/ui/card/feed_user_info_card.dart';
import 'package:flutter_drive/feed/ui/widgets/image_or_course_widget.dart';
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
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: darkThemeCardColor,
                  ),
                  child: Column(
                    children: [
                      feedUserInfoCard(
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
                        duration: const Duration(milliseconds: 500),
                        child: provider.imageOrCouseSpotIndex == index &&
                                provider.isImageOrCouseSpot
                            ? FeedImageCard(
                                imageUrl: provider.courseList[index].imageUrl,
                              )
                            : FeedCourseCard(
                                courseList: provider.courseList[index]),
                      ),
                      if (provider.courseList[index].imageUrl.isNotEmpty) ...[
                        AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: provider.imageOrCouseSpotIndex == index &&
                                    provider.isImageOrCouseSpot
                                ? feedCourseWidget(
                                    context: context,
                                    startPlaceName: provider.courseList[index]
                                        .spot.firstOrNull!.placeName,
                                    endPlaceName: provider.courseList[index]
                                        .spot.lastOrNull!.placeName,
                                    index: index,
                                  )
                                : feedImageWidget(
                                    context: context,
                                    imageUrls:
                                        provider.courseList[index].imageUrl,
                                    index: index)),
                      ],
                      _divider(),
                      feedIconsCard(),
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
