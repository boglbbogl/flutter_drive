import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/repo/feed_repository.dart';

class FeedUserProvider extends ChangeNotifier {
  final FeedRepostiory _feedRepostiory = FeedRepostiory();
  List<CourseModel> _courseList = [];
  UserModel? _userProfile;
  int _imageOrCouseSpotIndex = 0;
  bool _isImageOrCouseSpot = false;
  int _explanationIndex = -1;
  Future getUserCourse({
    required String userKey,
  }) async {
    _courseList = await _feedRepostiory.getFeedUserCourse(userKey: userKey);
    _userProfile = await _feedRepostiory.getFeedUserProfile(userKey: userKey);
    notifyListeners();
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
  UserModel? get userProfile => _userProfile;
  int get imageOrCouseSpotIndex => _imageOrCouseSpotIndex;
  bool get isImageOrCouseSpot => _isImageOrCouseSpot;
  int get explanationIndex => _explanationIndex;
}
