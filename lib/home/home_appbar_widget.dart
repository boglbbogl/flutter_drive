import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/course/provider/course_provider.dart';
import 'package:flutter_drive/course/ui/screen/course_page.dart';
import 'package:flutter_drive/feed/ui/page/feed_user_likes_page.dart';
import 'package:flutter_drive/image/provider/images_provider.dart';
import 'package:flutter_drive/notification/provider/notification_provider.dart';
import 'package:flutter_drive/notification/ui/notification_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

AppBar homeAppbarWidget({
  required BuildContext context,
}) {
  return AppBar(
    title: Text(
      'ROUTE 66',
      style: theme.appBarTheme.titleTextStyle!.copyWith(
        fontFamily: 'Monoton',
      ),
    ),
    actions: [
      _actionIcons(
        onTap: () {
          context.read<CourseProvider>().started();
          pushNewScreen(context,
              screen: ChangeNotifierProvider(
                  create: (context) => ImagesProvider(), child: CoursePage()),
              pageTransitionAnimation: PageTransitionAnimation.slideUp);
        },
        icon: CustomIcon.plusSquaredEmpty,
      ),
      _actionIcons(
        onTap: () {
          context.read<AuthProvider>().getAllUserFeedUpdateActivityModel(
              userKey: context.read<AuthProvider>().user!.userKey);
          pushNewScreen(context,
              screen: FeedUserLikesPage(
                  userKey: context.read<AuthProvider>().user!.userKey,
                  userNickName: context.read<AuthProvider>().user!.nickName));
        },
        icon: CustomIcon.heartEmpty,
      ),
      _actionIcons(
        onTap: () async {
          await context.read<NotificationProvider>().getUserNotification(
              userKey: context.read<AuthProvider>().user!.userKey);
          pushNewScreen(context,
              screen: const NotificationPage(),
              pageTransitionAnimation: PageTransitionAnimation.slideUp);
        },
        icon: Icons.notifications_none,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 10),
        child: context.watch<AuthProvider>().user == null
            ? const CircleAvatar(
                backgroundColor: Color.fromRGBO(91, 91, 91, 1),
                radius: 14,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 15),
                  child: CircularProgressIndicator(),
                ),
              )
            : userCircleImageWidget(
                isProfileUpdate: true,
                context: context,
                userKey: context.read<AuthProvider>().user!.userKey,
                imageUrl: context.watch<AuthProvider>().user!.isSocialImage
                    ? context.watch<AuthProvider>().user!.socialProfileUrl
                    : context.watch<AuthProvider>().user!.localProfileUrl),
      ),
    ],
  );
}

IconButton _actionIcons({
  required IconData icon,
  required Function() onTap,
  double? iconSize,
}) =>
    IconButton(
        constraints: const BoxConstraints(),
        onPressed: onTap,
        icon: Icon(
          icon,
          size: iconSize ?? 24,
        ));
