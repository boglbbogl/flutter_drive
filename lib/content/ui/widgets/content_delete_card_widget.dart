import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

Padding contentDeleteCardWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Opacity(
      opacity: 0.7,
      child: Container(
        width: size.width,
        height: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: darkThemeCardColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delete_outline_rounded,
              color: appMainColor,
              size: 40,
            ),
            const SizedBox(height: 12),
            Text(
              '삭제된 게시물 입니다',
              style: theme.textTheme.bodyText2!.copyWith(
                  color: appMainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    ),
  );
}
