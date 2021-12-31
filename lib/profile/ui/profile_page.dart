import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/profile_appbar_widget.dart';
import 'package:flutter_drive/profile/ui/profile_image_selected_widget.dart';
import 'package:flutter_drive/profile/ui/profile_introduction_widget.dart';
import 'package:flutter_drive/profile/ui/profile_nick_name_widget.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        final UserModel _user =
            Provider.of<AuthProvider>(context, listen: false).user!;
        _controller.text = _user.introduction;
        return GestureDetector(
          onTap: () {
            // FocusScope.of(context).unfocus();
            provider.showNickNameChangedWidget(value: false);
            provider.showIntroductionWidget(value: false);
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: profileAppbarWidget(
              context: context,
              isLoading: provider.isLoading,
              color: provider.isSocialImage != _user.isSocialImage ||
                      (provider.nickName != _user.nickName &&
                          provider.nickName.isNotEmpty) ||
                      provider.pickedImage != null ||
                      provider.introduction.isNotEmpty
                  ? appMainColor
                  : const Color.fromRGBO(115, 115, 115, 1),
              onTap: () async {
                if (provider.isSocialImage != _user.isSocialImage ||
                    (provider.nickName != _user.nickName &&
                        provider.nickName.isNotEmpty) ||
                    provider.pickedImage != null ||
                    provider.introduction.isNotEmpty) {
                  await provider.userProfileUpdate(
                    socialProfileUrl: _user.socialProfileUrl,
                    localProfileUrl: _user.localProfileUrl,
                    nickName: _user.nickName,
                    userKey: _user.userKey,
                  );
                }
                if (context.read<ProfileProvider>().updateSuccessOrFailure) {
                  Phoenix.rebirth(context);
                }
              },
            ),
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileNickNameWidget(
                      isTextForm: provider.isTextForm,
                      changedName: provider.nickName,
                      userName: _user.nickName,
                    ),
                    const SizedBox(height: 25),
                    ProfileImageSelectedWidget(
                      user: _user,
                      pickedImage: provider.pickedImage,
                      isSocialImage: provider.isSocialImage!,
                      isImageSelectLoading: provider.isImageSelectLoading,
                    ),
                    const SizedBox(height: 15),
                    profileIntroductionWidget(
                      introduction: provider.introduction,
                      controller: _controller,
                      isIntroduction: provider.isIntroduction,
                      context: context,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, top: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_box_outlined,
                              color: appMainColor,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '자동차 추가하기',
                              style: theme.textTheme.bodyText2!
                                  .copyWith(color: appMainColor, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 15,
                  left: 30,
                  right: 30,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(color: appMainColor),
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromRGBO(51, 51, 51, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintStyle: theme.textTheme.bodyText2!.copyWith(
                                color: const Color.fromRGBO(195, 195, 195, 1),
                                fontSize: 11),
                            hintText: ' 자동차 이름을 입력해주세요',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
