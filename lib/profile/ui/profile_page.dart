import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/profile_appbar_widget.dart';
import 'package:flutter_drive/profile/ui/profile_cars_bottom_widget.dart';
import 'package:flutter_drive/profile/ui/profile_cars_widget.dart';
import 'package:flutter_drive/profile/ui/profile_image_selected_widget.dart';
import 'package:flutter_drive/profile/ui/profile_introduction_widget.dart';
import 'package:flutter_drive/profile/ui/profile_nick_name_widget.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController _introController = TextEditingController();
  final TextEditingController _carController = TextEditingController();
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        final UserModel _user =
            Provider.of<AuthProvider>(context, listen: false).user!;
        _introController.text = _user.introduction;
        return GestureDetector(
          onTap: () {
            // FocusScope.of(context).unfocus();
            provider.showNickNameChangedWidget(value: false);
            provider.showIntroductionWidget(value: false);
            provider.showCarsChangedWidget(value: false);
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
                      provider.introduction.isNotEmpty ||
                      provider.cars.isNotEmpty ||
                      provider.loadCars.isNotEmpty
                  ? appMainColor
                  : const Color.fromRGBO(115, 115, 115, 1),
              onTap: () async {
                if (provider.isSocialImage != _user.isSocialImage ||
                    (provider.nickName != _user.nickName &&
                        provider.nickName.isNotEmpty) ||
                    provider.pickedImage != null ||
                    provider.introduction.isNotEmpty ||
                    provider.cars.isNotEmpty ||
                    provider.loadCars.isNotEmpty) {
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
                      controller: _introController,
                      isIntroduction: provider.isIntroduction,
                      context: context,
                    ),
                    profileCarsWidget(
                        context: context,
                        cars: provider.cars,
                        profileCars: _user.cars,
                        loadCars: provider.loadCars),
                  ],
                ),
                profileCarsBottomWidget(
                    context: context,
                    isCars: provider.isCars,
                    controller: _carController),
              ],
            ),
          ),
        );
      },
    );
  }
}
