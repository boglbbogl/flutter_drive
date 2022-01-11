import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/notification/provider/notification_provider.dart';
import 'package:flutter_drive/setting/provider/setting_provider.dart';
import 'package:flutter_drive/setting/ui/complain_answer_page.dart';
import 'package:flutter_drive/setting/ui/complain_page.dart';
import 'package:flutter_drive/setting/ui/notification_setting_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _listItemForm(
                title: '알림 설정',
                icon: Icons.notifications_active_outlined,
                onTap: () async {
                  await context.read<NotificationProvider>().getUserNotiSetting(
                      userKey: context.read<AuthProvider>().user!.userKey);
                  pushNewScreen(context,
                      screen: const NotificationSettingPage(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino);
                }),
            _listItemForm(
                title: '개선 사항 문의하기',
                icon: Icons.email_outlined,
                onTap: () {
                  context.read<SettingProvider>().started();
                  pushNewScreen(context,
                      screen: const ComplainPage(
                        isComplain: false,
                      ),
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino);
                }),
            _listItemForm(
                title: '불편 사항 문의하기',
                icon: Icons.announcement_outlined,
                onTap: () {
                  context.read<SettingProvider>().started();
                  pushNewScreen(context,
                      screen: const ComplainPage(
                        isComplain: true,
                      ),
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino);
                }),
            _listItemForm(
                title: '자주 하는 질문',
                icon: Icons.question_answer_outlined,
                onTap: () {
                  appFlushbar(message: '출시 예정인 기능입니다').show(context);
                }),
            _listItemForm(
                title: '접수내역',
                icon: Icons.mark_email_read_outlined,
                onTap: () {
                  context.read<SettingProvider>().getUserComplainList(
                      userKey: context.read<AuthProvider>().user!.userKey);
                  pushNewScreen(context, screen: const ComplainAnswerPage());
                }),
          ],
        ),
      ),
    );
  }

  Padding _listItemForm({
    required String title,
    required IconData icon,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: size.width * 0.9,
          child: Row(
            children: [
              Icon(icon, size: 22, color: Colors.white),
              const SizedBox(width: 25),
              Text(
                title,
                style: theme.textTheme.bodyText2!.copyWith(
                  color: const Color.fromRGBO(215, 215, 215, 1),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
