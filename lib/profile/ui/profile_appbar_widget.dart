import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

AppBar profileAppbarWidget({
  required BuildContext context,
  required Color color,
  required bool isLoading,
  required Function() onTap,
}) {
  return AppBar(
    actions: [
      SizedBox(
        width: 80,
        height: 80,
        child: isLoading
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, right: 25, left: 25),
                child: CircularProgressIndicator(
                  color: appSubColor,
                ),
              )
            : TextButton(
                onPressed: onTap,
                child: Text(
                  '완료',
                  style: theme.textTheme.bodyText2!.copyWith(color: color),
                ),
              ),
      ),
    ],
  );
}
