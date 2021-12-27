import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_indicator.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/comment/provider/comment_provider.dart';
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
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '댓글',
            style: theme.textTheme.bodyText2!.copyWith(fontSize: 14),
          ),
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: provider.commentList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          userCircleImageWidget(
                              imageUrl: provider.allUserProfile
                                      .where((e) =>
                                          e.userKey ==
                                          provider.commentList[index].userKey)
                                      .firstOrNull!
                                      .isSocialImage
                                  ? provider.allUserProfile
                                      .where((e) =>
                                          e.userKey ==
                                          provider.commentList[index].userKey)
                                      .firstOrNull!
                                      .socialProfileUrl
                                  : provider.allUserProfile
                                      .where((e) =>
                                          e.userKey ==
                                          provider.commentList[index].userKey)
                                      .firstOrNull!
                                      .localProfileUrl),
                          const SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width * 0.85,
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text:
                                          "${provider.allUserProfile.where((e) => e.userKey == provider.commentList[index].userKey).firstOrNull!.nickName}  ",
                                      style: theme.textTheme.bodyText2!
                                          .copyWith(
                                              color: const Color.fromRGBO(
                                                  195, 195, 195, 1),
                                              fontSize: 8)),
                                  TextSpan(
                                      text: provider.commentList[index].comment,
                                      style: theme.textTheme.bodyText2!
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 9)),
                                ])),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Container(
                width: size.width,
                height: size.height * 0.06,
                color: const Color.fromRGBO(91, 91, 91, 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: _controller,
                    style: theme.textTheme.bodyText2!
                        .copyWith(color: Colors.white, fontSize: 11),
                    onFieldSubmitted: (value) {
                      if (value.isEmpty) {
                      } else {
                        context.read<CommentProvider>().createComment(
                              docKey: docKey,
                              userModel: context.read<AuthProvider>().user!,
                            );
                        _controller.clear();
                      }
                    },
                    onChanged: (value) => context
                        .read<CommentProvider>()
                        .getCommentText(value: value),
                    decoration: InputDecoration(
                        hintText: '댓글을 입력해 주세요',
                        hintStyle: theme.textTheme.bodyText2!.copyWith(
                            fontSize: 11,
                            color: const Color.fromRGBO(175, 175, 175, 1)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
