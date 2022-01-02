import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/model/feed_model.dart';
import 'package:flutter_drive/feed/repo/feed_repository.dart';

class FeedMainProvider extends ChangeNotifier {
  final FeedRepostiory _feedRepostiory = FeedRepostiory();
  StreamSubscription<List<CourseModel>?>? _courseStreamSubscription;
  List<CourseModel> _courseList = [];
  List<int> _explanationIndex = [];
  List<FeedModel> _feedImageOrCourse = [];

  FeedMainProvider() {
    _courseStream();
  }

  void initialization() {
    _explanationIndex = [];
    _feedImageOrCourse = [];
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
    notifyListeners();
  }

  void isShowImageOrCourseSpot({
    required int index,
    required bool value,
  }) {
    if (_feedImageOrCourse.contains(FeedModel(index: index, isShow: true))) {
      _feedImageOrCourse.remove(FeedModel(index: index, isShow: true));
      _feedImageOrCourse.add(FeedModel(index: index, isShow: false));
    } else if (_feedImageOrCourse
        .contains(FeedModel(index: index, isShow: false))) {
      _feedImageOrCourse.remove(FeedModel(index: index, isShow: false));
      _feedImageOrCourse.add(FeedModel(index: index, isShow: true));
    } else {
      _feedImageOrCourse.add(FeedModel(index: index, isShow: value));
    }
    notifyListeners();
  }

  List<CourseModel> get courseList => _courseList;
  List<int> get explanationIndex => _explanationIndex;
  List<FeedModel> get feedImageOrCourse => _feedImageOrCourse;
}
