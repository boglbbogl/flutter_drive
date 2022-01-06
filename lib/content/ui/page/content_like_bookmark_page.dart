import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:provider/provider.dart';

class ContentLikeBookmarkPage extends StatelessWidget {
  final String userId;
  final bool isLike;
  final List<String> likeAndBookMarkUserKey;
  const ContentLikeBookmarkPage({
    Key? key,
    required this.userId,
    required this.isLike,
    required this.likeAndBookMarkUserKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userId,
          style: theme.textTheme.bodyText2!
              .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.clear_rounded))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 12, top: 8),
            child: Row(
              children: [
                Icon(
                  isLike ? Icons.favorite : Icons.bookmark_add_rounded,
                  color: isLike ? Colors.red : Colors.green,
                  size: 22,
                ),
                const SizedBox(width: 10),
                Text(
                  isLike
                      ? "좋아요 ${likeAndBookMarkUserKey.length}개"
                      : "북마크 ${likeAndBookMarkUserKey.length}개",
                  style: theme.textTheme.bodyText2!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView(
              children: [
                ...context
                    .read<AuthProvider>()
                    .allUserProfile
                    .where((element) =>
                        likeAndBookMarkUserKey.contains(element.userKey))
                    .map((user) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 18),
                          child: Row(
                            children: [
                              userCircleImageWidget(
                                  isProfileUpdate: false,
                                  context: context,
                                  userKey: user.userKey,
                                  imageUrl: user.isSocialImage
                                      ? user.socialProfileUrl
                                      : user.localProfileUrl),
                              const SizedBox(width: 15),
                              Text(user.nickName),
                            ],
                          ),
                        )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
