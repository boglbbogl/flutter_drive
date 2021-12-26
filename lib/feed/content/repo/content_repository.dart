import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/course/model/course_model.dart';

class ContentRepostiory {
  static final ContentRepostiory _repostiory = ContentRepostiory._internal();
  factory ContentRepostiory() => _repostiory;
  ContentRepostiory._internal();

  Stream<List<CourseModel>> getStreamCourse() async* {
    final CollectionReference<Map<String, dynamic>> _collectionRef =
        FirebaseFirestore.instance.collection(collectionCourse);
    yield* _collectionRef
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((sn) {
      return sn.docs.map((doc) {
        return CourseModel.fromFireStore(doc);
      }).toList();
    });
  }
}
