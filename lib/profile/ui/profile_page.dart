import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/profile_appbar_widget.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (_user.localProfileUrl.isEmpty)
                    Container(
                      width: size.width * 0.32,
                      height: size.width * 0.32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: const Color.fromRGBO(91, 91, 91, 1),
                      ),
                      child: const Icon(Icons.add_circle_outline,
                          size: 30, color: Color.fromRGBO(155, 155, 155, 1)),
                    )
                  else
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 58,
                      child: ClipOval(
                          child: CachedNetworkImage(
                              imageUrl: _user.socialProfileUrl)),
                    ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 58,
                        child: ClipOval(
                            child: CachedNetworkImage(
                                imageUrl: _user.socialProfileUrl)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
