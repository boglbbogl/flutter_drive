import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/course/model/course_model.dart';

class UserRepository {
  static final UserRepository _userRepository = UserRepository._internal();
  factory UserRepository() => _userRepository;
  UserRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getFeedUserProfile() async {}
  Future<List<CourseModel>> getFeedUserCourse({
    required String userKey,
  }) async {
    final CollectionReference<Map<String, dynamic>> _courseRef =
        _firestore.collection(collectionCourse);
    final _snap = await _courseRef.where('userKey', isEqualTo: userKey).get();
    final _result =
        _snap.docs.map((e) => CourseModel.fromFireStore(e)).toList();
    return _result;
  }
}
