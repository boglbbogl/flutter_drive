import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_drive/feed/provider/feed_provider.dart';

class FeedCourseCard extends StatelessWidget {
  final int index;
  final int expandableIndex;
  final bool isExpanded;
  final List<CourseModel> courseList;
  const FeedCourseCard({
    Key? key,
    required this.index,
    required this.isExpanded,
    required this.expandableIndex,
    required this.courseList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<FeedProvider>()
            .isExpandableIndex(index: index + 1, value: isExpanded);
      },
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.1,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: appSubColor),
                    ),
                    Container(
                      width: size.width * 0.6,
                      height: 5,
                      color: appSubColor,
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: appSubColor),
                    ),
                  ],
                ),
                if (courseList[index].spot.length - 2 == 0)
                  Container()
                else
                  Icon(
                    Icons.more_vert_outlined,
                    size: 25,
                    color: appSubColor,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      child: Text(
                        courseList[index].spot.first.placeName,
                        textAlign: TextAlign.start,
                        style: theme.textTheme.bodyText2!
                            .copyWith(color: Colors.black, fontSize: 9),
                      ),
                    ),
                    SizedBox(
                      child: Center(
                        child: Text(
                          (courseList[index].spot.length - 2 == 0
                                  ? ''
                                  : courseList[index].spot.length)
                              .toString(),
                          style: theme.textTheme.bodyText2!
                              .copyWith(color: Colors.black, fontSize: 9),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      child: Text(
                        courseList[index].spot.last.placeName,
                        textAlign: TextAlign.end,
                        style: theme.textTheme.bodyText2!
                            .copyWith(color: Colors.black, fontSize: 9),
                      ),
                    )
                  ],
                ),
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
              child: ListView(
                shrinkWrap: true,
                children: [
                  ...courseList[index].spot.map((e) => Text(
                        e.placeName,
                        style: theme.textTheme.bodyText2!
                            .copyWith(color: Colors.black),
                      ))
                ],
              ),
            )
          else
            Container()
        ],
      ),
    );
  }
}
