import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

Padding contentIconsCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _iconBtn(icon: Icons.favorite_border_rounded, onTap: () {}),
            _iconBtn(icon: Icons.mode_comment_outlined, onTap: () {}),
            _iconBtn(icon: Icons.bookmark_add_outlined, onTap: () {}),
          ],
        ),
        _iconBtn(icon: Icons.share, onTap: () {}),
      ],
    ),
  );
}

IconButton _iconBtn({
  required IconData icon,
  required Function() onTap,
}) {
  return IconButton(
      // padding: EdgeInsets.all(8),
      // constraints: BoxConstraints(),
      onPressed: () {},
      iconSize: 22,
      icon: Icon(
        icon,
        color: Colors.white,
      ));
}
