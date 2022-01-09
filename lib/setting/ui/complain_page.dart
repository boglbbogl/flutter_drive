import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/setting/provider/setting_provider.dart';
import 'package:provider/provider.dart';

class ComplainPage extends StatelessWidget {
  final bool isComplain;
  const ComplainPage({
    Key? key,
    required this.isComplain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: TextButton(
                onPressed: () {
                  context.read<SettingProvider>().sendUserComplain(
                      user: context.read<AuthProvider>().user!,
                      isComplain: isComplain,
                      context: context);
                },
                child: Text(
                  '전송하기',
                  style: theme.textTheme.bodyText2!.copyWith(
                      color: appSubColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: size.width * 0.9,
                child: Row(
                  children: [
                    Icon(Icons.error_outline_rounded,
                        size: 18, color: appSubColor),
                    const SizedBox(width: 8),
                    Text(
                      '답변은 설정 > 접수내역에서 확인해 주세요',
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: appSubColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                  width: size.width * 0.9,
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(51, 51, 51, 1),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: TextFormField(
                      onChanged: (value) {
                        context
                            .read<SettingProvider>()
                            .getExplanationValue(value: value);
                      },
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(215, 215, 215, 1),
                          fontSize: 12),
                      maxLines: 20,
                      decoration: InputDecoration(
                        hintText:
                            isComplain ? '불편 사항을 작성해 주세요' : '개선 사항을 작성해 주세요',
                        helperStyle: theme.textTheme.bodyText2!.copyWith(
                            color: const Color.fromRGBO(175, 175, 175, 1),
                            fontSize: 16),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
