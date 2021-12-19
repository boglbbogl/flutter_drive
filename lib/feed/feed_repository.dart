import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/create/model/course_model.dart';
import 'package:flutter_drive/create/repo/course_dtos.dart';

class FeedRepostiory {
  static final FeedRepostiory _repostiory = FeedRepostiory._internal();
  factory FeedRepostiory() => _repostiory;
  FeedRepostiory._internal();

  Stream<List<CourseModel>> getStreamCourse() async* {
    final CollectionReference<Map<String, dynamic>> _collectionRef =
        FirebaseFirestore.instance.collection(collectionCourse);
    yield* _collectionRef.snapshots().map((sn) {
      return sn.docs.map((doc) {
        return CourseDto.fromFireStore(doc).toDomain();
      }).toList();
    });
  }

  Stream<List<CourseSpot>> getStreamSpot() async* {
    final CollectionReference<Map<String, dynamic>> _collectionRef =
        FirebaseFirestore.instance
            .collection(collectionCourse)
            .doc()
            .collection(collectionCourseSpot);
    yield* _collectionRef.snapshots().map((sn) {
      return sn.docs.map((doc) {
        return CourseSpotDto.fromFireStore(doc).toDomain();
      }).toList();
    });
  }
}
