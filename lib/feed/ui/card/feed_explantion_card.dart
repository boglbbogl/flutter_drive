import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/course/model/course_model.dart';

Padding feedExplantionCard({
  required CourseModel courseList,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                '좋아요 10개',
                style: theme.textTheme.bodyText2!.copyWith(),
              ),
            ),
            Text(
              courseList.createdAt.toString().substring(0, 10),
              style: theme.textTheme.bodyText2!.copyWith(
                  color: const Color.fromRGBO(175, 175, 175, 1), fontSize: 11),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              courseList.userProfile.nickName,
              style: theme.textTheme.bodyText2!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(width: 5),
            Text(
              courseList.explanation.length > 15
                  ? courseList.explanation.substring(0, 15)
                  : courseList.explanation,
              style: theme.textTheme.bodyText2!.copyWith(fontSize: 11),
            ),
            if (courseList.explanation.length > 20) ...[
              InkWell(
                onTap: () {},
                child: Text(
                  '  ...더 보기',
                  style: theme.textTheme.bodyText2!.copyWith(
                      color: const Color.fromRGBO(175, 175, 175, 1),
                      fontSize: 12),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 3),
        InkWell(
          onTap: () {},
          child: Text(
            '댓글 100개 전체보기',
            style: theme.textTheme.bodyText2!.copyWith(
                color: const Color.fromRGBO(175, 175, 175, 1), fontSize: 11),
          ),
        ),
      ],
    ),
  );
}
