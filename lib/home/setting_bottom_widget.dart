import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

Future<void> settingBottomWidget({
  required BuildContext context,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: materialBlackColor,
    builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(
          color: darkThemeMainColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 8),
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(71, 71, 71, 1),
                  ),
                ),
                const SizedBox(height: 20),
                ListView(
                  shrinkWrap: true,
                  children: [
                    _menuItemListTile(
                        title: '설정', icons: Icons.settings, onTap: () {}),
                    _menuItemListTile(
                        title: '프로필',
                        icons: Icons.account_circle,
                        onTap: () {
                          Navigator.of(context).pop();
                          pushNewScreen(context,
                              screen: ChangeNotifierProvider(
                                  create: (context) => ProfileProvider()
                                    ..started(
                                        isSocialImage: context
                                            .read<AuthProvider>()
                                            .user!
                                            .isSocialImage),
                                  child: const ProfilePage()));
                        }),
                    _menuItemListTile(
                        title: '로그아웃',
                        icons: Icons.logout_outlined,
                        onTap: () {
                          context.read<AuthProvider>().signOut(
                              provider:
                                  context.read<AuthProvider>().user!.provider);
                        }),
                  ],
                ),
              ],
            ),
            if (context.watch<AuthProvider>().user == null)
              Container()
            else
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      context.watch<AuthProvider>().user!.email,
                      style: theme.textTheme.bodyText2!
                          .copyWith(color: appSubColor, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Login with ${context.watch<AuthProvider>().user!.provider}',
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(135, 135, 135, 1),
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
          ],
        )),
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
        style: theme.textTheme.bodyText2,
      ),
    ),
  );
}
