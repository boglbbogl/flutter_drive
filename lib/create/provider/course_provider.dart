import 'package:flutter/material.dart';
import 'package:flutter_drive/create/model/course_model.dart';
import 'package:flutter_drive/create/repo/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _courseRepository = CourseRepository();
  CourseModel _courseModel = CourseModel.empty();

  Future<void> createCourse({
    required String userKey,
  }) async {
    await _courseRepository.createCourseModel(
        courseModel: _courseModel.copyWith(
      userKey: userKey,
      createAt: DateTime.now().toString(),
      updateAt: DateTime.now().toString(),
    ));
  }

  void getCourseTitle({
    required String title,
  }) {
    _courseModel = _courseModel.copyWith(title: title);
  }
}
