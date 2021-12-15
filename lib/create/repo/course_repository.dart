import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/create/model/course_model.dart';

class CourseRepository {
  static final CourseRepository _repository = CourseRepository._internal();
  factory CourseRepository() => _repository;
  CourseRepository._internal();

  Future<void> createCourseModel({
    required CourseModel courseModel,
  }) async {
    final DocumentReference<Map<String, dynamic>> _documentReference =
        FirebaseFirestore.instance.collection(collectionCourse).doc();
    final DocumentSnapshot _documentSnapshot = await _documentReference.get();
    if (!_documentSnapshot.exists) {
      final toWrite = courseModel.copyWith(docKey: _documentReference.id);
      await _documentReference.set(toWrite.toJson());
    }
  }

  // Stream<List<CourseModel>> getCourseModel() {
  //   final CollectionReference _collectionRef =
  //       FirebaseFirestore.instance.collection(collectionCourse);
  //   List<Stream<List<CourseModel>>> stream = [];
  //   // return _collectionRef.limit(20).get().;
  // }
}
