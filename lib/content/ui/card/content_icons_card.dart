import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';

Padding contentIconsCard({
  required Function() commentOnTap,
  required Function() likeOnTap,
  required Function() bookmarkOnTap,
  required Function() likePageTap,
  required Function() bookMarkPageTap,
  required bool isLike,
  required bool isBookmark,
  required bool isComment,
  required int likeCount,
  required int bookmarkCount,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              children: [
                _animatedIconBtn(
                    isFilled: isLike,
                    color: isLike ? Colors.redAccent : Colors.white,
                    icon: isLike ? CustomIcon.heart : CustomIcon.heartEmpty,
                    onTap: likeOnTap),
                const SizedBox(height: 1),
                _contentCountForm(
                    onTap: likePageTap,
                    title: likeCount == 0 ? "" : likeCount.toString()),
              ],
            ),
            Column(
              children: [
                _iconBtn(
                    icon: !isComment
                        ? CustomIcon.comment
                        : CustomIcon.commentEmpty,
                    onTap: commentOnTap),
                _contentCountForm(onTap: () {}, title: ""),
              ],
            ),
            Column(
              children: [
                _animatedIconBtn(
                  isFilled: isBookmark,
                  icon: isBookmark
                      ? CustomIcon.bookmark
                      : CustomIcon.bookmarkEmpty,
                  color: isBookmark ? Colors.green : Colors.white,
                  onTap: bookmarkOnTap,
                ),
                const SizedBox(height: 1),
                _contentCountForm(
                    onTap: bookMarkPageTap,
                    title: bookmarkCount == 0 ? "" : bookmarkCount.toString()),
              ],
            ),
          ],
        ),
        // Column(
        //   children:  [
        //     // _iconBtn(icon: Icons.share, onTap: () {}),
        //     // _contentCountForm(onTap: () {}, title: ""),
        //   ],
        // ),
      ],
    ),
  );
}

InkWell _contentCountForm({
  required String title,
  required Function() onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Text(
      title,
      style: theme.textTheme.bodyText2!.copyWith(
          color: const Color.fromRGBO(195, 195, 195, 1), fontSize: 12),
    ),
  );
}

AnimatedSwitcher _animatedIconBtn({
  required IconData icon,
  required Function() onTap,
  Color? color = Colors.white,
  required bool isFilled,
}) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    transitionBuilder: (child, animation) {
      return ScaleTransition(scale: animation, child: child);
    },
    child: isFilled
        ? IconButton(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            constraints: const BoxConstraints(),
            key: const ValueKey('filled'),
            onPressed: onTap,
            icon: Icon(
              icon,
              color: color,
            ))
        : IconButton(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            constraints: const BoxConstraints(),
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
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
      constraints: const BoxConstraints(),
      onPressed: onTap,
      // iconSize: 22,
      icon: Icon(
        icon,
        color: color,
      ));
}
