import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_date_time.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/comment/model/comment_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_drive/comment/provider/comment_provider.dart';

Padding moreCommentListWidget(
    {
    // required MoreCommentModel moreCommentModel,
    required BuildContext context,
    required String profileUserKey,
    required String profileUserUrl,
    required String profileUserNickName,
    required String commentUserNickName,
    required String comment,
    required DateTime createdAt,
    required bool isMyMoreComment,
    required String commentDocKey,
    required int isMoreCount,
    required String removeMoreCommentDocKey}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                  width: size.width * 0.03,
                  height: 0.5,
                  color: const Color.fromRGBO(71, 71, 71, 1)),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            userCircleImageWidget(
                radius: 10,
                context: context,
                userKey: profileUserKey,
                imageUrl: profileUserUrl),
            SizedBox(
              width: size.width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.7,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: profileUserNickName,
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(195, 195, 195, 1),
                          fontSize: 7),
                    ),
                    TextSpan(
                      text: " @$commentUserNickName   ",
                      style: theme.textTheme.bodyText2!.copyWith(
                        color: appMainColor,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: comment,
                      style: theme.textTheme.bodyText2!
                          .copyWith(color: Colors.white, fontSize: 9),
                    )
                  ])),
                ),
                const SizedBox(height: 8),
                Text(
                    appDateTime(
                      dateTime: createdAt,
                    ),
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: const Color.fromRGBO(195, 195, 195, 1),
                        fontSize: 8)),
              ],
            ),
          ],
        ),
        if (isMyMoreComment) ...[
          IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                context.read<CommentProvider>().showCommentSettingBottom(
                    isMoreComment: true,
                    value: true,
                    commentDocKey: commentDocKey,
                    isMoreCount: isMoreCount,
                    removeMoreCommentDocKey: removeMoreCommentDocKey);
              },
              icon: const Icon(Icons.more_horiz_rounded,
                  color: Colors.white, size: 18)),
        ],
      ],
    ),
  );
}
