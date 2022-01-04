import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:provider/provider.dart';

AppBar feedUserAppbarWidget({
  required BuildContext context,
  required String likeMeUserKey,
  required bool isMe,
  required bool isLikeUser,
  required Function() onTap,
}) {
  return AppBar(
    actions: [
      const SizedBox(width: 8),
      if (isMe)
        IconButton(onPressed: onTap, icon: const Icon(Icons.more_vert_rounded))
      else
        IconButton(
            onPressed: () {
              context
                  .read<FeedUserProvider>()
                  .addAndRemovLikesUserAndLikeMeUser(
                    isLikeUser: isLikeUser,
                    userKey: context.read<AuthProvider>().user!.userKey,
                    likeMeUserKey: likeMeUserKey,
                  );
              context.read<AuthProvider>().getAllUserActivity();
            },
            icon: isLikeUser
                ? Icon(CustomIcon.heart)
                : Icon(CustomIcon.heartEmpty)),
      const SizedBox(width: 12),
    ],
  );
}
