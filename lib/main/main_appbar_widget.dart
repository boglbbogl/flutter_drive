import 'package:flutter/material.dart';

AppBar mainAppbarWidget() {
  return AppBar(
    title: Text('Drive'),
    actions: [
      _actionIcons(onTap: () {}, icon: Icons.add_box_outlined),
      _actionIcons(onTap: () {}, icon: Icons.settings),
      _actionIcons(onTap: () {}, icon: Icons.account_box_rounded),
    ],
  );
}

IconButton _actionIcons({
  required IconData icon,
  required Function() onTap,
}) =>
    IconButton(onPressed: onTap, icon: Icon(icon));
