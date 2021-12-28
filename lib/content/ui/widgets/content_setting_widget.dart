import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

Future<void> contentSettingWidget({
  required BuildContext context,
  required Function() deleteTap,
  required Function() updateTap,
  required bool isMe,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: materialBlackColor,
    builder: (context) => Container(
        height: isMe ? size.height * 0.25 : size.height * 0.15,
        decoration: BoxDecoration(
          color: darkThemeMainColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 8),
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(71, 71, 71, 1),
                  ),
                ),
                const SizedBox(height: 20),
                ListView(
                  shrinkWrap: true,
                  children: [
                    if (isMe) ...[
                      _menuItemListTile(
                        title: '수정하기',
                        icons: Icons.create,
                        color: const Color.fromRGBO(215, 215, 215, 1),
                        onTap: updateTap,
                      ),
                      _menuItemListTile(
                        title: '삭제하기',
                        icons: Icons.delete_outline,
                        color: appSubColor,
                        onTap: deleteTap,
                      ),
                    ],
                    if (!isMe) ...[
                      _menuItemListTile(
                          title: '신고하기',
                          icons: Icons.error_outline_rounded,
                          color: const Color.fromRGBO(155, 155, 155, 1),
                          onTap: () {}),
                    ],
                  ],
                ),
              ],
            ),
          ],
        )),
  );
}

InkWell _menuItemListTile({
  required String title,
  required IconData icons,
  required Function() onTap,
  required Color color,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        leading: Icon(
          icons,
          color: color,
        ),
        title: Text(
          title,
          style: theme.textTheme.bodyText2!.copyWith(
              color: color, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    ),
  );
}