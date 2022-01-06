import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:provider/provider.dart';

class FeedUserLikesPage extends StatelessWidget {
  final String userKey;
  final String userNickName;
  const FeedUserLikesPage({
    Key? key,
    required this.userKey,
    required this.userNickName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              userNickName,
              style: theme.textTheme.bodyText2!
                  .copyWith(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          body: Stack(
            children: [
              ...context
                  .watch<AuthProvider>()
                  .allUserActivity
                  .where((e) => userKey.contains(e.userKey))
                  .map(
                    (activity) => Column(
                      children: [
                        TabBar(
                          indicatorColor: appMainColor,
                          labelColor: appMainColor,
                          unselectedLabelColor:
                              const Color.fromRGBO(175, 175, 175, 1),
                          tabs: const [
                            Tab(
                              text: '내가 좋아한 유저',
                            ),
                            Tab(
                              text: '나를 좋아한 유저',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Tab(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: ListView(
                                    children: [
                                      const SizedBox(height: 20),
                                      ...context
                                          .watch<AuthProvider>()
                                          .allUserProfile
                                          .where((e) => activity.likesUserKey
                                              .contains(e.userKey))
                                          .map((user) => _userProfileListItem(
                                              isLikeUser: context
                                                  .read<AuthProvider>()
                                                  .allUserActivity
                                                  .where((e) => context
                                                      .read<AuthProvider>()
                                                      .user!
                                                      .userKey
                                                      .contains(e.userKey))
                                                  .map((e) => e.likesUserKey
                                                      .contains(user.userKey))
                                                  .toList()[0],
                                              user: user,
                                              context: context)),
                                    ],
                                  ),
                                ),
                              ),
                              Tab(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: ListView(
                                    children: [
                                      const SizedBox(height: 20),
                                      ...context
                                          .watch<AuthProvider>()
                                          .allUserProfile
                                          .where((e) => activity.likeMeUserKey
                                              .contains(e.userKey))
                                          .map((user) => _userProfileListItem(
                                                isLikeUser: context
                                                    .read<AuthProvider>()
                                                    .allUserActivity
                                                    .where((e) => context
                                                        .read<AuthProvider>()
                                                        .user!
                                                        .userKey
                                                        .contains(e.userKey))
                                                    .map((e) => e.likesUserKey
                                                        .contains(user.userKey))
                                                    .toList()[0],
                                                user: user,
                                                context: context,
                                              )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          )),
    );
  }

  Padding _userProfileListItem({
    required UserModel user,
    required BuildContext context,
    required bool isLikeUser,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          userCircleImageWidget(
              isProfileUpdate: false,
              imageUrl: user.isSocialImage
                  ? user.socialProfileUrl
                  : user.localProfileUrl,
              context: context,
              userKey: user.userKey,
              widget: Row(
                children: [
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.nickName,
                          style: theme.textTheme.bodyText2!
                              .copyWith(color: Colors.white, fontSize: 12)),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          user.introduction.length > 25
                              ? "${user.introduction.substring(0, 25)} ..."
                              : user.introduction,
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: const Color.fromRGBO(175, 175, 175, 1),
                              fontSize: 9),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          if (context.read<AuthProvider>().user!.userKey.contains(user.userKey))
            Container()
          else
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, anmation) {
                return ScaleTransition(scale: anmation, child: child);
              },
              child: isLikeUser
                  ? IconButton(
                      key: const ValueKey('value'),
                      onPressed: () {
                        context
                            .read<FeedUserProvider>()
                            .addAndRemovLikesUserAndLikeMeUser(
                              userKey:
                                  context.read<AuthProvider>().user!.userKey,
                              likeMeUserKey: user.userKey,
                              isLikeUser: isLikeUser,
                            );
                        context
                            .read<AuthProvider>()
                            .getAllUserFeedUpdateActivityModel(
                                userKey:
                                    context.read<AuthProvider>().user!.userKey);
                      },
                      icon: const Icon(CustomIcon.heart,
                          color: Colors.red, size: 14),
                    )
                  : IconButton(
                      onPressed: () {
                        context
                            .read<FeedUserProvider>()
                            .addAndRemovLikesUserAndLikeMeUser(
                              userKey:
                                  context.read<AuthProvider>().user!.userKey,
                              likeMeUserKey: user.userKey,
                              isLikeUser: isLikeUser,
                            );
                        context
                            .read<AuthProvider>()
                            .getAllUserFeedUpdateActivityModel(
                                userKey:
                                    context.read<AuthProvider>().user!.userKey);
                      },
                      icon: const Icon(CustomIcon.heartEmpty,
                          color: Colors.white, size: 14),
                    ),
            ),
        ],
      ),
    );
  }
}
