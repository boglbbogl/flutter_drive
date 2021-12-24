import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';

Padding feedUserInfoCard({
  required String imageUrl,
  required String nickName,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8),
    child: Row(
      children: [
        userCircleImageWidget(imageUrl: imageUrl),
        const SizedBox(width: 8),
        Text(
          nickName,
          style: theme.textTheme.bodyText2!.copyWith(fontSize: 11),
        ),
        // IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.more_horiz_outlined,
        //       color: Colors.white,
        //       size: 30,
        //     )),
      ],
    ),
  );
}
