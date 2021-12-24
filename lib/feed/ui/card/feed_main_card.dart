import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/feed/provider/feed_provider.dart';
import 'package:flutter_drive/feed/ui/card/feed_course_card.dart';
import 'package:flutter_drive/feed/ui/card/feed_explantion_card.dart';
import 'package:flutter_drive/feed/ui/card/feed_user_info_card.dart';
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
                      color: const Color.fromRGBO(71, 71, 71, 1)),
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.05,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(91, 91, 91, 1),
                                    width: 0.9))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              provider.courseList[index].spot.first.placeName,
                              style: theme.textTheme.bodyText2!
                                  .copyWith(color: Colors.white, fontSize: 9),
                            ),
                            Container(
                              width: size.width * 0.2,
                              height: 1,
                              color: appSubColor,
                            ),
                            Text(
                              provider.courseList[index].spot.last.placeName,
                              style: theme.textTheme.bodyText2!
                                  .copyWith(color: Colors.white, fontSize: 9),
                            ),
                          ],
                        ),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          ...provider.courseList[index].spot.map(
                            (e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 12),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: appMainColor,
                                    size: 5,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    e.placeName,
                                    style: theme.textTheme.bodyText2!.copyWith(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: size.width,
                        height: 0.9,
                        color: const Color.fromRGBO(91, 91, 91, 1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border_rounded,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.bookmark_add_outlined,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_horiz_rounded,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      feedUserInfoCard(
                          imageUrl: provider
                                  .courseList[index].userProfile.isSocialImage
                              ? provider.courseList[index].userProfile
                                  .socialProfileUrl
                              : provider.courseList[index].userProfile
                                  .localProfileUrl,
                          nickName:
                              provider.courseList[index].userProfile.nickName),
                    ],
                  ),
                ),
              );
              // return Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 12),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       feedUserInfoCard(
              //           imageUrl:
              //               provider.courseList[index].userProfile.isSocialImage
              //                   ? provider.courseList[index].userProfile
              //                       .socialProfileUrl
              //                   : provider.courseList[index].userProfile
              //                       .localProfileUrl,
              //           nickName:
              //               provider.courseList[index].userProfile.nickName),
              //       FeedCourseCard(
              //         index: index,
              //         isExpanded: provider.isExpanded,
              //         expandableIndex: provider.expandableIndex,
              //         courseList: provider.courseList,
              //         contentOnTap: () {},
              //       ),
              //       // FeedImageCard(
              //       //     imageUrl: provider.courseList[index].imageUrl),
              //       feedExplantionCard(courseList: provider.courseList[index]),
              //       const SizedBox(height: 20),
              //     ],
              //   ),
              // );
            });
      },
    );
  }
}
