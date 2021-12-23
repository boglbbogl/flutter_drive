import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/provider/feed_provider.dart';
import 'package:provider/provider.dart';

class FeedCourseCard extends StatelessWidget {
  final int index;
  final int expandableIndex;
  final bool isExpanded;
  final List<CourseModel> courseList;
  final Function() contentOnTap;
  const FeedCourseCard({
    Key? key,
    required this.index,
    required this.isExpanded,
    required this.expandableIndex,
    required this.courseList,
    required this.contentOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: contentOnTap,
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: index + 1 == expandableIndex && isExpanded
                    ? Radius.zero
                    : const Radius.circular(12),
                bottomRight: index + 1 == expandableIndex && isExpanded
                    ? Radius.zero
                    : const Radius.circular(12),
              ),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _courseSpotCircle(),
                        Container(
                            width: size.width * 0.65,
                            height: 5,
                            color: appSubColor),
                        _courseSpotCircle(),
                      ],
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      size: 25,
                      color: courseList[index].spot.length - 2 == 0
                          ? Colors.white
                          : appSubColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _courseSpotPlaceName(
                            textAlign: TextAlign.start,
                            placeName:
                                courseList[index].spot.firstOrNull!.placeName),
                        SizedBox(
                          child: Center(
                            child: Text(
                              courseList[index].spot.length - 2 == 0
                                  ? ''
                                  : "+${courseList[index].spot.length - 2}",
                              style: theme.textTheme.bodyText2!
                                  .copyWith(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ),
                        _courseSpotPlaceName(
                          textAlign: TextAlign.end,
                          placeName:
                              courseList[index].spot.lastOrNull!.placeName,
                        )
                      ],
                    ),
                  ],
                ),
                if (index + 1 == expandableIndex && isExpanded)
                  Container()
                else
                  _expandableButtonForm(
                    context: context,
                    right: -10,
                    bottom: -10,
                    icon: Icons.keyboard_arrow_down_rounded,
                  )
              ],
            ),
          ),
          if (index + 1 == expandableIndex && isExpanded)
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Stack(
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: 10),
                      ...courseList[index].spot.map((e) => Padding(
                            padding: const EdgeInsets.only(
                                left: 30, top: 5, bottom: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: appSubColor,
                                ),
                                const SizedBox(width: 15),
                                SizedBox(
                                  width: size.width * 0.75,
                                  child: Text(
                                    e.placeName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: theme.textTheme.bodyText2!.copyWith(
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 10),
                    ],
                  ),
                  if (index + 1 == expandableIndex && isExpanded)
                    _expandableButtonForm(
                      context: context,
                      top: -10,
                      right: -10,
                      icon: Icons.keyboard_arrow_up_rounded,
                    )
                  else
                    Container()
                ],
              ),
            )
          else
            Container()
        ],
      ),
    );
  }

  SizedBox _courseSpotPlaceName({
    required TextAlign textAlign,
    required String placeName,
  }) {
    return SizedBox(
      width: size.width * 0.4,
      child: Text(
        placeName,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: theme.textTheme.bodyText2!
            .copyWith(color: Colors.black, fontSize: 9),
      ),
    );
  }

  Container _courseSpotCircle() {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: appSubColor),
    );
  }

  Positioned _expandableButtonForm({
    required BuildContext context,
    double? top,
    double? bottom,
    double? right,
    required IconData icon,
  }) {
    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      child: TextButton(
        onPressed: () {
          context
              .read<FeedProvider>()
              .isExpandableIndex(index: index + 1, value: isExpanded);
        },
        child: Icon(
          icon,
          color: const Color.fromRGBO(175, 175, 175, 1),
        ),
      ),
    );
  }
}
