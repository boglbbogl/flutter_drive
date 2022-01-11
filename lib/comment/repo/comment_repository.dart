import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/comment/model/comment_model.dart';
import 'package:flutter_drive/notification/model/notification_model.dart';

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

  Stream<List<MoreCommentModel>> getStreamMoreComment({
    required String courseDocKey,
    required String commentDocKey,
  }) async* {
    final CollectionReference<Map<String, dynamic>> _collectionRef = _firestore
        .collection(collectionCourse)
        .doc(courseDocKey)
        .collection(collectionComment)
        .doc(commentDocKey)
        .collection(collectionMoreComment);
    yield* _collectionRef
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((sn) {
      return sn.docs.map((doc) {
        return MoreCommentModel.fromFireStore(doc);
      }).toList();
    });
  }

  Future<void> createMoreComment({
    required String courseDocKey,
    required String commentDocKey,
    required MoreCommentModel moreComment,
    required NotificationModel notificationModel,
  }) async {
    final DocumentReference<Map<String, dynamic>> _commentRef = _firestore
        .collection(collectionCourse)
        .doc(courseDocKey)
        .collection(collectionComment)
        .doc(commentDocKey);
    final DocumentReference<Map<String, dynamic>> _moreCommentRef = _firestore
        .collection(collectionCourse)
        .doc(courseDocKey)
        .collection(collectionComment)
        .doc(commentDocKey)
        .collection(collectionMoreComment)
        .doc();
    final DocumentReference<Map<String, dynamic>> _notiRef =
        _firestore.collection(collectionNotification).doc();
    final _courseRef =
        _firestore.collection(collectionCourse).doc(courseDocKey);
    final DocumentReference<Map<String, dynamic>> _userNotiSettingRef =
        _firestore
            .collection(collectionNotiSetting)
            .doc(notificationModel.notiUserKey);
    final _notiSnapshot = await _userNotiSettingRef.get();
    final bool _isMoreComment =
        UserNotificationModel.fromFireStore(_notiSnapshot).isMoreComment;

    final DocumentSnapshot _ds = await _moreCommentRef.get();
    final _notiToWrite = notificationModel.copyWith(docKey: _notiRef.id);

    final _toWrite =
        moreComment.copyWith(docKey: _ds.id, commentDocKey: commentDocKey);
    final _batch = _firestore.batch();
    if ((notificationModel.userKey != notificationModel.notiUserKey) &&
        _isMoreComment) {
      _batch.set(_notiRef, _notiToWrite.toJson());
    }
    _batch.update(_commentRef, {
      "isMoreCount": FieldValue.increment(1),
    });
    _batch.update(_courseRef, {
      "moreCommentDocKey": FieldValue.arrayUnion([commentDocKey])
    });
    _batch.set(_moreCommentRef, _toWrite.toFireStore());
    await _batch.commit();
  }

  Future<void> createComment({
    required String docKey,
    required CommentModel commentModel,
    required NotificationModel notificationModel,
  }) async {
    final DocumentReference<Map<String, dynamic>> _commentRef = _firestore
        .collection(collectionCourse)
        .doc(docKey)
        .collection(collectionComment)
        .doc();
    final DocumentReference<Map<String, dynamic>> _notiRef =
        _firestore.collection(collectionNotification).doc();

    final _commentCountRef =
        _firestore.collection(collectionCourse).doc(docKey);

    final DocumentReference<Map<String, dynamic>> _userNotiSettingRef =
        _firestore
            .collection(collectionNotiSetting)
            .doc(notificationModel.notiUserKey);
    final _notiSnapshot = await _userNotiSettingRef.get();
    final bool _isComment =
        UserNotificationModel.fromFireStore(_notiSnapshot).isComment;

    final DocumentSnapshot _documentSnapshot = await _commentRef.get();
    final _toWrite = commentModel.copyWith(docKey: _documentSnapshot.id);
    final _notiToWrite = notificationModel.copyWith(docKey: _notiRef.id);
    final _batch = _firestore.batch();
    if (!_documentSnapshot.exists) {
      if ((notificationModel.userKey != notificationModel.notiUserKey) &&
          _isComment) {
        _batch.set(_notiRef, _notiToWrite.toJson());
      }
      _batch.set(_commentRef, _toWrite.toFireStore());
      _batch.update(_commentCountRef, {
        "commentCount": FieldValue.increment(1),
      });

      await _batch.commit();
    }
  }

  Future removeMoreComment({
    required String courseDocKey,
    required String commentDocKey,
    required String moreCommentDocKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _commentRef = _firestore
        .collection(collectionCourse)
        .doc(courseDocKey)
        .collection(collectionComment)
        .doc(commentDocKey);
    final DocumentReference<Map<String, dynamic>> _moreCommentRef = _firestore
        .collection(collectionCourse)
        .doc(courseDocKey)
        .collection(collectionComment)
        .doc(commentDocKey)
        .collection(collectionMoreComment)
        .doc(moreCommentDocKey);

    final _batch = _firestore.batch();
    _batch.update(_commentRef, {"isMoreCount": FieldValue.increment(-1)});
    _batch.delete(_moreCommentRef);
    await _batch.commit();
  }

  Future removeComment({
    required String docKey,
    required String commentDocKey,
    required int isMoreCount,
  }) async {
    final DocumentReference<Map<String, dynamic>> _commentRef = _firestore
        .collection(collectionCourse)
        .doc(docKey)
        .collection(collectionComment)
        .doc(commentDocKey);
    final CollectionReference<Map<String, dynamic>> _moreCommentRef = _firestore
        .collection(collectionCourse)
        .doc(docKey)
        .collection(collectionComment)
        .doc(commentDocKey)
        .collection(collectionMoreComment);
    final _commentCountRef =
        _firestore.collection(collectionCourse).doc(docKey);

    final DocumentSnapshot _documentSnapshot = await _commentRef.get();
    final _batch = _firestore.batch();

    if (isMoreCount != 0) {
      await _moreCommentRef.get().then((snapshot) {
        for (final element in snapshot.docs) {
          _batch.delete(element.reference);
        }
      });
    }
    if (_documentSnapshot.exists) {
      _batch.delete(_commentRef);
      _batch.update(_commentCountRef, {
        "commentCount": FieldValue.increment(-1),
        "moreCommentDocKey": FieldValue.arrayRemove([commentDocKey])
      });
      await _batch.commit();
    }
  }
}
