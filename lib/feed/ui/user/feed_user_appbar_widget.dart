import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

AppBar feedUserAppbarWidget({
  required BuildContext context,
  required String likeMeUserKey,
  required bool isMe,
  required bool isLikeUser,
}) {
  return AppBar(
    actions: [
      const SizedBox(width: 8),
      if (isMe)
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
      else
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: isLikeUser
              ? IconButton(
                  key: const ValueKey('icons'),
                  onPressed: () {
                    context
                        .read<FeedUserProvider>()
                        .addAndRemovLikesUserAndLikeMeUser(
                          isLikeUser: isLikeUser,
                          userKey: context.read<AuthProvider>().user!.userKey,
                          likeMeUserKey: likeMeUserKey,
                        );
                    context
                        .read<AuthProvider>()
                        .getAllUserFeedUpdateActivityModel(
                            userKey:
                                context.read<AuthProvider>().user!.userKey);
                  },
                  icon: const Icon(
                    CustomIcon.heart,
                    color: Colors.red,
                  ))
              : IconButton(
                  onPressed: () {
                    context
                        .read<FeedUserProvider>()
                        .addAndRemovLikesUserAndLikeMeUser(
                          isLikeUser: isLikeUser,
                          userKey: context.read<AuthProvider>().user!.userKey,
                          likeMeUserKey: likeMeUserKey,
                        );
                    context
                        .read<AuthProvider>()
                        .getAllUserFeedUpdateActivityModel(
                            userKey:
                                context.read<AuthProvider>().user!.userKey);
                  },
                  icon: const Icon(
                    CustomIcon.heartEmpty,
                    color: Colors.white,
                  )),
        ),
      const SizedBox(width: 12),
    ],
  );
}
