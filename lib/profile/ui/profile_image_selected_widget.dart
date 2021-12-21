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
  final bool isImageSelectLoading;
  const ProfileImageSelectedWidget({
    Key? key,
    required this.user,
    required this.pickedImage,
    required this.isSocialImage,
    required this.isImageSelectLoading,
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
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: !isSocialImage
                          ? appSubColor
                          : const Color.fromRGBO(215, 215, 215, 1),
                    ),
                    child: isImageSelectLoading
                        ? const Padding(
                            padding: EdgeInsets.all(30.0),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 5,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipOval(
                                child: Image.memory(
                              pickedImage!,
                              fit: BoxFit.cover,
                            )),
                          ),
                  ),
                  _profileImageSelectButton(
                    onTap: () {
                      context
                          .read<ProfileProvider>()
                          .imageSocialSelectButton(value: false);
                    },
                    hideColor: const Color.fromRGBO(215, 215, 215, 1),
                    selectColor:
                        isSocialImage ? darkThemeMainColor : appSubColor,
                  ),
                ],
              ),
              _imageChangedIcon(context: context),
            ],
          )
        else
          Stack(
            children: [
              _circleImageForm(
                color: !isSocialImage
                    ? appSubColor
                    : const Color.fromRGBO(215, 215, 215, 1),
                imageUrl: user.localProfileUrl,
                widgets: _profileImageSelectButton(
                  onTap: () {
                    context
                        .read<ProfileProvider>()
                        .imageSocialSelectButton(value: false);
                  },
                  hideColor: const Color.fromRGBO(215, 215, 215, 1),
                  selectColor:
                      !isSocialImage ? appSubColor : darkThemeMainColor,
                ),
              ),
              _imageChangedIcon(context: context),
              if (isImageSelectLoading) ...[
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 5,
                  ),
                )
              ],
            ],
          ),
        _circleImageForm(
          imageUrl: user.socialProfileUrl,
          color: isSocialImage
              ? appSubColor
              : const Color.fromRGBO(215, 215, 215, 1),
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

  Positioned _imageChangedIcon({
    required BuildContext context,
  }) {
    return Positioned(
        top: 0,
        right: 0,
        child: InkWell(
          onTap: () => context.read<ProfileProvider>().profileImagePicker(),
          child: const Icon(
            Icons.add_circle_outline_outlined,
            color: Colors.white,
            size: 25,
          ),
        ));
  }

  Column _circleImageForm({
    required String imageUrl,
    required Widget widgets,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipOval(
                child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, string) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    color: Colors.white,
                  ),
                );
              },
            )),
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
          const SizedBox(height: 15),
          Container(
            width: 50,
            height: 50,
            color: darkThemeMainColor,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(215, 215, 215, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: darkThemeMainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: selectColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
