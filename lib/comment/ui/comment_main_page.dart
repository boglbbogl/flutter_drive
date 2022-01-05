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
import 'package:flutter_drive/comment/ui/comment_setting_widget.dart';
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
              value: false, commentDocKey: "", isMoreCount: 0);
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
                        // reverse: true,
                        itemCount: provider.commentList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onLongPress: () {
                                        context
                                            .read<CommentProvider>()
                                            .showLongPressed(
                                                commentMoreDcoKey: provider
                                                    .commentList[index].docKey,
                                                value: true,
                                                user: provider.allUserProfile
                                                    .where((e) => e.userKey
                                                        .contains(provider
                                                            .commentList[index]
                                                            .userKey))
                                                    .firstOrNull!);
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          userCircleImageWidget(
                                              context: context,
                                              userKey: provider
                                                  .commentList[index].userKey,
                                              imageUrl: provider.allUserProfile
                                                      .where((e) =>
                                                          e.userKey ==
                                                          provider
                                                              .commentList[
                                                                  index]
                                                              .userKey)
                                                      .firstOrNull!
                                                      .isSocialImage
                                                  ? provider.allUserProfile
                                                      .where((e) =>
                                                          e.userKey ==
                                                          provider
                                                              .commentList[
                                                                  index]
                                                              .userKey)
                                                      .firstOrNull!
                                                      .socialProfileUrl
                                                  : provider.allUserProfile
                                                      .where((e) =>
                                                          e.userKey ==
                                                          provider
                                                              .commentList[
                                                                  index]
                                                              .userKey)
                                                      .firstOrNull!
                                                      .localProfileUrl),
                                          const SizedBox(width: 12),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.7,
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "${provider.allUserProfile.where((e) => e.userKey == provider.commentList[index].userKey).firstOrNull!.nickName}  ",
                                                      style: theme
                                                          .textTheme.bodyText2!
                                                          .copyWith(
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  195,
                                                                  195,
                                                                  195,
                                                                  1),
                                                              fontSize: 8)),
                                                  TextSpan(
                                                      text: provider
                                                          .commentList[index]
                                                          .comment,
                                                      style: theme
                                                          .textTheme.bodyText2!
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 9)),
                                                ])),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, top: 5),
                                                    child: Text(
                                                      appDateTime(
                                                          dateTime: provider
                                                              .commentList[
                                                                  index]
                                                              .createdAt),
                                                      style: theme
                                                          .textTheme.bodyText2!
                                                          .copyWith(
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  155,
                                                                  155,
                                                                  155,
                                                                  1),
                                                              fontSize: 8),
                                                    ),
                                                  ),
                                                  Container(),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (context
                                        .watch<AuthProvider>()
                                        .user!
                                        .userKey
                                        .contains(provider
                                            .commentList[index].userKey)) ...[
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          onPressed: () {
                                            provider.showCommentSettingBottom(
                                                value: true,
                                                commentDocKey: provider
                                                    .commentList[index].docKey,
                                                isMoreCount: provider
                                                    .commentList[index]
                                                    .isMoreCount);
                                          },
                                          icon: const Icon(
                                              Icons.more_horiz_rounded,
                                              color: Colors.white,
                                              size: 18)),
                                    ],
                                  ],
                                ),
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
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8,
                                                              bottom: 8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            10),
                                                                child: Container(
                                                                    width: size
                                                                            .width *
                                                                        0.03,
                                                                    height: 0.5,
                                                                    color: const Color
                                                                            .fromRGBO(
                                                                        71,
                                                                        71,
                                                                        71,
                                                                        1)),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.03,
                                                              ),
                                                              userCircleImageWidget(
                                                                radius: 10,
                                                                context:
                                                                    context,
                                                                userKey: provider
                                                                    .moreCommentList[
                                                                        moreIndex]
                                                                    .userKey,
                                                                imageUrl: provider
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
                                                                            provider.moreCommentList[moreIndex].userKey)
                                                                        .firstOrNull!
                                                                        .localProfileUrl,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.03,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width:
                                                                        size.width *
                                                                            0.7,
                                                                    child: RichText(
                                                                        text: TextSpan(children: [
                                                                      TextSpan(
                                                                        text: provider
                                                                            .allUserProfile
                                                                            .where((e) =>
                                                                                e.userKey ==
                                                                                provider.moreCommentList[moreIndex].userKey)
                                                                            .firstOrNull!
                                                                            .nickName,
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodyText2!
                                                                            .copyWith(
                                                                                color: const Color.fromRGBO(195, 195, 195, 1),
                                                                                fontSize: 7),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            " @${provider.allUserProfile.where((e) => e.userKey == provider.moreCommentList[moreIndex].commentUserKey).firstOrNull!.nickName}   ",
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodyText2!
                                                                            .copyWith(
                                                                          color:
                                                                              appMainColor,
                                                                          fontSize:
                                                                              8,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: provider
                                                                            .moreCommentList[moreIndex]
                                                                            .comment,
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodyText2!
                                                                            .copyWith(
                                                                                color: Colors.white,
                                                                                fontSize: 9),
                                                                      )
                                                                    ])),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          8),
                                                                  Text(
                                                                      appDateTime(
                                                                        dateTime: provider
                                                                            .moreCommentList[moreIndex]
                                                                            .createdAt,
                                                                      ),
                                                                      style: theme.textTheme.bodyText2!.copyWith(
                                                                          color: const Color.fromRGBO(
                                                                              195,
                                                                              195,
                                                                              195,
                                                                              1),
                                                                          fontSize:
                                                                              8)),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          if (context
                                                              .watch<
                                                                  AuthProvider>()
                                                              .user!
                                                              .userKey
                                                              .contains(provider
                                                                  .moreCommentList[
                                                                      moreIndex]
                                                                  .userKey)) ...[
                                                            IconButton(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                constraints:
                                                                    const BoxConstraints(),
                                                                onPressed: () {
                                                                  provider.showCommentSettingBottom(
                                                                      value:
                                                                          true,
                                                                      commentDocKey: provider
                                                                          .commentList[
                                                                              index]
                                                                          .docKey,
                                                                      isMoreCount: provider
                                                                          .commentList[
                                                                              index]
                                                                          .isMoreCount);
                                                                },
                                                                icon: const Icon(
                                                                    Icons
                                                                        .more_horiz_rounded,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 18)),
                                                          ],
                                                        ],
                                                      ),
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
                  Stack(
                    children: [
                      if (provider.isLongPressed) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Container(
                                width: size.width,
                                height: size.height * 0.03,
                                color: const Color.fromRGBO(115, 115, 115, 1),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, top: 5),
                                  child: Text(
                                    "@${provider.moreCommentUser!.nickName}",
                                    style: theme.textTheme.bodyText2!.copyWith(
                                        color: const Color.fromRGBO(
                                            215, 215, 215, 1),
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
                                  padding: const EdgeInsets.only(left: 12),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      provider.getMoreComentText(value: value);
                                    },
                                    onFieldSubmitted: (value) {
                                      provider.createMoreComment(
                                        courseDocKey: docKey,
                                        // commentDocKey: provider.commentList
                                        //     .where((e) => provider
                                        //         .moreCommentUser!.userKey
                                        //         .contains(e.userKey))
                                        //     .map((e) => e.docKey)
                                        //     .firstOrNull!,
                                        userKey: context
                                            .read<AuthProvider>()
                                            .user!
                                            .userKey,
                                      );
                                      provider.showLongPressed(
                                          value: false,
                                          commentMoreDcoKey: "",
                                          user: UserModel.empty());
                                    },
                                    style: theme.textTheme.bodyText2!.copyWith(
                                        color: Colors.white, fontSize: 11),
                                    decoration: InputDecoration(
                                        hintText:
                                            '${provider.moreCommentUser!.nickName} 님께 댓글을 남겨 주세요',
                                        hintStyle: theme.textTheme.bodyText2!
                                            .copyWith(
                                                fontSize: 11,
                                                color: const Color.fromRGBO(
                                                    175, 175, 175, 1)),
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (!provider.isLongPressed) ...[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 10),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.06,
                            color: const Color.fromRGBO(91, 91, 91, 1),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Stack(
                                children: [
                                  TextFormField(
                                    controller: _controller,
                                    style: theme.textTheme.bodyText2!.copyWith(
                                        color: Colors.white, fontSize: 11),
                                    onFieldSubmitted: (value) {
                                      if (value.isEmpty) {
                                      } else {
                                        context
                                            .read<CommentProvider>()
                                            .createComment(
                                              docKey: docKey,
                                              userModel: context
                                                  .read<AuthProvider>()
                                                  .user!,
                                            );
                                        _controller.clear();
                                      }
                                    },
                                    onChanged: (value) => context
                                        .read<CommentProvider>()
                                        .getCommentText(value: value),
                                    decoration: InputDecoration(
                                        hintText: '댓글을 입력해 주세요',
                                        hintStyle: theme.textTheme.bodyText2!
                                            .copyWith(
                                                fontSize: 11,
                                                color: const Color.fromRGBO(
                                                    175, 175, 175, 1)),
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
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
