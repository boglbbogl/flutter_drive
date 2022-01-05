import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_date_time.dart';
import 'package:flutter_drive/_constant/app_indicator.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/comment/provider/comment_provider.dart';
import 'package:flutter_drive/comment/ui/comment_list_widget.dart';
import 'package:flutter_drive/comment/ui/comment_setting_widget.dart';
import 'package:flutter_drive/comment/ui/comment_field_widget.dart';
import 'package:flutter_drive/comment/ui/more_comment_field_widget.dart';
import 'package:flutter_drive/comment/ui/more_comment_list_widget.dart';
import 'package:provider/provider.dart';

class CommentMainPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final String docKey;
  CommentMainPage({
    Key? key,
    required this.docKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CommentProvider>(builder: (context, provider, child) {
      if (provider.allUserProfile.isEmpty) {
        return const AppIndicator();
      }
      return GestureDetector(
        onTap: () {
          provider.showCommentSettingBottom(
              isMoreComment: false,
              value: false,
              commentDocKey: "",
              isMoreCount: 0,
              removeMoreCommentDocKey: "");
          provider.showLongPressed(
              user: UserModel.empty(), value: false, commentMoreDcoKey: "");
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '댓글',
              style: theme.textTheme.bodyText2!.copyWith(fontSize: 14),
            ),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                        itemCount: provider.commentList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                commentListWidget(
                                    context: context,
                                    commentMoreDocKey:
                                        provider.commentList[index].docKey,
                                    userModel: provider.allUserProfile
                                        .where((e) => e.userKey.contains(
                                            provider
                                                .commentList[index].userKey))
                                        .firstOrNull!,
                                    profileUserKey:
                                        provider.commentList[index].userKey,
                                    profileUrl: provider.allUserProfile
                                            .where((e) =>
                                                e.userKey ==
                                                provider
                                                    .commentList[index].userKey)
                                            .firstOrNull!
                                            .isSocialImage
                                        ? provider.allUserProfile
                                            .where((e) =>
                                                e.userKey ==
                                                provider
                                                    .commentList[index].userKey)
                                            .firstOrNull!
                                            .socialProfileUrl
                                        : provider.allUserProfile
                                            .where((e) =>
                                                e.userKey ==
                                                provider
                                                    .commentList[index].userKey)
                                            .firstOrNull!
                                            .localProfileUrl,
                                    profileNickName: provider.allUserProfile
                                        .where((e) =>
                                            e.userKey ==
                                            provider.commentList[index].userKey)
                                        .firstOrNull!
                                        .nickName,
                                    comment: provider.commentList[index].comment,
                                    createdAt: provider.commentList[index].createdAt,
                                    isMe: context.watch<AuthProvider>().user!.userKey.contains(provider.commentList[index].userKey),
                                    commentDocKey: provider.commentList[index].docKey,
                                    isMoreCount: provider.commentList[index].isMoreCount),

                                //more Comment
                                if (provider.commentList[index].isMoreCount !=
                                    0) ...[
                                  if (provider.showMoreCommentIndex == index)
                                    Column(
                                      children: [
                                        const SizedBox(height: 12),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(width: 4),
                                            Flexible(
                                              child: ListView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: provider
                                                      .moreCommentList.length,
                                                  itemBuilder:
                                                      (context, moreIndex) {
                                                    return moreCommentListWidget(
                                                      comment: provider
                                                          .moreCommentList[
                                                              moreIndex]
                                                          .comment,
                                                      createdAt: provider
                                                          .moreCommentList[
                                                              moreIndex]
                                                          .createdAt,
                                                      commentUserNickName: provider
                                                          .allUserProfile
                                                          .where((e) =>
                                                              e.userKey ==
                                                              provider
                                                                  .moreCommentList[
                                                                      moreIndex]
                                                                  .commentUserKey)
                                                          .firstOrNull!
                                                          .nickName,
                                                      context: context,
                                                      profileUserKey: provider
                                                          .moreCommentList[
                                                              moreIndex]
                                                          .userKey,
                                                      profileUserUrl: provider
                                                              .allUserProfile
                                                              .where((e) =>
                                                                  e.userKey ==
                                                                  provider
                                                                      .moreCommentList[
                                                                          moreIndex]
                                                                      .userKey)
                                                              .firstOrNull!
                                                              .isSocialImage
                                                          ? provider
                                                              .allUserProfile
                                                              .where((e) =>
                                                                  e.userKey ==
                                                                  provider
                                                                      .moreCommentList[
                                                                          moreIndex]
                                                                      .userKey)
                                                              .firstOrNull!
                                                              .socialProfileUrl
                                                          : provider
                                                              .allUserProfile
                                                              .where((e) =>
                                                                  e.userKey ==
                                                                  provider
                                                                      .moreCommentList[
                                                                          moreIndex]
                                                                      .userKey)
                                                              .firstOrNull!
                                                              .localProfileUrl,
                                                      profileUserNickName: provider
                                                          .allUserProfile
                                                          .where((e) =>
                                                              e.userKey ==
                                                              provider
                                                                  .moreCommentList[
                                                                      moreIndex]
                                                                  .userKey)
                                                          .firstOrNull!
                                                          .nickName,
                                                      isMyMoreComment: context
                                                          .watch<AuthProvider>()
                                                          .user!
                                                          .userKey
                                                          .contains(provider
                                                              .moreCommentList[
                                                                  moreIndex]
                                                              .userKey),
                                                      removeMoreCommentDocKey:
                                                          provider
                                                              .moreCommentList[
                                                                  moreIndex]
                                                              .docKey,
                                                      isMoreCount: provider
                                                          .commentList[index]
                                                          .isMoreCount,
                                                      commentDocKey: provider
                                                          .commentList[index]
                                                          .docKey,
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  else
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 60, top: 10),
                                      child: InkWell(
                                        onTap: () {
                                          provider.showMoreCommentItem(
                                              index: index);
                                          provider.getMoreComment(
                                              courseDocKey: docKey,
                                              commentDocKey: provider
                                                  .commentList[index].docKey);
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              width: size.width * 0.1,
                                              height: 0.5,
                                              color: const Color.fromRGBO(
                                                  155, 155, 155, 1),
                                            ),
                                            const SizedBox(width: 30),
                                            Text(
                                              '답글보기 (${provider.commentList[index].isMoreCount})',
                                              style: theme.textTheme.bodyText2!
                                                  .copyWith(
                                                      color:
                                                          const Color.fromRGBO(
                                                              175, 175, 175, 1),
                                                      fontSize: 8),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                ],
                              ],
                            ),
                          );
                        }),
                  ),
                  if (provider.isLongPressed) ...[
                    moreCommentFieldWidget(
                      context: context,
                      docKey: docKey,
                      userNickName: provider.moreCommentUser!.nickName,
                    ),
                  ],
                  if (!provider.isLongPressed) ...[
                    commentFieldWidet(
                        controller: _controller,
                        context: context,
                        docKey: docKey),
                  ],
                ],
              ),
              if (provider.isShowBottom) ...[
                commentSettingWidget(
                  docKey: docKey,
                  context: context,
                )
              ],
            ],
          ),
        ),
      );
    });
  }
}
