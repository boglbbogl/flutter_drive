import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileImageSelectedWidget extends StatelessWidget {
  final UserModel user;
  final bool isSocialImage;
  final Uint8List? pickedImage;
  const ProfileImageSelectedWidget({
    Key? key,
    required this.user,
    required this.pickedImage,
    required this.isSocialImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (user.localProfileUrl.isEmpty && pickedImage == null)
          Column(
            children: [
              InkWell(
                onTap: () {
                  context.read<ProfileProvider>().profileImagePicker();
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: const Color.fromRGBO(91, 91, 91, 1),
                  ),
                  child: const Icon(Icons.add_circle_outline,
                      size: 30, color: Color.fromRGBO(155, 155, 155, 1)),
                ),
              ),
              _profileImageSelectButton(
                onTap: () {},
                hideColor: darkThemeMainColor,
                selectColor: darkThemeMainColor,
              ),
            ],
          )
        else if (pickedImage != null)
          Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipOval(child: Image.memory(pickedImage!)),
                ),
              ),
              _profileImageSelectButton(
                onTap: () {
                  context
                      .read<ProfileProvider>()
                      .imageSocialSelectButton(value: false);
                },
                hideColor: const Color.fromRGBO(215, 215, 215, 1),
                selectColor: isSocialImage ? darkThemeMainColor : appSubColor,
              ),
            ],
          )
        else
          _circleImageForm(
            imageUrl: user.localProfileUrl,
            widgets: _profileImageSelectButton(
              onTap: () {
                context
                    .read<ProfileProvider>()
                    .imageSocialSelectButton(value: false);
              },
              hideColor: const Color.fromRGBO(215, 215, 215, 1),
              selectColor: !isSocialImage ? appSubColor : darkThemeMainColor,
            ),
          ),
        _circleImageForm(
          imageUrl: user.socialProfileUrl,
          widgets: _profileImageSelectButton(
            onTap: () {
              context
                  .read<ProfileProvider>()
                  .imageSocialSelectButton(value: true);
            },
            hideColor: const Color.fromRGBO(215, 215, 215, 1),
            selectColor: isSocialImage ? appSubColor : darkThemeMainColor,
          ),
        ),
      ],
    );
  }

  Column _circleImageForm({
    required String imageUrl,
    required Widget widgets,
  }) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipOval(child: CachedNetworkImage(imageUrl: imageUrl)),
          ),
        ),
        widgets,
      ],
    );
  }

  InkWell _profileImageSelectButton({
    required Color hideColor,
    required Color selectColor,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: hideColor),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: selectColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
