import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';

class ContentRepository {
  static final ContentRepository _repository = ContentRepository._internal();
  factory ContentRepository() => _repository;
  ContentRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future contentFeedDelete({
    required String docKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _courseRef =
        _firestore.collection(collectionCourse).doc(docKey);
    await _courseRef.delete();
  }

  Future contentFeedUpdate({
    required String docKey,
    required String explanation,
  }) async {
    final DocumentReference<Map<String, dynamic>> _courseRef =
        _firestore.collection(collectionCourse).doc(docKey);
    await _courseRef.update(
      {"explanation": explanation},
    );
  }

  Future addLike({
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

  Future removeLike({
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
