import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_drive/image/repo/images_repository.dart';
import 'package:flutter_drive/profile/model/profile_model.dart';
import 'package:flutter_drive/profile/repo/profile_repository.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _profileRepository = ProfileRepository();
  final ImagesRepository _imagesRepository = ImagesRepository();
  final ImagePicker _imagePicker = ImagePicker();
  bool _isLoading = false;
  Uint8List? _pickedImage;
  bool _isTextForm = false;
  bool? _isSocialImage;
  String _nickName = "";
  String _localImageUrl = "";

  Future<void> started({
    required bool isSocialImage,
  }) async {
    _isSocialImage = isSocialImage;
  }

  Future<void> userProfileUpdate({
    required String socialProfileUrl,
    required String localProfileUrl,
    required String nickName,
    required String userKey,
  }) async {
    _isLoading = true;
    notifyListeners();
    if (_pickedImage != null) {
      _localImageUrl = await _imagesRepository.userProfileImageUpladResized(
          image: _pickedImage!, userKey: userKey);
    }
    await _profileRepository.userPofileUpdate(
      userProfile: ProfileModel(
          socialProfileUrl: socialProfileUrl,
          localProfileUrl:
              _localImageUrl.isEmpty ? localProfileUrl : _localImageUrl,
          isSocialImage: _isSocialImage!,
          nickName: _nickName.isEmpty ? nickName : _nickName),
      userKey: userKey,
    );
    _isLoading = false;
    notifyListeners();
  }

  Future profileImagePicker() async {
    final XFile? _selectedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_selectedImage != null) {
      _pickedImage = await _selectedImage.readAsBytes();
    }
    notifyListeners();
  }

  void imageSocialSelectButton({
    required bool value,
  }) {
    _isSocialImage = value;
    notifyListeners();
  }

  void changedNickName({
    required String nickName,
  }) {
    _nickName = nickName;
    notifyListeners();
  }

  void showNickNameChangedWidget({
    required bool value,
  }) {
    value == true ? _isTextForm = true : _isTextForm = false;
    notifyListeners();
  }

  bool get isTextForm => _isTextForm;
  bool get isLoading => _isLoading;
  String get nickName => _nickName;
  String get localImageUrl => _localImageUrl;
  bool? get isSocialImage => _isSocialImage;
  Uint8List? get pickedImage => _pickedImage;
}
