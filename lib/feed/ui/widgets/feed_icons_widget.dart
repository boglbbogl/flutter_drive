import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Row feedIconsWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          _iconButtonForm(
              onPressed: () {}, icon: Icons.favorite_border_rounded),
          _iconButtonForm(onPressed: () {}, icon: Icons.bookmark_add_outlined),
          _iconButtonForm(onPressed: () {}, icon: Icons.chat),
        ],
      ),
      _iconButtonForm(onPressed: () {}, icon: Icons.share),
    ],
  );
}

IconButton _iconButtonForm({
  required Function() onPressed,
  required IconData icon,
}) {
  return IconButton(
    constraints: const BoxConstraints(),
    padding: const EdgeInsets.only(
      top: 5,
      right: 10,
    ),
    onPressed: onPressed,
    icon: Icon(
      icon,
      color: Colors.white,
      size: 25,
    ),
  );
}
