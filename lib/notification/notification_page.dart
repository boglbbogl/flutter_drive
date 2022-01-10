import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_date_time.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/notification/notification_provider.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.clear)),
              const SizedBox(width: 8),
            ],
          ),
          body: Column(
            children: [
              if (provider.userNotiList.isNotEmpty) ...[
                ...provider.userNotiList.map((e) => Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  // page
                                },
                                child: Container(
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color:
                                          const Color.fromRGBO(51, 51, 51, 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 12),
                                    child: Row(
                                      children: [
                                        if (e.noti == 1) ...[
                                          _iconForm(
                                              icon: CustomIcon.heart,
                                              color: Colors.red),
                                        ],
                                        if (e.noti == 2) ...[
                                          _iconForm(
                                              icon: CustomIcon.chat,
                                              color: Colors.white),
                                        ],
                                        if (e.noti == 3) ...[
                                          _iconForm(
                                              icon: CustomIcon.chat,
                                              color: Colors.white),
                                        ],
                                        const SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                ...context
                                                    .watch<AuthProvider>()
                                                    .allUserProfile
                                                    .where((allUser) =>
                                                        e.notiUserKey.contains(
                                                            allUser.userKey))
                                                    .map((user) => InkWell(
                                                          onTap: () {
                                                            //user page
                                                          },
                                                          child: Text(
                                                            "@${user.nickName}",
                                                            style: theme
                                                                .textTheme
                                                                .bodyText2!
                                                                .copyWith(
                                                                    color:
                                                                        appMainColor,
                                                                    fontSize:
                                                                        11),
                                                          ),
                                                        )),
                                                if (e.noti == 1) ...[
                                                  _textForm(title: '님을 좋아합니다'),
                                                ],
                                                if (e.noti == 2) ...[
                                                  _textForm(
                                                      title:
                                                          '님의 컨텐츠에 댓글을 남겼습니다'),
                                                ],
                                                if (e.noti == 3) ...[
                                                  _textForm(
                                                      title:
                                                          '님의 댓글에 답변을 남겼습니다'),
                                                ],
                                              ],
                                            ),
                                            if (e.comment.isNotEmpty) ...[
                                              const SizedBox(height: 8),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Text(
                                                  e.comment.length > 25
                                                      ? '"${e.comment.substring(0, 25)}"'
                                                      : '"${e.comment}"',
                                                  style: theme
                                                      .textTheme.bodyText2!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 11),
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 5,
                                  right: 10,
                                  child: Text(
                                    appDateTime(
                                      dateTime: e.createdAt,
                                    ),
                                    style: theme.textTheme.bodyText2!.copyWith(
                                        fontSize: 8,
                                        color: const Color.fromRGBO(
                                            155, 155, 155, 1)),
                                  )),
                            ],
                          ),
                        ),
                        Positioned(
                            top: -8,
                            right: -3,
                            child: IconButton(
                                onPressed: () {
                                  provider.removeUserNotification(
                                      notificationModel: e);
                                },
                                icon: const Icon(
                                  Icons.highlight_remove_sharp,
                                  size: 15,
                                  color: Color.fromRGBO(215, 215, 215, 1),
                                ))),
                      ],
                    )),
              ],
              if (provider.userNotiList.isEmpty) ...[
                Container(
                  child: Column(
                    children: [
                      Icon(Icons.notifications_active_outlined),
                      Text('알림이 없습니다'),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Icon _iconForm({
    required IconData icon,
    required Color color,
  }) {
    return Icon(
      icon,
      color: color,
      size: 18,
    );
  }

  Text _textForm({
    required String title,
  }) {
    return Text(
      title,
      style: theme.textTheme.bodyText2!.copyWith(
          color: const Color.fromRGBO(215, 215, 215, 1), fontSize: 11),
    );
  }
}
