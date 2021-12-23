import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/course/provider/course_provider.dart';
import 'package:flutter_drive/image/provider/images_provider.dart';
import 'package:provider/provider.dart';

AppBar courseAppbarWidget({
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
      if (context.watch<CourseProvider>().isUploading)
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 12, bottom: 12),
          child: CircularProgressIndicator(
            color: appSubColor,
          ),
        )
      else
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: TextButton(
            onPressed: () async {
              if (context.read<CourseProvider>().courseSpotList.length > 1 &&
                  context.read<CourseProvider>().courseSpotList.isNotEmpty) {
                await context.read<CourseProvider>().createCourse(
                    user: context.read<AuthProvider>().user!,
                    multiImage: context.read<ImagesProvider>().pickedImages);
                Navigator.of(context).pop();
              }
            },
            child: Text(
              '올리기',
              style: theme.textTheme.bodyText2!.copyWith(
                  color: context.watch<CourseProvider>().courseSpotList.length >
                              1 &&
                          context
                              .watch<CourseProvider>()
                              .courseSpotList
                              .isNotEmpty
                      ? appSubColor
                      : const Color.fromRGBO(115, 115, 115, 1)),
            ),
          ),
        )
    ],
  );
}
