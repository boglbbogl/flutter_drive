import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:collection/collection.dart';
import 'package:flutter_drive/content/ui/widgets/season_or_time_icon_widget.dart';

import 'package:flutter_drive/course/model/course_model.dart';

class ContentCourseCard extends StatelessWidget {
  final CourseModel courseList;

  const ContentCourseCard({
    Key? key,
    required this.courseList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    courseList.spot.firstOrNull!.placeName.length > 15
                        ? "${courseList.spot.firstOrNull!.placeName.substring(0, 15)} ..."
                        : courseList.spot.firstOrNull!.placeName,
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      width: size.width * 0.05,
                      height: 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: appMainColor,
                      ),
                    ),
                  ),
                  Text(
                    courseList.spot.lastOrNull!.placeName.length > 15
                        ? "${courseList.spot.lastOrNull!.placeName.substring(0, 15)} ..."
                        : courseList.spot.lastOrNull!.placeName,
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              seasonIconWidget(season: courseList.driveSeason),
            ],
          ),
        ),
        ...courseList.spot.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
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
                      color: const Color.fromRGBO(215, 215, 215, 1),
                      fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
