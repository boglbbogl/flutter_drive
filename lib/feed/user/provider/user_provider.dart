import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/user/repo/user_repository.dart';

class UserProvider extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  List<CourseModel> _courseList = [];
  Future getUserCourse({
    required String userKey,
  }) async {
    _courseList = await _userRepository.getFeedUserCourse(userKey: userKey);
    logger.d(_courseList);
    notifyListeners();
  }

  List<CourseModel> get courseList => _courseList;
}
