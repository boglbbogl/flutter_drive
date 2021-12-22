import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';

Row feedUserInfoCard({
  required String imageUrl,
  required String nickName,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          userCircleImageWidget(imageUrl: imageUrl),
          const SizedBox(width: 8),
          Text(
            nickName,
            style: theme.textTheme.bodyText2!.copyWith(fontSize: 18),
          ),
        ],
      ),
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz_outlined,
            color: Colors.white,
            size: 30,
          )),
    ],
  );
}
