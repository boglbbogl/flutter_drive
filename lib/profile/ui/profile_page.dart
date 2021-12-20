import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/profile_appbar_widget.dart';
import 'package:flutter_drive/profile/ui/profile_image_selected_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        final UserModel _user =
            Provider.of<AuthProvider>(context, listen: false).user!;
        return Scaffold(
          appBar: profileAppbarWidget(context: context),
          body: Column(
            children: [
              ProfileImageSelectedWidget(user: _user),
              const SizedBox(height: 50),
              Text(_user.nickName),
            ],
          ),
        );
      },
    );
  }
}
