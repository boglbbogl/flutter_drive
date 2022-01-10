import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/notification/provider/notification_provider.dart';
import 'package:provider/provider.dart';

SizedBox notificationDeleteWidget({
  required BuildContext context,
}) {
  return SizedBox(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () => context
                  .read<NotificationProvider>()
                  .allRemoveNotification(
                      notiUserKey: context.read<AuthProvider>().user!.userKey),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(71, 71, 71, 1)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.highlight_remove_sharp,
                        size: 15,
                        color: Color.fromRGBO(175, 175, 175, 1),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '모두지우기',
                        style: theme.textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(175, 175, 175, 1),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
}
