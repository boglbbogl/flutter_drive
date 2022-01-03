import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/image/repo/images_repository.dart';
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
  late bool? _isPrivacyBookmarks;
  late bool? _isPrivacyLikes;
  bool _isImageSelectLoading = false;
  String _nickName = "";
  String _localImageUrl = "";
  final List<String> _addCars = [];
  final List<String> _deleteCars = [];

  Future<void> started({
    required bool isSocialImage,
    required bool isPrivacyBookmarks,
    required bool isPrivacyLikes,
  }) async {
    notifyListeners();
    _isSocialImage = isSocialImage;
    _isPrivacyBookmarks = isPrivacyBookmarks;
    _isPrivacyLikes = isPrivacyLikes;
    notifyListeners();
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
      userModel: UserModel(
        userKey: userKey,
        nickName: _nickName.isEmpty ? nickName : _nickName,
        email: "",
        socialProfileUrl: socialProfileUrl,
        localProfileUrl:
            _localImageUrl.isEmpty ? localProfileUrl : _localImageUrl,
        isSocialImage: _isSocialImage!,
        introduction: "",
        cars: [],
        privacyBookmarks: _isPrivacyBookmarks!,
        privacyLikes: _isPrivacyLikes!,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        provider: "",
      ),
      userKey: userKey,
    );
    _isLoading = false;
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

  Future profileIntroductionUpdate({
    required String userKey,
    required String introduction,
  }) async {
    await _profileRepository.profileIntroductionUpdate(
        userKey: userKey, introduction: introduction);
  }

  Future profileCarsUpdate({
    required String userKey,
    required BuildContext context,
  }) async {
    if (addCars.isEmpty && _deleteCars.isEmpty) {
      appFlushbar(message: '변경 사항이 없습니다').show(context);
    } else {
      await _profileRepository.profileCarsUpdate(
        deleteCars: _deleteCars,
        addCars: _addCars,
        userKey: userKey,
      );
      Navigator.of(context)
        ..pop()
        ..pop();
    }
  }

  void profileAddCars({
    required String value,
  }) {
    if (_addCars.contains(value)) {
      _addCars.remove(value);
    } else {
      _addCars.add(value);
    }
    notifyListeners();
  }

  void profileDeleteCars({
    required String value,
  }) {
    if (_deleteCars.contains(value)) {
      _deleteCars.remove(value);
    } else {
      _deleteCars.add(value);
    }
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

  void showNickNameChangedWidget({
    required bool value,
  }) {
    value == true ? _isTextForm = true : _isTextForm = false;
    notifyListeners();
  }

  void changedPrivacyBookmarks({
    required bool value,
  }) {
    _isPrivacyBookmarks = value;
    notifyListeners();
  }

  void changedPrivacyLikes({
    required bool value,
  }) {
    _isPrivacyLikes = value;
    notifyListeners();
  }

  bool get isTextForm => _isTextForm;
  bool get isImageSelectLoading => _isImageSelectLoading;
  bool get isLoading => _isLoading;
  String get nickName => _nickName;
  String get localImageUrl => _localImageUrl;
  bool? get isSocialImage => _isSocialImage;
  Uint8List? get pickedImage => _pickedImage;
  List<String> get addCars => _addCars;
  List<String> get deleteCars => _deleteCars;
  bool get isPrivacyBookmarks => _isPrivacyBookmarks!;
  bool get isPrivacyLikes => _isPrivacyLikes!;
}
