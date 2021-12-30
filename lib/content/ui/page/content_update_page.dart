import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/content/provider/content_provider.dart';
import 'package:flutter_drive/content/ui/card/content_image_card.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:provider/provider.dart';

class ContentUpdatePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final CourseModel course;
  final bool isMe;
  ContentUpdatePage({
    Key? key,
    required this.course,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.text = course.explanation;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.7,
          child: Row(
            children: [
              Text(
                course.spot.firstOrNull!.placeName.length > 10
                    ? "${course.spot.firstOrNull!.placeName.substring(0, 10)}..."
                    : course.spot.firstOrNull!.placeName,
                style: theme.textTheme.bodyText2!.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 2,
                  width: size.width * 0.02,
                  color: appMainColor,
                ),
              ),
              Text(
                course.spot.lastOrNull!.placeName.length > 10
                    ? "${course.spot.lastOrNull!.placeName.substring(0, 10)}..."
                    : course.spot.lastOrNull!.placeName,
                style: theme.textTheme.bodyText2!.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          if (context.read<ContentProvider>().isLoading)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircularProgressIndicator(
                color: appSubColor,
                strokeWidth: 3,
              ),
            )
          else
            TextButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  context
                      .read<ContentProvider>()
                      .contentFeedUpdate(isMe: isMe, context: context);
                },
                child: Text(
                  '수정하기',
                  style: theme.textTheme.bodyText2!.copyWith(
                    color: appSubColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          const SizedBox(width: 5),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.clear),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.7,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ...course.spot.map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            children: [
                              SizedBox(width: size.width * 0.15),
                              Icon(
                                Icons.circle,
                                color: appMainColor,
                                size: 7,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                e.placeName,
                                style: theme.textTheme.bodyText2!.copyWith(
                                    color:
                                        const Color.fromRGBO(215, 215, 215, 1),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (context.read<ContentProvider>().isLoading)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(),
                            Padding(
                              padding: const EdgeInsets.only(right: 1),
                              child: SizedBox(
                                width: 14,
                                height: 14,
                                child: CircularProgressIndicator(
                                  color: appMainColor,
                                  strokeWidth: 3,
                                ),
                              ),
                            ),
                          ],
                        )
                      else
                        InkWell(
                          onTap: () {
                            context.read<ContentProvider>().contentFeedDelete(
                                isMe: isMe,
                                context: context,
                                userKey:
                                    context.read<AuthProvider>().user!.userKey);
                          },
                          child: Text(
                            '삭제하기',
                            textAlign: TextAlign.end,
                            style: theme.textTheme.bodyText2!.copyWith(
                                color: appMainColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      const SizedBox(height: 15),
                      _userStateTextForm(
                          title: course.createdAt.toString().substring(0, 10)),
                      const SizedBox(height: 8),
                      _userStateTextForm(
                          title: '좋아요 ${course.likeUserKey.length} 개'),
                      _userStateTextForm(title: '댓글 ${course.commentCount} 개'),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromRGBO(51, 51, 51, 1)),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 4),
                child: TextFormField(
                  onChanged: (value) {
                    context
                        .read<ContentProvider>()
                        .updateExplanationText(value: value);
                  },
                  controller: _controller,
                  decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  maxLines: 7,
                  // maxLength: 4999,
                  style: theme.textTheme.bodyText2!
                      .copyWith(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 8, bottom: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    color: appMainColor,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '내용 수정만 가능합니다',
                    style: theme.textTheme.bodyText2!.copyWith(
                      color: appMainColor,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ContentImageCard(
                imageUrl: course.imageUrl,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Text _userStateTextForm({
    required String title,
  }) {
    return Text(
      title,
      style: theme.textTheme.bodyText2!
          .copyWith(color: const Color.fromRGBO(215, 215, 215, 1), fontSize: 9),
    );
  }
}
