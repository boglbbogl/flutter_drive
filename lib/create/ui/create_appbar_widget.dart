import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/create/model/course_model.dart';
import 'package:flutter_drive/create/provider/course_provider.dart';
import 'package:provider/provider.dart';

AppBar createAppbarWidget({
  required BuildContext context,
  required Function() submitted,
}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.clear),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: TextButton(
          onPressed: () {
            context.read<CourseProvider>().createCourse(
                  userKey: 'userKey',
                );
          },
          child: Text(
            '올리기',
            style: theme.textTheme.bodyText2!.copyWith(color: appSubColor),
          ),
        ),
      )
    ],
  );
}
