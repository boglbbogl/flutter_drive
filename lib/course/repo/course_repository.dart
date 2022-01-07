import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/course/model/course_model.dart';

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
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _fireStore.collection(collectionActivity).doc(courseModel.userKey);
    final DocumentReference<Map<String, dynamic>> _keywordRef =
        _fireStore.collection(collectionKeyword).doc();

    final DocumentSnapshot _documentSnapshot = await _courseRef.get();

    final _toWrite = courseModel.copyWith(docKey: _documentSnapshot.id);
    final _batch = _fireStore.batch();
    if (!_documentSnapshot.exists) {
      if (courseModel.srcKeyword.isNotEmpty ||
          courseModel.tagKeyword.isNotEmpty) {
        _batch.set(_keywordRef, {
          "srcKeyword": courseModel.srcKeyword,
          "tagKeyword": courseModel.tagKeyword,
        });
      }

      _batch.update(_activityRef, {
        "contentsDocKey": FieldValue.arrayUnion([
          _documentSnapshot.id,
        ]),
      });
      _batch.set(_courseRef, _toWrite.toFireStore());
      await _batch.commit();
    }
  }
}
