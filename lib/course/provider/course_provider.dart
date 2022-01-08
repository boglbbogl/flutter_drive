import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/course/repo/course_repository.dart';
import 'package:flutter_drive/image/repo/images_repository.dart';
import 'package:flutter_drive/recommendation/recommendation_repository.dart';
import 'package:flutter_drive/search/keyword_model.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _courseRepository = CourseRepository();
  final ImagesRepository _imagesRepository = ImagesRepository();
  final RecommendationRepository _recommendationRepository =
      RecommendationRepository();
  CourseModel _courseModel = CourseModel.empty();
  CourseSpot _courseSpot = CourseSpot.empty();
  List<CourseSpot> _courseSpotList = [];
  String _explanation = "";
  bool _isSwitcher = false;
  bool _isUploading = false;
  List<String> _imageUrl = [];
  List<String> _driveSeason = [];
  List<String> _driveTime = [];
  List<String> _srcKeyword = [];
  List<String> _srcKeywordSortedList = [];
  List _recommendationSrcKeyword = [];

  void started() {
    _explanation = "";
    _isSwitcher = false;
    _courseSpotList = [];
    _imageUrl = [];
    _courseModel = CourseModel.empty();
    _courseSpot = CourseSpot.empty();
    _driveSeason = [];
    _driveTime = [];
    _srcKeyword = [];
    _getSearchKeyword();
    _getRecommendationSrcKeyword();
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
      srcKeyword: _srcKeyword,
      tagKeyword: [],
      driveSeason: _driveSeason,
      driveTime: _driveTime,
    ));
    _isUploading = false;
    notifyListeners();
  }

  Future _getRecommendationSrcKeyword() async {
    _recommendationSrcKeyword =
        await _recommendationRepository.getRecommandationSrcKeyword();
    notifyListeners();
  }

  Future _getSearchKeyword() async {
    List<KeywordModel> _list = [];
    final List<String> _searchKeyword = [];
    final Map<String, int> _map = {};
    _list = await _recommendationRepository.getSrcKeyword();
    for (final e in _list) {
      _searchKeyword.addAll(e.srcKeyword);
    }
    for (final element in _searchKeyword) {
      if (!_map.containsKey(element)) {
        _map[element] = 1;
      } else {
        _map[element] = (_map[element] ?? 0) + 1;
      }
    }
    final _sortedMap = _map.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    _map
      ..clear()
      ..addEntries(_sortedMap);
    _srcKeywordSortedList = _map.keys.toList().sublist(0, 10);
  }

  void getCourseSpotList({
    required CourseSpot courseSpot,
    required BuildContext context,
  }) {
    if (_courseSpotList.length < 10 || _courseSpotList.contains(courseSpot)) {
      if (_courseSpotList.contains(courseSpot)) {
        _courseSpotList.remove(courseSpot);
      } else {
        _courseSpotList.add(courseSpot);
      }
    } else {
      // show SnackBar
      appFlushbar(message: '더 이상 추가할 수 없습니다').show(context);
    }
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
    if (_srcKeyword.contains(srcKeyword)) {
      _srcKeyword.remove(srcKeyword);
    } else {
      _srcKeyword.add(srcKeyword);
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
  List<String> get srcsKeyword => _srcKeyword;
  List<String> get srcKeywordSortedList => _srcKeywordSortedList;
  List get recommendationSrcKeyword => _recommendationSrcKeyword;
}
