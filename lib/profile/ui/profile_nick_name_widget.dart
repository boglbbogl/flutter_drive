import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileNickNameWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final bool isTextForm;
  final String changedName;
  final String userName;

  ProfileNickNameWidget({
    Key? key,
    required this.isTextForm,
    required this.changedName,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightSize = size.height * 0.06;
    return Padding(
      padding: const EdgeInsets.only(left: 50, top: 20),
      child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
          child: !isTextForm
              ? SizedBox(
                  width: size.width * 0.8,
                  height: size.height * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 12),
                          Text(
                            changedName.isEmpty ? userName : changedName,
                            style: theme.textTheme.bodyText2!
                                .copyWith(fontSize: 30),
                          ),
                          const SizedBox(width: 12),
                          IconButton(
                            onPressed: () {
                              if (isTextForm) {
                                context
                                    .read<ProfileProvider>()
                                    .showNickNameChangedWidget(value: false);
                              } else {
                                context
                                    .read<ProfileProvider>()
                                    .showNickNameChangedWidget(value: true);
                              }
                            },
                            icon: isTextForm
                                ? const Icon(Icons.clear)
                                : const Icon(Icons.create_outlined),
                            color: Colors.white,
                            iconSize: 25,
                          )
                        ],
                      ),
                      _errorTextForm(hideColor: darkThemeMainColor),
                    ],
                  ),
                )
              : SizedBox(
                  key: const ValueKey('nickName'),
                  width: size.width * 0.8,
                  height: size.height * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: size.width * 0.6,
                            height: _heightSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: size.width * 0.3,
                                      height: _heightSize,
                                      child: TextFormField(
                                        controller: _controller,
                                        style: theme.textTheme.bodyText2!
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                        inputFormatters: [
                                          FilteringTextInputFormatter(
                                              RegExp("[a-z_]"),
                                              allow: true)
                                        ],
                                        decoration: InputDecoration(
                                          hintText: '닉네임을 입력해 주세요',
                                          hintStyle: theme.textTheme.bodyText2!
                                              .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromRGBO(
                                                195, 195, 195, 1),
                                            fontSize: 12,
                                          ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                      )),
                                  InkWell(
                                    onTap: () {
                                      if (_controller.text.isNotEmpty &&
                                          _controller.text.length < 16) {
                                        context.read<ProfileProvider>()
                                          ..changedNickName(
                                              nickName: _controller.text)
                                          ..showNickNameChangedWidget(
                                              value: false);
                                      } else {
                                        // show Snackbar
                                      }
                                    },
                                    child: Container(
                                        width: size.width * 0.11,
                                        height: _heightSize,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          color: Colors.white,
                                        ),
                                        child: const Icon(
                                          Icons.check_outlined,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                context
                                    .read<ProfileProvider>()
                                    .showNickNameChangedWidget(value: false);
                              },
                              child: Text(
                                '취소',
                                style: theme.textTheme.bodyText2!.copyWith(
                                  color: appMainColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                      _errorTextForm(
                        hideColor: const Color.fromRGBO(175, 175, 175, 1),
                      ),
                    ],
                  ),
                )),
    );
  }

  Padding _errorTextForm({
    required Color hideColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 5),
      child: Row(
        children: [
          Icon(Icons.error_outline_outlined, size: 12, color: hideColor),
          const SizedBox(width: 3),
          Text(
            '영어만 가능합니다',
            style: theme.textTheme.bodyText2!
                .copyWith(color: hideColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
