import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/model/feed_model.dart';
import 'package:flutter_drive/feed/repo/feed_repository.dart';

class FeedUserProvider extends ChangeNotifier {
  final FeedRepostiory _feedRepostiory = FeedRepostiory();
  StreamSubscription<List<CourseModel>?>? _courseStreamSubscription;

  List<CourseModel> _courseList = [];
  List<int> _explanationIndex = [];
  bool _isLoading = false;
  bool _isLikeLoading = false;
  List<FeedModel> _feedImageOrCourse = [];
  bool _isShowDrawer = false;

  FeedUserProvider() {
    getFeedUserCourse();
  }

  void initialization() {
    _explanationIndex = [];
    _isLoading = false;
    _feedImageOrCourse = [];
    notifyListeners();
  }

  Future getFeedUserCourse() async {
    await _courseStreamSubscription?.cancel();
    _courseStreamSubscription =
        _feedRepostiory.getStreamCourse(isMain: false).listen((course) {
      _courseList = course;
      notifyListeners();
    });
  }

  Future addAndRemovLikesUserAndLikeMeUser({
    required String userKey,
    required String likeMeUserKey,
    required bool isLikeUser,
  }) async {
    _isLikeLoading = true;
    notifyListeners();
    if (isLikeUser) {
      await _feedRepostiory.removeLikesUserAndLikeMeUser(
          userKey: userKey, likeMeUserKey: likeMeUserKey);
    } else {
      await _feedRepostiory.addLikesUserAndLikeMeUser(
          userKey: userKey, likeMeUserKey: likeMeUserKey);
    }
    _isLikeLoading = false;
    notifyListeners();
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

  void showCustomDrawer({
    required bool value,
  }) {
    value ? _isShowDrawer = false : _isShowDrawer = true;
    notifyListeners();
  }

  List<CourseModel> get courseList => _courseList;
  List<int> get explanationIndex => _explanationIndex;
  bool get isLoading => _isLoading;
  bool get isLikeLoading => _isLikeLoading;
  List<FeedModel> get feedImageOrCourse => _feedImageOrCourse;
  bool get isShowDrawer => _isShowDrawer;
}
