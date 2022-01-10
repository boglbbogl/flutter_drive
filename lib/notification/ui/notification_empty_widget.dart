import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

Center notificationEmptyWidget() {
  return Center(
    child: Column(
      children: [
        const SizedBox(height: 8),
        const Icon(
          Icons.notifications_active_outlined,
          color: Color.fromRGBO(175, 175, 175, 1),
          size: 32,
        ),
        const SizedBox(height: 20),
        Text(
          '알림이 없습니다',
          style: theme.textTheme.bodyText2!.copyWith(
            color: const Color.fromRGBO(175, 175, 175, 1),
            fontSize: 13,
          ),
        ),
      ],
    ),
  );
}
