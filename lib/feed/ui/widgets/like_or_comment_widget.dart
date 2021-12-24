import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

Padding likeOrCommentWidget({
  required String title,
  required Function() onTap,
  required double bottom,
  double? top = 0.0,
}) {
  return Padding(
    padding: EdgeInsets.only(
      left: 12,
      bottom: bottom,
      top: top!,
    ),
    child: InkWell(
      onTap: onTap,
      child: SizedBox(
        width: size.width,
        child: Text(title,
            style: theme.textTheme.bodyText2!.copyWith(
              color: const Color.fromRGBO(155, 155, 155, 1),
              fontSize: 12,
            )),
      ),
    ),
  );
}
