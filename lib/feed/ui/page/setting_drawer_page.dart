import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/page/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';

class SettingDrawerPage extends StatelessWidget {
  // final double appBarHeight;
  const SettingDrawerPage({
    Key? key,
    // required this.appBarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: size.width * 0.5,
      height: size.height,
      curve: Curves.ease,
      color: Colors.amber,
      transform: Matrix4.translationValues(
          context.watch<FeedUserProvider>().isShowDrawer
              ? size.width * 0.5
              : size.width,
          0,
          0),
      duration: const Duration(milliseconds: 300),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
        ),
        backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  _menuItemListTile(
                      title: '프로필',
                      icons: Icons.account_circle,
                      onTap: () {
                        context.read<ProfileProvider>().started(
                              isSocialImage: context
                                  .read<AuthProvider>()
                                  .user!
                                  .isSocialImage,
                            );
                        pushNewScreen(context, screen: const ProfilePage());
                        context.read<FeedUserProvider>().showCustomDrawer(
                            value:
                                context.read<FeedUserProvider>().isShowDrawer);
                      }),
                  _menuItemListTile(
                      title: '설정', icons: Icons.settings, onTap: () {}),
                ],
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _menuItemListTile(
                      title: '로그아웃',
                      icons: Icons.logout_outlined,
                      onTap: () {
                        context.read<AuthProvider>().signOut(
                            provider:
                                context.read<AuthProvider>().user!.provider);
                        context.read<FeedUserProvider>().showCustomDrawer(
                            value:
                                context.read<FeedUserProvider>().isShowDrawer);
                      }),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 4),
                    child: Container(
                        width: size.width * 0.45,
                        height: 2,
                        color: const Color.fromRGBO(91, 91, 91, 1)),
                  ),
                  if (context.watch<AuthProvider>().user == null)
                    Container()
                  else
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(context
                                            .read<AuthProvider>()
                                            .user!
                                            .provider ==
                                        'Google'
                                    ? 'assets/images/google.png'
                                    : 'assets/images/kakao-talk.png'),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Column(
                              children: [
                                Text(
                                  context.watch<AuthProvider>().user!.email,
                                  style: theme.textTheme.bodyText2!.copyWith(
                                      color: appSubColor, fontSize: 10),
                                ),
                                Text(
                                  'Login with ${context.watch<AuthProvider>().user!.provider}',
                                  style: theme.textTheme.bodyText2!.copyWith(
                                      color: const Color.fromRGBO(
                                          135, 135, 135, 1),
                                      fontSize: 9),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _menuItemListTile({
    required String title,
    required IconData icons,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icons,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: theme.textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
