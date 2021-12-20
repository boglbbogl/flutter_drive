import 'package:flutter/material.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/model/user_model.dart';

class ProfileNickNameWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final bool isBottom;
  final String changedName;
  final String userName;

  ProfileNickNameWidget({
    Key? key,
    required this.isBottom,
    required this.changedName,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              changedName.isEmpty ? userName : changedName,
              style: theme.textTheme.bodyText2!.copyWith(fontSize: 30),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: () {
                if (isBottom) {
                  context
                      .read<ProfileProvider>()
                      .showBottomWidget(value: false);
                } else {
                  context.read<ProfileProvider>().showBottomWidget(value: true);
                }
              },
              icon: isBottom
                  ? const Icon(Icons.clear)
                  : const Icon(Icons.create_outlined),
              color: Colors.white,
              iconSize: 25,
            )
          ],
        ),
        const SizedBox(height: 20),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 700),
          child: isBottom
              ? Container(
                  key: const ValueKey('show'),
                  width: size.width * 0.6,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: size.width * 0.4,
                            height: size.height * 0.06,
                            child: TextFormField(
                              controller: _controller,
                              style: theme.textTheme.bodyText2!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              decoration: InputDecoration(
                                  hintText: '변경할 이름을 입력해 주세요',
                                  hintStyle:
                                      theme.textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromRGBO(195, 195, 195, 1),
                                    fontSize: 12,
                                  )),
                            )),
                        InkWell(
                          onTap: () {
                            context.read<ProfileProvider>()
                              ..changedNickName(nickName: _controller.text)
                              ..showBottomWidget(value: false);
                          },
                          child: Container(
                              width: size.width * 0.12,
                              height: size.height * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.check_outlined,
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ),
      ],
    );
  }
}
