import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/content/ui/card/content_main_card.dart';
import 'package:flutter_drive/feed/provider/feed_main_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class FeedMainPage extends StatelessWidget {
  const FeedMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedMainProvider>(
      builder: (context, provider, child) {
        if (provider.courseList.isEmpty) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 2000),
            child: Shimmer.fromColors(
                baseColor: darkThemeCardColor,
                highlightColor: const Color.fromRGBO(115, 115, 115, 1),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 2),
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                )),
          );
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 2000),
          child: ContentMainCard(
            docKey: "",
            courseList: provider.courseList,
            explanationIndex: provider.explanationIndex,
            feedImageOrCourse: provider.feedImageOrCourse,
            isMain: true,
            contents: const [],
            likes: const [],
            bookmarks: const [],
          ),
        );
      },
    );
  }
}
