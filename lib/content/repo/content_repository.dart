import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';

class ContentRepository {
  static final ContentRepository _repository = ContentRepository._internal();
  factory ContentRepository() => _repository;
  ContentRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future incrementLike({
    required String docKey,
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _likeRef =
        _firestore.collection(collectionCourse).doc(docKey);
    final _batch = _firestore.batch();
    _batch.update(_likeRef, {
      "likeUserKey": FieldValue.arrayUnion(
        [userKey],
      )
    });
    // _batch.update(_likeRef, {
    //   "likeCount": FieldValue.increment(1),
    // });
    await _batch.commit();
  }

  Future decrementLike({
    required String docKey,
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _likeRef =
        _firestore.collection(collectionCourse).doc(docKey);
    final _batch = _firestore.batch();
    _batch.update(_likeRef, {
      "likeUserKey": FieldValue.arrayRemove(
        [userKey],
      )
    });
    // _batch.update(_likeRef, {
    //   "likeCount": FieldValue.increment(-1),
    // });
    await _batch.commit();
  }
}
