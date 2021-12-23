import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/profile_appbar_widget.dart';
import 'package:flutter_drive/profile/ui/profile_image_selected_widget.dart';
import 'package:flutter_drive/profile/ui/profile_nick_name_widget.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        final UserModel _user =
            Provider.of<AuthProvider>(context, listen: false).user!;

        return GestureDetector(
          onTap: () {
            provider.showNickNameChangedWidget(value: false);
          },
          child: Scaffold(
            appBar: profileAppbarWidget(
              context: context,
              isLoading: provider.isLoading,
              color: provider.isSocialImage != _user.isSocialImage ||
                      (provider.nickName != _user.nickName &&
                          provider.nickName.isNotEmpty) ||
                      provider.pickedImage != null
                  ? appSubColor
                  : const Color.fromRGBO(115, 115, 115, 1),
              onTap: () async {
                if (provider.isSocialImage != _user.isSocialImage ||
                    (provider.nickName != _user.nickName &&
                        provider.nickName.isNotEmpty) ||
                    provider.pickedImage != null) {
                  await provider.userProfileUpdate(
                    socialProfileUrl: _user.socialProfileUrl,
                    localProfileUrl: _user.localProfileUrl,
                    nickName: _user.nickName,
                    userKey: _user.userKey,
                  );
                  Phoenix.rebirth(context);
                }
              },
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileNickNameWidget(
                  isTextForm: provider.isTextForm,
                  changedName: provider.nickName,
                  userName: _user.nickName,
                ),
                const SizedBox(height: 50),
                ProfileImageSelectedWidget(
                  user: _user,
                  pickedImage: provider.pickedImage,
                  isSocialImage: provider.isSocialImage!,
                  isImageSelectLoading: provider.isImageSelectLoading,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
