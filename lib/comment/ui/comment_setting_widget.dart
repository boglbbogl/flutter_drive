import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/comment/provider/comment_provider.dart';
import 'package:provider/provider.dart';

Positioned commentSettingWidget({
  required String docKey,
  required BuildContext context,
}) {
  return Positioned(
    bottom: 0,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      width: size.width,
      height: size.height * 0.2,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Color.fromRGBO(91, 91, 91, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textButtonItem(
              title: '댓글 지우기',
              titleColor: appSubColor,
              onTap: () {
                context.read<CommentProvider>()
                  ..removeComment(docKey: docKey)
                  ..showCommentSettingBottom(
                      value: false, commentDocKey: "", isMoreCount: 0);
              }),
          const SizedBox(height: 10),
          textButtonItem(
              title: '닫기',
              titleColor: Colors.white,
              onTap: () {
                context.read<CommentProvider>().showCommentSettingBottom(
                    value: false, commentDocKey: "", isMoreCount: 0);
              })
        ],
      ),
    ),
  );
}

Container textButtonItem({
  required String title,
  required Color titleColor,
  required Function() onTap,
}) {
  return Container(
    width: size.width * 0.9,
    height: size.height * 0.06,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromRGBO(71, 71, 71, 1)),
    child: TextButton(
      onPressed: onTap,
      child: Text(title,
          style: theme.textTheme.bodyText2!.copyWith(
            color: titleColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          )),
    ),
  );
}
