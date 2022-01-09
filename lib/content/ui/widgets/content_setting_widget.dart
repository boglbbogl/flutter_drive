import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/blocked/feed_blocked_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

Future<void> contentSettingWidget({
  required BuildContext context,
  required Function() updateTap,
  required String docKey,
  required bool isMe,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: materialBlackColor,
    builder: (context) => Container(
      height: size.width * 0.5,
      decoration: BoxDecoration(
        color: darkThemeMainColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 25),
            child: Container(
              width: size.width * 0.2,
              height: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(71, 71, 71, 1)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _bottomWidgetForm(
                  title: '출시예정',
                  icon: Icons.share,
                  color: const Color.fromRGBO(115, 115, 115, 1),
                  onTap: () {
                    appFlushbar(message: '공유하기 기능은 곧 출시 예정인 기능입니다')
                        .show(context);
                  }),
              _bottomWidgetForm(
                  title: '출시예정',
                  icon: Icons.map_outlined,
                  color: const Color.fromRGBO(115, 115, 115, 1),
                  onTap: () {
                    appFlushbar(message: '지도보기 기능은 곧 출시 예정인 기능입니다')
                        .show(context);
                  }),
              if (isMe) ...[
                _bottomWidgetForm(
                    title: '수정하기',
                    icon: Icons.create_rounded,
                    color: appMainColor,
                    onTap: updateTap),
              ],
              if (!isMe) ...[
                _bottomWidgetForm(
                    title: '신고하기',
                    icon: Icons.error_outline_rounded,
                    color: appSubColor,
                    onTap: () {
                      Navigator.of(context).pop();
                      feedBlockedWidget(
                          context: context,
                          user: context.read<AuthProvider>().user!,
                          blockedDocKey: docKey);
                    }),
              ],
            ],
          ),
        ],
      ),
    ),
  );
}

Padding _bottomWidgetForm({
  required String title,
  required IconData icon,
  required Color color,
  required Function() onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
    child: Column(
      children: [
        Shimmer.fromColors(
          baseColor: color,
          highlightColor: const Color.fromRGBO(215, 215, 215, 1),
          child: Container(
            width: size.width * 0.15,
            height: size.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: color, width: 3),
            ),
            child: IconButton(
              onPressed: onTap,
              icon: Icon(icon, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(title,
            style: theme.textTheme.bodyText2!.copyWith(
                color: const Color.fromRGBO(215, 215, 215, 1),
                fontSize: 12,
                fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
