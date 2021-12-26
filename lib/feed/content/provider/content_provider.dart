import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/content/repo/content_repository.dart';
import 'package:flutter_drive/feed/user/repo/user_repository.dart';

class ContentProvider extends ChangeNotifier {
  final ContentRepostiory _feedRepostiory = ContentRepostiory();
  final UserRepository _userRepository = UserRepository();
  StreamSubscription<List<CourseModel>?>? _courseStreamSubscription;
  List<CourseModel> _courseList = [];
  List<CourseModel> _userCourseList = [];
  bool _isDetail = false;
  int _imageOrCouseSpotIndex = 0;
  bool _isImageOrCouseSpot = false;
  int _explanationIndex = -1;

  ContentProvider() {
    _courseStream();
  }
  Future getUserCourse({
    required String userKey,
  }) async {
    _userCourseList = await _userRepository.getFeedUserCourse(userKey: userKey);
    _isDetail = true;
    notifyListeners();
  }

  Future _courseStream() async {
    await _courseStreamSubscription?.cancel();
    _courseStreamSubscription =
        _feedRepostiory.getStreamCourse().listen((course) {
      _courseList = course;
      _isDetail = false;
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
  List<CourseModel> get userCourseList => _userCourseList;
  bool get isDetail => _isDetail;
  int get imageOrCouseSpotIndex => _imageOrCouseSpotIndex;
  bool get isImageOrCouseSpot => _isImageOrCouseSpot;
  int get explanationIndex => _explanationIndex;
}
