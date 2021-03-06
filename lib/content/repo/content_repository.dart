import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/notification/model/notification_model.dart';

class ContentRepository {
  static final ContentRepository _repository = ContentRepository._internal();
  factory ContentRepository() => _repository;
  ContentRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future contentFeedDelete({
    required String docKey,
    required String userKey,
    required List<String> docKeyList,
  }) async {
    final DocumentReference<Map<String, dynamic>> _courseRef =
        _firestore.collection(collectionCourse).doc(docKey);
    final CollectionReference<Map<String, dynamic>> _commentRef = _firestore
        .collection(collectionCourse)
        .doc(docKey)
        .collection(collectionComment);
    final CollectionReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionActivity);
    final _batch = _firestore.batch();
    for (final element in docKeyList) {
      await _commentRef
          .doc(element)
          .collection(collectionMoreComment)
          .get()
          .then((snapshot) {
        for (final element in snapshot.docs) {
          _batch.delete(element.reference);
        }
      });
    }
    await _commentRef.get().then((snapshot) {
      for (final element in snapshot.docs) {
        _batch.delete(element.reference);
      }
    });
    await _activityRef.get().then((snapshot) {
      for (final element in snapshot.docs) {
        _batch.update(element.reference, {
          "likesDocKey": FieldValue.arrayRemove([docKey])
        });
        _batch.update(element.reference, {
          "bookmarksDocKey": FieldValue.arrayRemove([docKey])
        });
      }
    });
    _batch.update(_activityRef.doc(userKey), {
      "contentsDocKey": FieldValue.arrayRemove([docKey])
    });
    _batch.delete(_courseRef);
    await _batch.commit();
  }

  Future contentFeedUpdate({
    required String docKey,
    required String explanation,
  }) async {
    final DocumentReference<Map<String, dynamic>> _courseRef =
        _firestore.collection(collectionCourse).doc(docKey);
    await _courseRef.update(
      {
        "explanation": explanation,
      },
    );
  }

  Future addLike({
    required String docKey,
    required String userKey,
    required NotificationModel notificationModel,
  }) async {
    final DocumentReference<Map<String, dynamic>> _courseRef =
        _firestore.collection(collectionCourse).doc(docKey);
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionActivity).doc(userKey);
    final DocumentReference<Map<String, dynamic>> _notiRef =
        _firestore.collection(collectionNotification).doc();
    final DocumentReference<Map<String, dynamic>> _userNotiSettingRef =
        _firestore
            .collection(collectionNotiSetting)
            .doc(notificationModel.notiUserKey);
    final _notiSnapshot = await _userNotiSettingRef.get();
    final bool _isFeedLike =
        UserNotificationModel.fromFireStore(_notiSnapshot).isFeedLike;

    final _batch = _firestore.batch();
    if ((notificationModel.userKey != notificationModel.notiUserKey) &&
        _isFeedLike) {
      final _notiToWrite = notificationModel.copyWith(docKey: _notiRef.id);
      _batch.set(_notiRef, _notiToWrite.toJson());
    }
    _batch.update(_courseRef, {
      "likeUserKey": FieldValue.arrayUnion(
        [userKey],
      ),
    });
    _batch.update(_activityRef, {
      "likesDocKey": FieldValue.arrayUnion([docKey])
    });
    await _batch.commit();
  }

  Future removeLike({
    required String docKey,
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _courseRef =
        _firestore.collection(collectionCourse).doc(docKey);
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionActivity).doc(userKey);
    final _batch = _firestore.batch();

    _batch.update(_courseRef, {
      "likeUserKey": FieldValue.arrayRemove([userKey])
    });
    _batch.update(_activityRef, {
      "likesDocKey": FieldValue.arrayRemove([docKey])
    });
    await _batch.commit();
  }

  Future addBookmark({
    required String docKey,
    required String userKey,
    required NotificationModel notificationModel,
  }) async {
    final DocumentReference<Map<String, dynamic>> _courseRef =
        _firestore.collection(collectionCourse).doc(docKey);
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionActivity).doc(userKey);
    final DocumentReference<Map<String, dynamic>> _notiRef =
        _firestore.collection(collectionNotification).doc();
    final DocumentReference<Map<String, dynamic>> _userNotiSettingRef =
        _firestore
            .collection(collectionNotiSetting)
            .doc(notificationModel.notiUserKey);
    final _notiSnapshot = await _userNotiSettingRef.get();
    final bool _isFeedBookmark =
        UserNotificationModel.fromFireStore(_notiSnapshot).isFeedBookmark;

    final _batch = _firestore.batch();
    if ((notificationModel.userKey != notificationModel.notiUserKey) &&
        _isFeedBookmark) {
      final _notiToWrite = notificationModel.copyWith(docKey: _notiRef.id);
      _batch.set(_notiRef, _notiToWrite.toJson());
    }
    _batch.update(_courseRef, {
      "bookmarkUserKey": FieldValue.arrayUnion(
        [userKey],
      ),
    });
    _batch.update(_activityRef, {
      "bookmarksDocKey": FieldValue.arrayUnion([docKey])
    });
    await _batch.commit();
  }

  Future removeBookmark({
    required String docKey,
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _courseRef =
        _firestore.collection(collectionCourse).doc(docKey);
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionActivity).doc(userKey);
    final _batch = _firestore.batch();
    _batch.update(_courseRef, {
      "bookmarkUserKey": FieldValue.arrayRemove([userKey])
    });
    _batch.update(_activityRef, {
      "bookmarksDocKey": FieldValue.arrayRemove([docKey])
    });
    await _batch.commit();
  }
}
