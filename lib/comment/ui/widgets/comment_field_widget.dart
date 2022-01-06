import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/comment/provider/comment_provider.dart';
import 'package:provider/provider.dart';

Padding commentFieldWidet({
  required TextEditingController controller,
  required BuildContext context,
  required String docKey,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10, top: 10),
    child: Container(
      width: size.width,
      height: size.height * 0.06,
      color: const Color.fromRGBO(91, 91, 91, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Stack(
          children: [
            TextFormField(
              controller: controller,
              style: theme.textTheme.bodyText2!
                  .copyWith(color: Colors.white, fontSize: 11),
              onFieldSubmitted: (value) {
                if (value.isEmpty) {
                } else {
                  context.read<CommentProvider>().createComment(
                        docKey: docKey,
                        userModel: context.read<AuthProvider>().user!,
                      );
                  controller.clear();
                }
              },
              onChanged: (value) =>
                  context.read<CommentProvider>().getCommentText(value: value),
              decoration: InputDecoration(
                  hintText: '댓글을 입력해 주세요',
                  hintStyle: theme.textTheme.bodyText2!.copyWith(
                      fontSize: 11,
                      color: const Color.fromRGBO(175, 175, 175, 1)),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none),
            ),
          ],
        ),
      ),
    ),
  );
}
