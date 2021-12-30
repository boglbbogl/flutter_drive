import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/course/repo/course_repository.dart';
import 'package:flutter_drive/image/repo/images_repository.dart';
import 'package:flutter_drive/profile/model/profile_model.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _courseRepository = CourseRepository();
  final ImagesRepository _imagesRepository = ImagesRepository();
  CourseModel _courseModel = CourseModel.empty();
  CourseSpot _courseSpot = CourseSpot.empty();
  List<CourseSpot> _courseSpotList = [];
  String _explanation = "";
  bool _isSwitcher = false;
  bool _isUploading = false;
  List<String> _imageUrl = [];
  List<String> _driveSeason = [];
  List<String> _driveTime = [];
  List<String> _srcsKeyword = [];

  void started() {
    _explanation = "";
    _isSwitcher = false;
    _courseSpotList = [];
    _imageUrl = [];
    _courseModel = CourseModel.empty();
    _courseSpot = CourseSpot.empty();
    _driveSeason = [];
    _driveTime = [];
    _srcsKeyword = [];
  }

  Future<void> createCourse({
    required UserModel user,
    required List<Uint8List> multiImage,
  }) async {
    _isUploading = true;
    notifyListeners();

    if (multiImage.isNotEmpty) {
      _imageUrl = await _imagesRepository.imageUploadResized(
          userKey: user.userKey, imageFile: multiImage);
    }
    await _courseRepository.createCourseModel(
        courseModel: _courseModel.copyWith(
            userKey: user.userKey,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            imageUrl: _imageUrl,
            spot: _courseSpotList,
            srcKeyword: _srcsKeyword,
            tagKeyword: [],
            driveSeason: _driveSeason,
            driveTime: _driveTime,
            userProfile: ProfileModel(
                socialProfileUrl: user.socialProfileUrl,
                localProfileUrl: user.localProfileUrl,
                isSocialImage: user.isSocialImage,
                nickName: user.nickName)));
    _isUploading = false;
    notifyListeners();
  }

  void getCourseSpotList({
    required CourseSpot courseSpot,
    required BuildContext context,
  }) {
    if (_courseSpotList.length < 10) {
      if (_courseSpotList.contains(courseSpot)) {
        _courseSpotList.remove(courseSpot);
      } else {
        _courseSpotList.add(courseSpot);
      }
    } else {
      // show SnackBar
      appFlushbar(message: '더 이상 추가할 수 없습니다').show(context);
    }
    // _courseSpotList
    //     .removeWhere((element) => element.containsValue(courseSpot.id));
    notifyListeners();
  }

  void driveSeasonAddOrRemove({
    required String value,
  }) {
    if (_driveSeason.contains(value)) {
      _driveSeason.remove(value);
    } else {
      _driveSeason.add(value);
    }
    notifyListeners();
  }

  void driveTimeAddOrRemove({
    required String value,
  }) {
    if (_driveTime.contains(value)) {
      _driveTime.remove(value);
    } else {
      _driveTime.add(value);
    }
    notifyListeners();
  }

  void hashTagsKeyword({
    required String srcKeyword,
  }) {
    if (_srcsKeyword.contains(srcKeyword)) {
      _srcsKeyword.remove(srcKeyword);
    } else {
      _srcsKeyword.add(srcKeyword);
    }
    notifyListeners();
  }

  void courseSpotClear() {
    _courseSpotList.clear();
    notifyListeners();
  }

  void getCourseExplanation({
    required String value,
  }) {
    _explanation = value;
    _courseModel = _courseModel.copyWith(explanation: _explanation);
  }

  void showCourseKeywordAndAddress({
    required bool value,
  }) {
    value == true ? _isSwitcher = false : _isSwitcher = true;
    notifyListeners();
  }

  CourseSpot get courseSpot => _courseSpot;
  List<CourseSpot> get courseSpotList => _courseSpotList;
  bool get isSwitcher => _isSwitcher;
  bool get isUploading => _isUploading;
  List<String> get driveSeason => _driveSeason;
  List<String> get driveTime => _driveTime;
  List<String> get srcsKeyword => _srcsKeyword;
}
