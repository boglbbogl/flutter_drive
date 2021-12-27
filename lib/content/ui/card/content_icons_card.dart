import 'package:flutter/material.dart';

Padding contentIconsCard({
  required Function() commentOnTap,
  required Function() likeOnTap,
  required bool isLike,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _animatedIconBtn(
                isLike: isLike,
                color: isLike ? Colors.redAccent : Colors.white,
                icon: isLike ? Icons.favorite : Icons.favorite_border_rounded,
                onTap: likeOnTap),
            _iconBtn(icon: Icons.mode_comment_outlined, onTap: commentOnTap),
            _iconBtn(icon: Icons.bookmark_add_outlined, onTap: () {}),
          ],
        ),
        _iconBtn(icon: Icons.share, onTap: () {}),
      ],
    ),
  );
}

AnimatedSwitcher _animatedIconBtn({
  required IconData icon,
  required Function() onTap,
  Color? color = Colors.white,
  required bool isLike,
}) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 700),
    transitionBuilder: (child, animation) {
      return ScaleTransition(scale: animation, child: child);
    },
    child: isLike
        ? IconButton(
            key: const ValueKey('like'),
            onPressed: onTap,
            icon: Icon(
              icon,
              color: color,
            ))
        : IconButton(
            onPressed: onTap,
            icon: Icon(
              icon,
              color: color,
            )),
  );
}

IconButton _iconBtn({
  required IconData icon,
  required Function() onTap,
  Color? color = Colors.white,
}) {
  return IconButton(
      // padding: EdgeInsets.all(8),
      // constraints: BoxConstraints(),
      onPressed: onTap,
      iconSize: 22,
      icon: Icon(
        icon,
        color: color,
      ));
}
