import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/repo/feed_repository.dart';

class FeedMainProvider extends ChangeNotifier {
  final FeedRepostiory _feedRepostiory = FeedRepostiory();
  StreamSubscription<List<CourseModel>?>? _courseStreamSubscription;
  List<CourseModel> _courseList = [];
  int _imageOrCouseSpotIndex = -1;
  bool _isImageOrCouseSpot = false;
  List<int> _explanationIndex = [];

  FeedMainProvider() {
    _courseStream();
  }

  void initialization() {
    _explanationIndex = [];
    _isImageOrCouseSpot = false;
    _imageOrCouseSpotIndex = -1;
    notifyListeners();
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
  }) {
    if (_explanationIndex.contains(index)) {
      _explanationIndex.remove(index);
    } else {
      _explanationIndex.add(index);
    }
    // _explanationIndex = index;
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
  List<int> get explanationIndex => _explanationIndex;
}
