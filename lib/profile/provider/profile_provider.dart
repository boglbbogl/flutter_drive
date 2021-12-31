import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:flutter_drive/_constant/logger.dart';
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
  bool _isImageSelectLoading = false;
  String _nickName = "";
  String _localImageUrl = "";
  bool _updateSuccessOrFailure = false;
  String _introduction = "";
  bool _isIntroduction = false;
  bool _isCars = false;

  Future<void> started({
    required bool isSocialImage,
  }) async {
    _isSocialImage = isSocialImage;
    _updateSuccessOrFailure = false;
  }

  Future userProfileUpdate({
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
      introduction: _introduction,
      cars: [],
      userProfile: ProfileModel(
          socialProfileUrl: socialProfileUrl,
          localProfileUrl:
              _localImageUrl.isEmpty ? localProfileUrl : _localImageUrl,
          isSocialImage: _isSocialImage!,
          nickName: _nickName.isEmpty ? nickName : _nickName),
      userKey: userKey,
    );
    _isLoading = false;
    logger.e('success');
    _updateSuccessOrFailure = true;
    notifyListeners();
  }

  Future profileImagePicker() async {
    _isImageSelectLoading = true;
    notifyListeners();
    final XFile? _selectedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_selectedImage != null) {
      _pickedImage = await _selectedImage.readAsBytes();
    }
    _isImageSelectLoading = false;
    notifyListeners();
  }

  void imageSocialSelectButton({
    required bool value,
  }) {
    _isSocialImage = value;
    notifyListeners();
  }

  Future<void> changedNickName({
    required String nickName,
    required BuildContext context,
  }) async {
    if (nickName.isNotEmpty && nickName.length < 21 && nickName.length > 2) {
      final _nickNameExists = await _profileRepository
          .getUsersNickNameDuplication(nickName: nickName);
      if (_nickNameExists) {
        appFlushbar(message: '이미 존재하는 닉네임 입니다').show(context);
      } else {
        _nickName = nickName;
      }
    } else {
      appFlushbar(message: '20자까지 입력할 수 있습니다').show(context);
    }
    notifyListeners();
  }

  void changedIntroduction({
    required String value,
  }) {
    if (value.length > 4999) {
      //show snackbar
    } else {
      _introduction = value;
    }
    notifyListeners();
  }

  void showIntroductionWidget({
    required bool value,
  }) {
    _isIntroduction = value;
    notifyListeners();
  }

  void showNickNameChangedWidget({
    required bool value,
  }) {
    value == true ? _isTextForm = true : _isTextForm = false;
    notifyListeners();
  }

  void showCarsChangedWidget({
    required bool value,
  }) {
    _isCars = value;
    notifyListeners();
  }

  bool get isTextForm => _isTextForm;
  bool get isImageSelectLoading => _isImageSelectLoading;
  bool get isLoading => _isLoading;
  String get nickName => _nickName;
  String get localImageUrl => _localImageUrl;
  bool? get isSocialImage => _isSocialImage;
  Uint8List? get pickedImage => _pickedImage;
  bool get updateSuccessOrFailure => _updateSuccessOrFailure;
  String get introduction => _introduction;
  bool get isIntroduction => _isIntroduction;
  bool get isCars => _isCars;
}
