import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/create/provider/course_provider.dart';
import 'package:flutter_drive/create/ui/screen/create_page.dart';
import 'package:flutter_drive/home/setting_bottom_widget.dart';
import 'package:flutter_drive/image/provider/images_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

AppBar homeAppbarWidget({
  required BuildContext context,
}) {
  return AppBar(
    title: const Text('Drive'),
    actions: [
      _actionIcons(
          onTap: () {
            context.read<CourseProvider>().started();
            pushNewScreen(context,
                screen: ChangeNotifierProvider(
                    create: (context) => ImagesProvider(),
                    child: const CreatePage()),
                pageTransitionAnimation: PageTransitionAnimation.slideUp);
          },
          icon: Icons.add_box_outlined),
      _actionIcons(
          onTap: () {
            settingBottomWidget(context: context);
          },
          icon: Icons.settings),
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 10),
        child: userCircleImageWidget(
            imageUrl: context.watch<AuthProvider>().user!.profileUrl),
      ),
    ],
  );
}

IconButton _actionIcons({
  required IconData icon,
  required Function() onTap,
}) =>
    IconButton(onPressed: onTap, icon: Icon(icon));
