import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/auth/ui/profile_circle_image_widget.dart';
import 'package:flutter_drive/feed/ui/page/feed_user_likes_page.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/page/profile_cars_page.dart';
import 'package:flutter_drive/profile/ui/page/profile_city_page.dart';
import 'package:flutter_drive/profile/ui/page/profile_introduction_page.dart';
import 'package:flutter_drive/profile/ui/page/profile_privacy_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

SliverList feedUserInfoWidget({
  required String userImage,
  required String userNickName,
  required String userKey,
  required String contentLength,
  required String likesUserLength,
  required String userIntroduction,
  required List<String> cars,
  required BuildContext context,
  required List<String> city,
  required bool isLockLikes,
  required bool isLockBookmarks,
  required bool isMe,
  required Function() profileOnTap,
}) {
  return SliverList(
      delegate: SliverChildListDelegate([
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      profileCircleImageWidget(
                        imageUrl: userImage,
                      ),
                      if (isMe) ...[
                        Positioned(
                          right: -3,
                          top: -2,
                          child: InkWell(
                            onTap: profileOnTap,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: darkThemeMainColor),
                              child: const Center(
                                  child: Icon(Icons.add_circle_outline,
                                      size: 16, color: Colors.white)),
                            ),
                          ),
                        )
                      ],
                    ],
                  ),
                  const SizedBox(width: 18),
                  _textForm(
                      topTitle: userNickName,
                      bottomTitle: "",
                      topFontSize: 14,
                      topFontColor: const Color.fromRGBO(225, 225, 225, 1)),
                ],
              ),
              Row(
                children: [
                  _textForm(
                      topTitle: contentLength,
                      bottomTitle: '게시물수',
                      topFontSize: 18,
                      bottomFontWeight: FontWeight.w400,
                      bottomFontColor: const Color.fromRGBO(195, 195, 195, 1)),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      pushNewScreen(context,
                          screen: FeedUserLikesPage(
                            userNickName: userNickName,
                            userKey: userKey,
                          ),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino);
                    },
                    child: _textForm(
                        topTitle: likesUserLength,
                        bottomTitle: '좋아요',
                        topFontSize: 18,
                        bottomFontWeight: FontWeight.w400,
                        bottomFontColor:
                            const Color.fromRGBO(195, 195, 195, 1)),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          _userProfileBottomForm(
              context: context,
              isMe: isMe,
              textBtn: userIntroduction.isEmpty ? '소개글 작성하러 가기...' : '수정하기',
              icon: Icons.create,
              widget: userIntroduction.isEmpty
                  ? Container()
                  : Text(
                      userIntroduction,
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(195, 195, 195, 1),
                          fontSize: 11),
                    ),
              onTap: () {
                pushNewScreen(context,
                    screen: ProfileIntrodutionPage(
                      introduction: userIntroduction,
                    ),
                    pageTransitionAnimation: PageTransitionAnimation.cupertino);
              }),
          const SizedBox(height: 6),
          _userProfileBottomForm(
            isMe: isMe,
            context: context,
            textBtn: cars.isEmpty ? "차량 정보 추가하러 가기..." : "차량 정보 수정하기",
            icon: Icons.add_box_outlined,
            widget: cars.isEmpty
                ? Container()
                : RichText(
                    text: TextSpan(children: [
                    ...context
                        .watch<AuthProvider>()
                        .user!
                        .cars
                        .map((e) => TextSpan(
                            text: "#$e  ",
                            style: theme.textTheme.bodyText2!.copyWith(
                              color: const Color.fromRGBO(195, 195, 195, 1),
                              fontSize: 10,
                            )))
                  ])),
            onTap: () {
              pushNewScreen(context,
                  screen: ProfileCarsPage(
                    cars: cars,
                  ),
                  pageTransitionAnimation: PageTransitionAnimation.cupertino);
            },
          ),
          const SizedBox(height: 6),
          _userProfileBottomForm(
            isMe: isMe,
            context: context,
            textBtn: city.isEmpty ? "활동 지역 추가하러 가기..." : "지역 수정하기",
            icon: Icons.add_box_outlined,
            widget: city.isEmpty
                ? Container()
                : RichText(
                    text: TextSpan(children: [
                    ...city.map((e) => TextSpan(
                        text: "#$e  ",
                        style: theme.textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(195, 195, 195, 1),
                          fontSize: 10,
                        )))
                  ])),
            onTap: () {
              pushNewScreen(context,
                  screen: ProfileCityPage(
                    city: city,
                  ),
                  pageTransitionAnimation: PageTransitionAnimation.cupertino);
            },
          ),
          const SizedBox(height: 6),
          _userProfileBottomForm(
            isMe: isMe,
            context: context,
            textBtn: "공개 여부 설정하러 가기...",
            icon: Icons.lock_open_rounded,
            widget: Row(
              children: [
                _userPrivacyForm(title: '좋아요', isLock: isLockLikes),
                const SizedBox(width: 10),
                _userPrivacyForm(title: '북마크', isLock: isLockBookmarks),
              ],
            ),
            onTap: () {
              context.read<ProfileProvider>().privacyUpdateStarted(
                  isPrivacyBookmarks: isLockBookmarks,
                  isPrivacyLikes: isLockLikes);
              pushNewScreen(context,
                  screen: const ProfilePrivacyPage(),
                  pageTransitionAnimation: PageTransitionAnimation.cupertino);
            },
          ),
        ],
      ),
    )
  ]));
}

Row _userPrivacyForm({
  required String title,
  required bool isLock,
}) {
  return Row(
    children: [
      Text(
        title,
        style: theme.textTheme.bodyText2!.copyWith(
          color: const Color.fromRGBO(195, 195, 195, 1),
          fontSize: 10,
        ),
      ),
      const SizedBox(width: 3),
      if (isLock)
        Icon(
          Icons.lock,
          size: 12,
          color: appMainColor,
        )
      else
        const Icon(
          Icons.lock_open_rounded,
          size: 12,
          color: Color.fromRGBO(195, 195, 195, 1),
        ),
    ],
  );
}

SizedBox _userProfileBottomForm({
  required bool isMe,
  required BuildContext context,
  required Widget widget,
  required Function() onTap,
  required String textBtn,
  required IconData icon,
}) {
  return SizedBox(
    width: size.width * 0.9,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget,
        const SizedBox(height: 2),
        if (isMe) ...[
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Icon(icon, color: appSubColor, size: 11),
                const SizedBox(width: 4),
                Text(
                  textBtn,
                  style: theme.textTheme.bodyText2!
                      .copyWith(color: appSubColor, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ],
    ),
  );
}

Column _textForm({
  required String topTitle,
  required String bottomTitle,
  required double topFontSize,
  FontWeight? topFontWeight = FontWeight.bold,
  FontWeight? bottomFontWeight = FontWeight.bold,
  Color? topFontColor = Colors.white,
  Color? bottomFontColor = Colors.white,
}) {
  return Column(
    children: [
      Text(
        topTitle,
        style: theme.textTheme.bodyText2!.copyWith(
            color: topFontColor,
            fontWeight: topFontWeight,
            fontSize: topFontSize),
      ),
      Text(
        bottomTitle,
        style: theme.textTheme.bodyText2!.copyWith(
            color: bottomFontColor, fontWeight: bottomFontWeight, fontSize: 12),
      ),
    ],
  );
}
