import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_indicator.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/comment/provider/comment_provider.dart';
import 'package:flutter_drive/comment/ui/widgets/comment_field_widget.dart';
import 'package:flutter_drive/comment/ui/widgets/comment_list_widget.dart';
import 'package:flutter_drive/comment/ui/widgets/comment_setting_widget.dart';
import 'package:flutter_drive/comment/ui/widgets/more_comment_field_widget.dart';
import 'package:flutter_drive/comment/ui/widgets/more_comment_list_widget.dart';
import 'package:provider/provider.dart';

class CommentMainPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final String docKey;
  final String userKey;
  final String feedExplanation;
  CommentMainPage({
    Key? key,
    required this.docKey,
    required this.userKey,
    required this.feedExplanation,
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
                  ...provider.allUserProfile
                      .where((e) => userKey.contains(e.userKey))
                      .map((e) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 12),
                              userCircleImageWidget(
                                  imageUrl: e.isSocialImage
                                      ? e.socialProfileUrl
                                      : e.localProfileUrl,
                                  context: context,
                                  userKey: userKey,
                                  isProfileUpdate: false),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.7,
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "${e.nickName}    ",
                                          style: theme.textTheme.bodyText2!
                                              .copyWith(
                                                  color: const Color.fromRGBO(
                                                      195, 195, 195, 1),
                                                  fontSize: 9)),
                                      TextSpan(
                                          text: feedExplanation,
                                          style: theme.textTheme.bodyText2!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 11)),
                                    ])),
                                  ),
                                ],
                              ),
                            ],
                          )),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      width: size.width,
                      height: 1,
                      color: const Color.fromRGBO(71, 71, 71, 1),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                        docKey: docKey,
                        userKey: userKey),
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
