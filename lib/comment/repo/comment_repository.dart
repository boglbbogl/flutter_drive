import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/comment/model/comment_model.dart';

class CommentRepository {
  static final CommentRepository _repository = CommentRepository._internal();
  factory CommentRepository() => _repository;
  CommentRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<CommentModel>> getStreamComment({
    required String docKey,
  }) async* {
    final CollectionReference<Map<String, dynamic>> _collectionRef = _firestore
        .collection(collectionCourse)
        .doc(docKey)
        .collection(collectionComment);
    yield* _collectionRef
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((sn) {
      return sn.docs.map((doc) {
        return CommentModel.fromFireStore(doc);
      }).toList();
    });
  }

  Future<void> createComment({
    required String docKey,
    required CommentModel commentModel,
  }) async {
    final DocumentReference<Map<String, dynamic>> _commentRef = _firestore
        .collection(collectionCourse)
        .doc(docKey)
        .collection(collectionComment)
        .doc();
    final _commentCountRef =
        _firestore.collection(collectionCourse).doc(docKey);
    final DocumentSnapshot _documentSnapshot = await _commentRef.get();
    final _batch = _firestore.batch();
    if (!_documentSnapshot.exists) {
      _batch.set(_commentRef, commentModel.toFireStore());
      _batch.update(_commentCountRef, {
        "commentCount": FieldValue.increment(1),
      });
      await _batch.commit();
    }
  }
}
