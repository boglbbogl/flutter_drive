import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_date_time.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/comment/provider/comment_provider.dart';
import 'package:provider/provider.dart';

Row commentListWidget({
  required BuildContext context,
  required String commentMoreDocKey,
  required UserModel userModel,
  required String profileUserKey,
  required String profileUrl,
  required String profileNickName,
  required String comment,
  required DateTime createdAt,
  required bool isMe,
  required String commentDocKey,
  required int isMoreCount,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onLongPress: () {
          context.read<CommentProvider>().showLongPressed(
              commentMoreDcoKey: commentMoreDocKey,
              value: true,
              user: userModel);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userCircleImageWidget(
                context: context,
                userKey: profileUserKey,
                imageUrl: profileUrl),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.7,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "$profileNickName  ",
                        style: theme.textTheme.bodyText2!.copyWith(
                            color: const Color.fromRGBO(195, 195, 195, 1),
                            fontSize: 8)),
                    TextSpan(
                        text: comment,
                        style: theme.textTheme.bodyText2!
                            .copyWith(color: Colors.white, fontSize: 9)),
                  ])),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: Text(
                        appDateTime(dateTime: createdAt),
                        style: theme.textTheme.bodyText2!.copyWith(
                            color: const Color.fromRGBO(155, 155, 155, 1),
                            fontSize: 8),
                      ),
                    ),
                    Container(),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      if (isMe) ...[
        IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              context.read<CommentProvider>().showCommentSettingBottom(
                  isMoreComment: false,
                  removeMoreCommentDocKey: "",
                  value: true,
                  commentDocKey: commentDocKey,
                  isMoreCount: isMoreCount);
            },
            icon: const Icon(Icons.more_horiz_rounded,
                color: Colors.white, size: 18)),
      ],
    ],
  );
}
