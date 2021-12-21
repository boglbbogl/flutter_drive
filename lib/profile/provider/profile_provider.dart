import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_drive/profile/repository/profile_repository.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _profileRepository = ProfileRepository();
  final ImagePicker _imagePicker = ImagePicker();
  Uint8List? _pickedImage;
  bool _isBottom = false;
  String _nickName = "";

  Future profileImagePicker() async {
    final XFile? _selectedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_selectedImage != null) {
      _pickedImage = await _selectedImage.readAsBytes();
    }
    notifyListeners();
  }

  void changedNickName({
    required String nickName,
  }) {
    _nickName = nickName;
    notifyListeners();
  }

  void showBottomWidget({
    required bool value,
  }) {
    value == true ? _isBottom = true : _isBottom = false;
    notifyListeners();
  }

  // Future<void> userProfileUpdate() async {
  //   await _profileRepository.userPofileUpdate(
  //     socialProfileUrl: socialProfileUrl,
  //     localProfileUrl: localProfileUrl,
  //     nickName: nickName,
  //     isSocialImage: isSocialImage,
  //     userKey: userKey,
  //   );
  // }

  bool get isBottom => _isBottom;
  String get nickName => _nickName;
  Uint8List? get pickedImage => _pickedImage;
}
