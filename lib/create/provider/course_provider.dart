import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/create/model/course_model.dart';
import 'package:flutter_drive/create/repo/course_repository.dart';
import 'package:flutter_drive/image/images_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _courseRepository = CourseRepository();
  final ImageSRepository _imageRepository = ImageSRepository();
  CourseModel _courseModel = CourseModel.empty();
  CourseSpot _courseSpot = CourseSpot.empty();
  List<CourseSpot> _courseSpotList = [];
  String _explanation = "";
  bool _isSwitcher = false;
  bool _isUploading = false;
  List<String> _imageUrl = [];

  void started() {
    _explanation = "";
    _isSwitcher = false;
    _courseSpotList = [];
    _imageUrl = [];
    _courseModel = CourseModel.empty();
    _courseSpot = CourseSpot.empty();
  }

  Future<void> createCourse({
    required String userKey,
    required List<Uint8List> multiImage,
  }) async {
    _isUploading = true;
    notifyListeners();
    if (multiImage.isNotEmpty) {
      _imageUrl = await _imageRepository.imageUploadResized(
          userKey: userKey, imageFile: multiImage);
    }
    await _courseRepository.createCourseModel(
        courseSpot: _courseSpotList,
        courseModel: _courseModel.copyWith(
          userKey: userKey,
          createAt: DateTime.now().toString(),
          updateAt: DateTime.now().toString(),
          imageUrl: _imageUrl,
        ));
    _isUploading = false;
    notifyListeners();
  }

  void getCourseSpotList({
    required CourseSpot courseSpot,
  }) {
    if (_courseSpotList.length < 10) {
      if (_courseSpotList.contains(courseSpot)) {
        _courseSpotList.remove(courseSpot);
      } else {
        _courseSpotList.add(courseSpot);
      }
    } else {
      // show SnackBar
    }
    // _courseSpotList
    //     .removeWhere((element) => element.containsValue(courseSpot.id));
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
}
