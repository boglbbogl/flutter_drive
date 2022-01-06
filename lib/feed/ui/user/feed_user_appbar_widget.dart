import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:provider/provider.dart';

AppBar feedUserAppbarWidget({
  required BuildContext context,
  required String likeMeUserKey,
  required bool isProfileUpdate,
  required bool isMe,
  required bool isLikeUser,
}) {
  return AppBar(
    actions: [
      const SizedBox(width: 8),
      if (isProfileUpdate)
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return RotationTransition(turns: animation, child: child);
            },
            child: context.read<FeedUserProvider>().isShowDrawer
                ? _darwerIcon(
                    context: context, key: "key", icon: Icons.clear_rounded)
                : _darwerIcon(
                    context: context,
                    key: "key_open",
                    icon: Icons.menu_rounded))
      else if (!isProfileUpdate && isMe)
        Container()
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

IconButton _darwerIcon({
  required BuildContext context,
  required String key,
  required IconData icon,
}) {
  return IconButton(
      key: ValueKey(key),
      onPressed: () {
        context.read<FeedUserProvider>().showCustomDrawer(
            value: context.read<FeedUserProvider>().isShowDrawer);
      },
      icon: Icon(icon, color: Colors.white));
}
