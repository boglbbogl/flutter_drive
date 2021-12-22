import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/create/model/course_model.dart';
import 'package:flutter_drive/feed/repo/feed_repository.dart';

class FeedProvider extends ChangeNotifier {
  final FeedRepostiory _feedRepostiory = FeedRepostiory();
  StreamSubscription<List<CourseModel>?>? _courseStreamSubscription;
  List<CourseModel> _courseList = [];
  UserModel? _postUser;

  FeedProvider() {
    _courseStream();
  }

  // void feedProviderDispose() async {
  //   await _courseStreamSubscription?.cancel();
  // }

  Future _courseStream() async {
    await _courseStreamSubscription?.cancel();
    _courseStreamSubscription =
        _feedRepostiory.getStreamCourse().listen((course) {
      _courseList = course;
      notifyListeners();
    });
  }

  List<CourseModel> get courseList => _courseList;
  UserModel? get postUser => _postUser;
}
