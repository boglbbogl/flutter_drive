import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/create/model/course_model.dart';
import 'package:flutter_drive/create/repo/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _courseRepository = CourseRepository();
  CourseModel _courseModel = CourseModel.empty();
  final CourseSpot _courseSpot = CourseSpot.empty();
  final List<Map<String, dynamic>> _courseSpotList = [];

  Future<void> createCourse({
    required String userKey,
  }) async {
    await _courseRepository.createCourseModel(
        courseModel: _courseModel.copyWith(
      userKey: userKey,

      // createAt: DateTime.now().toString(),
      // updateAt: DateTime.now().toString(),
    ));
  }

  void getCourseSpotList({
    required CourseSpot courseSpot,
  }) {
    // if (mapEquals(, courseSpot.toJson())) {
    //   _courseSpotList.remove(courseSpot.toJson());
    // } else {
    //   _courseSpotList.add(courseSpot.toJson());
    // }
    // _courseSpotList.add(courseSpot.toJson());
    _courseSpotList.remove(courseSpot.toJson());
    _courseModel = _courseModel.copyWith(spot: _courseSpotList);
    logger.e(_courseSpotList);
  }

  // void getCourseTitle({
  //   required String title,
  // }) {
  //   _courseModel = _courseModel.copyWith(title: title);
  // }
  CourseSpot get courseSpot => _courseSpot;
}
