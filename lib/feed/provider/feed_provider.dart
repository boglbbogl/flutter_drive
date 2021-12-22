import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/repo/feed_repository.dart';

class FeedProvider extends ChangeNotifier {
  final FeedRepostiory _feedRepostiory = FeedRepostiory();
  StreamSubscription<List<CourseModel>?>? _courseStreamSubscription;
  List<CourseModel> _courseList = [];
  UserModel? _postUser;
  int _expandableIndex = 0;
  bool _isExpanded = false;

  FeedProvider() {
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

  void isExpandableIndex({
    required int index,
    required bool value,
  }) {
    _expandableIndex = index;
    value == true ? _isExpanded = false : _isExpanded = true;
    notifyListeners();
  }

  List<CourseModel> get courseList => _courseList;
  UserModel? get postUser => _postUser;
  int get expandableIndex => _expandableIndex;
  bool get isExpanded => _isExpanded;
}
