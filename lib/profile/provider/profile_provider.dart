import 'package:flutter/material.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/repo/user_repository.dart';
import 'package:flutter_drive/profile/repository/profile_repository.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _profileRepository = ProfileRepository();

  // Future<void> userProfileUpdate() async {
  //   await _profileRepository.userPofileUpdate(
  //     socialProfileUrl: socialProfileUrl,
  //     localProfileUrl: localProfileUrl,
  //     nickName: nickName,
  //     isSocialImage: isSocialImage,
  //     userKey: userKey,
  //   );
  // }
}
