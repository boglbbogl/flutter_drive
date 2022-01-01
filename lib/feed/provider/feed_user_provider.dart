import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/activity/activity_model.dart';
import 'package:flutter_drive/activity/activity_repository.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/repo/feed_repository.dart';

class FeedUserProvider extends ChangeNotifier {
  final FeedRepostiory _feedRepostiory = FeedRepostiory();
  final ActivityRepository _activityRepository = ActivityRepository();
  StreamSubscription<List<CourseModel>?>? _courseStreamSubscription;
  List<CourseModel> _courseList = [];
  UserModel? _userProfile;
  ActivityModel? _userActivity;
  int _imageOrCouseSpotIndex = -1;
  bool _isImageOrCouseSpot = false;
  List<int> _explanationIndex = [];
  bool _isDetail = false;
  bool _isLoading = false;

  void initialization() {
    _isDetail = true;
    _explanationIndex = [];
    _isImageOrCouseSpot = false;
    _imageOrCouseSpotIndex = -1;
    _isLoading = false;
    notifyListeners();
  }

  Future getFeedUserCourse({
    required String userKey,
  }) async {
    await _courseStreamSubscription?.cancel();
    _courseStreamSubscription =
        _feedRepostiory.getStreamCourse().listen((course) {
      _courseList =
          course.where((element) => userKey.contains(element.userKey)).toList();
      notifyListeners();
    });
  }

  Future getUserProfileInfo({
    required String userKey,
  }) async {
    _isLoading = true;
    notifyListeners();
    getFeedUserCourse(userKey: userKey);
    _userProfile = await _feedRepostiory.getFeedUserProfile(userKey: userKey);
    _userActivity = await _activityRepository.getUserActivity(userKey: userKey);
    _isDetail = true;
    _explanationIndex = [];
    _isImageOrCouseSpot = false;
    _imageOrCouseSpotIndex = -1;
    _isLoading = false;
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
  UserModel? get userProfile => _userProfile;
  ActivityModel? get userActivity => _userActivity;
  int get imageOrCouseSpotIndex => _imageOrCouseSpotIndex;
  bool get isImageOrCouseSpot => _isImageOrCouseSpot;
  List<int> get explanationIndex => _explanationIndex;
  bool get isDetail => _isDetail;
  bool get isLoading => _isLoading;
}
