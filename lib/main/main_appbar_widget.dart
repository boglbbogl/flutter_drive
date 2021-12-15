import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/address/provider/address_provider.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/create/model/course_model.dart';
import 'package:flutter_drive/create/provider/course_provider.dart';
import 'package:flutter_drive/create/repo/course_repository.dart';
import 'package:flutter_drive/create/ui/create_page.dart';
import 'package:flutter_drive/main/setting_bottom_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

AppBar mainAppbarWidget({
  required BuildContext context,
}) {
  return AppBar(
    title: const Text('Drive'),
    actions: [
      _actionIcons(
          onTap: () {
            pushNewScreen(context,
                screen: const CreatePage(),
                pageTransitionAnimation: PageTransitionAnimation.slideUp);
          },
          icon: Icons.add_box_outlined),
      _actionIcons(
          onTap: () async {
            // CourseRepository courseRepository = CourseRepository();
            // CourseModel? result = await courseRepository.getCourseModel();
            // logger.e(result.toString());
            // settingBottomWidget(context: context);
          },
          icon: Icons.settings),
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 10),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 14,
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
                  imageUrl: context.watch<AuthProvider>().user!.profileUrl),
            ),
          ),
        ),
      ),
    ],
  );
}

IconButton _actionIcons({
  required IconData icon,
  required Function() onTap,
}) =>
    IconButton(onPressed: onTap, icon: Icon(icon));
