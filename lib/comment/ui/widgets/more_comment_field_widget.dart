import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/comment/provider/comment_provider.dart';
import 'package:provider/provider.dart';

Padding moreCommentFieldWidget({
  required BuildContext context,
  required String docKey,
  required String userNickName,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.03,
          color: const Color.fromRGBO(115, 115, 115, 1),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 5),
            child: Text(
              "@$userNickName",
              style: theme.textTheme.bodyText2!.copyWith(
                  color: const Color.fromRGBO(215, 215, 215, 1),
                  fontSize: 11,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          width: size.width,
          height: size.height * 0.06,
          color: const Color.fromRGBO(115, 115, 115, 1),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: TextFormField(
              onChanged: (value) {
                context.read<CommentProvider>().getMoreComentText(value: value);
              },
              onFieldSubmitted: (value) {
                context.read<CommentProvider>().createMoreComment(
                      courseDocKey: docKey,
                      userKey: context.read<AuthProvider>().user!.userKey,
                    );
                context.read<CommentProvider>().showLongPressed(
                    value: false,
                    commentMoreDcoKey: "",
                    user: UserModel.empty());
              },
              style: theme.textTheme.bodyText2!
                  .copyWith(color: Colors.white, fontSize: 11),
              decoration: InputDecoration(
                  hintText: '$userNickName 님께 댓글을 남겨 주세요',
                  hintStyle: theme.textTheme.bodyText2!.copyWith(
                      fontSize: 11,
                      color: const Color.fromRGBO(175, 175, 175, 1)),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none),
            ),
          ),
        ),
      ],
    ),
  );
}
