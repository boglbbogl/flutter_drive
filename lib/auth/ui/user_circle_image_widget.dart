import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/feed/provider/feed_main_provider.dart';
import 'package:flutter_drive/feed/ui/page/feed_user_profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

InkWell userCircleImageWidget(
    {required String imageUrl,
    required BuildContext context,
    required String userKey,
    Widget? widget,
    double? radius = 14}) {
  return InkWell(
    onTap: () async {
      context.read<AuthProvider>().getAllUserFeedUpdateStatus(userKey: userKey);
      pushNewScreen(context,
          screen: FeedUserProfilePage(
            userKey: userKey,
            allCourseModel: context.read<FeedMainProvider>().courseList,
          ));
    },
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: radius,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipOval(
              child: CachedNetworkImage(
                  placeholder: (context, url) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                          color: Colors.white,
                        ),
                      ),
                  fit: BoxFit.cover,
                  fadeOutDuration: const Duration(milliseconds: 1),
                  imageUrl: imageUrl),
            ),
          ),
        ),
        widget ?? Container(),
      ],
    ),
  );
}
