import 'package:flutter/material.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/ui/card/feed_course_card.dart';
import 'package:flutter_drive/feed/ui/card/feed_explantion_card.dart';
import 'package:flutter_drive/feed/ui/card/feed_user_info_card.dart';
import 'package:flutter_drive/feed/ui/widgets/feed_icons_widget.dart';

class ContentMainPage extends StatelessWidget {
  final String userProfileUrl;
  final String nickName;
  final bool isExpanded;
  final List<CourseModel> courseList;
  final CourseModel course;
  final int index;
  final int expandableIndex;

  const ContentMainPage({
    Key? key,
    required this.userProfileUrl,
    required this.nickName,
    required this.isExpanded,
    required this.courseList,
    required this.course,
    required this.index,
    required this.expandableIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          feedUserInfoCard(
            nickName: nickName,
            imageUrl: userProfileUrl,
          ),
          FeedCourseCard(
              contentOnTap: () => false,
              index: index,
              isExpanded: isExpanded,
              expandableIndex: expandableIndex,
              courseList: courseList),
          // FeedImageCard(
          //     imageUrl: provider.courseList[index].imageUrl),
          feedIconsWidget(),
          feedExplantionCard(courseList: course),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
