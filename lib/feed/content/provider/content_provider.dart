import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/content/repo/content_repository.dart';

class ContentProvider extends ChangeNotifier {
  final ContentRepostiory _feedRepostiory = ContentRepostiory();
  StreamSubscription<List<CourseModel>?>? _courseStreamSubscription;
  List<CourseModel> _courseList = [];
  int _imageOrCouseSpotIndex = 0;
  bool _isImageOrCouseSpot = false;
  int _explanationIndex = -1;

  ContentProvider() {
    _courseStream();
  }

  Future _courseStream() async {
    await _courseStreamSubscription?.cancel();
    _courseStreamSubscription =
        _feedRepostiory.getStreamCourse().listen((course) {
      _courseList = course;
      notifyListeners();
    });
  }

  void isShowExplanation({
    required int index,
    required bool value,
  }) {
    _explanationIndex = index;
    notifyListeners();
  }

  void isShowImageOrCourseSpot({
    required int index,
    required bool value,
  }) {
    _isImageOrCouseSpot = value;
    _imageOrCouseSpotIndex = index;
    notifyListeners();
  }

  List<CourseModel> get courseList => _courseList;
  int get imageOrCouseSpotIndex => _imageOrCouseSpotIndex;
  bool get isImageOrCouseSpot => _isImageOrCouseSpot;
  int get explanationIndex => _explanationIndex;
}
