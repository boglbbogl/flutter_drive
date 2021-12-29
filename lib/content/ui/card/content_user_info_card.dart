import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/content/provider/content_provider.dart';
import 'package:flutter_drive/content/ui/page/content_update_page.dart';
import 'package:flutter_drive/content/ui/widgets/content_setting_widget.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

Padding contentUserInfoCard({
  required String imageUrl,
  required String nickName,
  required CourseModel course,
  required BuildContext context,
  required Function() userOnTap,
  required String docKey,
  required bool isMe,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, top: 7, bottom: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: userOnTap,
          child: Row(
            children: [
              userCircleImageWidget(imageUrl: imageUrl),
              const SizedBox(width: 8),
              Text(
                nickName,
                style: theme.textTheme.bodyText2!.copyWith(fontSize: 11),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<ContentProvider>().getDocKey(docKey: docKey);
            contentSettingWidget(
              context: context,
              isMe: isMe,
              updateTap: () {
                Navigator.of(context).pop();
                pushNewScreen(context,
                    screen: ContentUpdatePage(
                      course: course,
                      isMe: isMe,
                    ),
                    pageTransitionAnimation: PageTransitionAnimation.slideUp);
              },
            );
          },
          icon: const Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
