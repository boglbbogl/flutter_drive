import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/course/model/course_model.dart';

class FeedCourseCard extends StatelessWidget {
  final CourseModel courseList;

  const FeedCourseCard({
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Row(
            children: [
              Text(
                courseList.spot.first.placeName,
                style: theme.textTheme.bodyText2!.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: size.width * 0.05,
                  height: 1,
                  color: appMainColor,
                ),
              ),
              Text(
                courseList.spot.last.placeName,
                style: theme.textTheme.bodyText2!.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
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
                  style: theme.textTheme.bodyText2!
                      .copyWith(color: Colors.white, fontSize: 10),
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
