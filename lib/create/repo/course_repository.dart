import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/create/model/course_model.dart';
import 'package:flutter_drive/create/repo/course_dtos.dart';

class CourseRepository {
  static final CourseRepository _repository = CourseRepository._internal();
  factory CourseRepository() => _repository;
  CourseRepository._internal();

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> createCourseModel({
    required CourseModel courseModel,
    required List<CourseSpot> courseSpot,
  }) async {
    if (courseModel.userKey.isEmpty) {
      // failure
    }
    final DocumentReference<Map<String, dynamic>> _courseRef =
        _fireStore.collection(collectionCourse).doc();
    final DocumentReference<Map<String, dynamic>> _spotRef = _fireStore
        .collection(collectionCourse)
        .doc(_courseRef.id)
        .collection(collectionCourseSpot)
        .doc();
    final DocumentSnapshot _documentSnapshot = await _courseRef.get();
    final batch = _fireStore.batch();

    if (!_documentSnapshot.exists) {
      try {
        final List<Map<String, dynamic>> _spot = courseSpot
            .map((e) => CourseSpotDto.toFireStore(e).toJson())
            .toList();
        final _toWrite = courseModel.copyWith(docKey: _courseRef.id);
        batch.set(_courseRef, CourseDto.toFirestore(_toWrite).toJson());
        batch.set(_spotRef, {"spot": _spot});
        await batch.commit();
      } catch (e) {
        logger.e(e.toString());
      }
    }
  }
}
