import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/create/provider/course_provider.dart';
import 'package:flutter_drive/image/images_provider.dart';
import 'package:provider/provider.dart';

AppBar createAppbarWidget({
  required BuildContext context,
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
          onPressed: () async {
            await context.read<CourseProvider>().createCourse(
                userKey: context.read<AuthProvider>().user!.userKey,
                multiImage: context.read<ImagesProvider>().pickedImages);
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
