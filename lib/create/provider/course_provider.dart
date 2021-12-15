import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/create/model/course_model.dart';
import 'package:flutter_drive/create/repo/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _courseRepository = CourseRepository();
  final CoursePlace _coursePlace = CoursePlace.empty();
  CourseModel _courseModel = CourseModel.empty();
  final List<CoursePlace> _coursePlaceList = [];

  Future<void> createCourse({
    required String userKey,
    required CoursePlace coursePlace,
  }) async {
    await _courseRepository.createCourseModel(
        courseModel: _courseModel.copyWith(
      userKey: userKey,

      // createAt: DateTime.now().toString(),
      // updateAt: DateTime.now().toString(),
    ));
  }

  void getCoursePlace({
    required CoursePlace coursePlace,
  }) {
    _coursePlaceList.add(coursePlace);
    // if () {
    //   _coursePlaceList.remove(coursePlace.toJson());
    // } else {
    //   _coursePlaceList.add(coursePlace.toJson());
    // }
    // _courseModel = _courseModel.copyWith(coursePlace: _coursePlaceList);
    logger.e(_coursePlaceList);
  }

  // void getCourseTitle({
  //   required String title,
  // }) {
  //   _courseModel = _courseModel.copyWith(title: title);
  // }

  CoursePlace get coursePlace => _coursePlace;
}
