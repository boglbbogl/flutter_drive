import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/create/model/course_model.dart';
import 'package:flutter_drive/feed/feed_repository.dart';

class FeedProvider extends ChangeNotifier {
  final FeedRepostiory _feedRepostiory = FeedRepostiory();
  StreamSubscription<List<CourseModel>?>? _courseStreamSubscription;
  StreamSubscription<List<CourseSpot>?>? _spotStreamSubscription;
  List<CourseModel> _courseList = [];
  List<CourseSpot> _spotList = [];
  FeedProvider() {
    _courseStream();
    _spotStream();
  }

  Future _courseStream() async {
    await _courseStreamSubscription?.cancel();
    _courseStreamSubscription =
        _feedRepostiory.getStreamCourse().listen((course) {
      _courseList = course;
      notifyListeners();
    });
  }

  Future _spotStream() async {
    await _spotStreamSubscription?.cancel();
    _spotStreamSubscription = _feedRepostiory.getStreamSpot().listen((spot) {
      _spotList = spot;
      notifyListeners();
    });
  }

  List<CourseModel> get courseList => _courseList;
  List<CourseSpot> get spotList => _spotList;
}
