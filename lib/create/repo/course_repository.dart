import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/create/model/course_model.dart';

class CourseRepository {
  static final CourseRepository _repository = CourseRepository._internal();
  factory CourseRepository() => _repository;
  CourseRepository._internal();

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> createCourseModel({
    required CourseModel courseModel,
  }) async {
    if (courseModel.userKey.isEmpty) {
      // failure
    }
    final DocumentReference<Map<String, dynamic>> _courseRef =
        _fireStore.collection(collectionCourse).doc();
    final DocumentSnapshot _documentSnapshot = await _courseRef.get();
    final _toWrite = courseModel.copyWith(docKey: _documentSnapshot.id);
    if (!_documentSnapshot.exists) {
      await _courseRef.set(_toWrite.toFireStore());
    }
  }
}
