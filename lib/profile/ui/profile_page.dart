import 'package:flutter/material.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/profile_appbar_widget.dart';
import 'package:flutter_drive/profile/ui/profile_image_selected_widget.dart';
import 'package:flutter_drive/profile/ui/profile_nick_name_widget.dart';
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
            provider.showBottomWidget(value: false);
          },
          child: Scaffold(
            appBar: profileAppbarWidget(context: context),
            body: Column(
              children: [
                ProfileImageSelectedWidget(
                  user: _user,
                  pickedImage: provider.pickedImage,
                ),
                const SizedBox(height: 100),
                ProfileNickNameWidget(
                  isBottom: provider.isBottom,
                  changedName: provider.nickName,
                  userName: _user.nickName,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
