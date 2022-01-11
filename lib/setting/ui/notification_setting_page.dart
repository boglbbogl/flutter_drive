import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/notification/provider/notification_provider.dart';
import 'package:provider/provider.dart';

class NotificationSettingPage extends StatelessWidget {
  const NotificationSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const SizedBox(width: 8),
          TextButton(
              onPressed: () {
                context.read<NotificationProvider>().userNotificationUpdate(
                      userKey: context.read<AuthProvider>().user!.userKey,
                      context: context,
                    );
              },
              child: Text(
                '저장하기',
                style: theme.textTheme.bodyText2!
                    .copyWith(color: appMainColor, fontWeight: FontWeight.bold),
              )),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 12),
            _switch(
              title: '나를 좋아한 사용자',
              value: context.watch<NotificationProvider>().isUserLike!,
              onChanged: (v) {
                context.read<NotificationProvider>().isUserLikeNoti(value: v);
              },
            ),
            _switch(
                title: '내 피드 댓글',
                value: context.watch<NotificationProvider>().isFeedComment!,
                onChanged: (v) => context
                    .read<NotificationProvider>()
                    .isFeedCommentNoti(value: v)),
            _switch(
                title: '내가 작성한 댓글 답변',
                value: context.watch<NotificationProvider>().isMoreComment!,
                onChanged: (v) => context
                    .read<NotificationProvider>()
                    .isMoreCommentNoti(value: v)),
            _switch(
                title: '내 피드 좋아요',
                value: context.watch<NotificationProvider>().isFeedLike!,
                onChanged: (v) => context
                    .read<NotificationProvider>()
                    .isFeedLikeNoti(value: v)),
            _switch(
                title: '내 피드 북마크',
                value: context.watch<NotificationProvider>().isFeedBookmark!,
                onChanged: (v) => context
                    .read<NotificationProvider>()
                    .isFeedBookmarkNoti(value: v)),
          ],
        ),
      ),
    );
  }

  Padding _switch(
      {required String title,
      required bool value,
      required Function(bool) onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyText2!
                .copyWith(color: Colors.white, fontSize: 14),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: appMainColor,
            activeTrackColor: appMainColor.withAlpha(150),
            inactiveThumbColor: const Color.fromRGBO(115, 115, 115, 1),
            inactiveTrackColor: const Color.fromRGBO(71, 71, 71, 1),
          ),
        ],
      ),
    );
  }
}
