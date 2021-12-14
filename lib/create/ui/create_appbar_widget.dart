import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

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
          onPressed: () {},
          child: Text(
            '올리기',
            style: theme.textTheme.bodyText2!.copyWith(color: appSubColor),
          ),
        ),
      )
    ],
  );
}
