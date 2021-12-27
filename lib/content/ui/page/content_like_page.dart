import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:provider/provider.dart';

class ContentLikePage extends StatelessWidget {
  final String userId;
  final List<String> likeUserKey;
  const ContentLikePage({
    Key? key,
    required this.userId,
    required this.likeUserKey,
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
        children: [
          const SizedBox(height: 20),
          Flexible(
            child: ListView(
              children: [
                ...context
                    .read<AuthProvider>()
                    .allUserProfile
                    .where((element) => likeUserKey.contains(element.userKey))
                    .map((user) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 18),
                          child: Row(
                            children: [
                              userCircleImageWidget(
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
