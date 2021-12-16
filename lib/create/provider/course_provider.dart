import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/create/model/course_model.dart';
import 'package:flutter_drive/create/repo/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _courseRepository = CourseRepository();
  CourseModel _courseModel = CourseModel.empty();
  final CourseSpot _courseSpot = CourseSpot.empty();
  final List<CourseSpot> _courseSpotList = [];
  String _explanation = "";
  bool _isToggle = false;

  Future<void> createCourse({
    required String userKey,
  }) async {
    await _courseRepository.createCourseModel(
        courseSpot: _courseSpotList,
        courseModel: _courseModel.copyWith(
          userKey: userKey,
          createAt: DateTime.now().toString(),
          updateAt: DateTime.now().toString(),
        ));
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

  void showCourseToggleSwitch({
    required bool value,
  }) {
    value == true ? _isToggle = false : _isToggle = true;

    notifyListeners();
    logger.e(_isToggle);
  }

  CourseSpot get courseSpot => _courseSpot;
  List<CourseSpot> get courseSpotList => _courseSpotList;
  bool get isToggle => _isToggle;
}
