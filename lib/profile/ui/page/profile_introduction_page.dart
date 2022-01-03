import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/widgets/profile_appbar_widget.dart';
import 'package:provider/provider.dart';

class ProfileIntrodutionPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final String introduction;
  ProfileIntrodutionPage({
    Key? key,
    required this.introduction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.text = introduction;
    return Scaffold(
      appBar: profileAppbarWidget(
          context: context,
          color: appMainColor,
          isLoading: context.read<ProfileProvider>().isLoading,
          onTap: () {
            if (_controller.text == introduction) {
              appFlushbar(message: '수정할 내용이 없습니다').show(context);
            } else {
              context.read<ProfileProvider>().profileIntroductionUpdate(
                    userKey: context.read<AuthProvider>().user!.userKey,
                    introduction: _controller.text,
                  );
              _controller.clear();
              Navigator.of(context)
                ..pop()
                ..pop();
            }
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.create,
                    color: appMainColor,
                    size: 15,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '자신을 소개하는 글을 작성해 보세요',
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: appMainColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: darkThemeMainColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextFormField(
                    controller: _controller,
                    maxLines: 10,
                    style: theme.textTheme.bodyText2!
                        .copyWith(color: Colors.white, fontSize: 11),
                    decoration: InputDecoration(
                        hintText: '자신을 소개할 수 있는 글을 작성해 주세요',
                        hintStyle: theme.textTheme.bodyText2!.copyWith(
                            color: const Color.fromRGBO(175, 175, 175, 1),
                            fontSize: 11),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
