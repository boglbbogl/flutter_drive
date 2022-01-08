import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/blocked/model/blocked_model.dart';

class BlockedRepository {
  static final BlockedRepository _repository = BlockedRepository._internal();
  factory BlockedRepository() => _repository;
  BlockedRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future sendContentFeedBlocked({
    required ContentBlockedModel contentBlocked,
  }) async {
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionActivity).doc(contentBlocked.userKey);
    final DocumentReference<Map<String, dynamic>> _blockedRef =
        _firestore.collection(collectionBlocked).doc();
    final DocumentReference<Map<String, dynamic>> _courseRef = _firestore
        .collection(collectionCourse)
        .doc(contentBlocked.blockedDocKey);
    final _batch = _firestore.batch();

    final _toWrite = contentBlocked.copyWith(docKey: _blockedRef.id);
    _batch.set(_blockedRef, _toWrite.toJson());
    _batch.update(_courseRef, {
      "blockedUserKey": FieldValue.arrayUnion([contentBlocked.userKey])
    });
    _batch.update(_activityRef, {
      "contentsBlockedDocKey":
          FieldValue.arrayUnion([contentBlocked.blockedDocKey]),
      "contentsDocKey": FieldValue.arrayRemove([contentBlocked.blockedDocKey]),
      "likesDocKey": FieldValue.arrayRemove([contentBlocked.blockedDocKey]),
      "bookmarksDocKey": FieldValue.arrayRemove([contentBlocked.blockedDocKey]),
    });
    await _batch.commit();
  }

  Future contentMyFeedBlocked({
    required String userKey,
    required String blockedDocKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionActivity).doc(userKey);
    final DocumentReference<Map<String, dynamic>> _courseRef =
        _firestore.collection(collectionCourse).doc(blockedDocKey);

    final _batch = _firestore.batch();
    _batch.update(_courseRef, {
      "blockedUserKey": FieldValue.arrayUnion([userKey])
    });
    _batch.update(_activityRef, {
      "contentsBlockedDocKey": FieldValue.arrayUnion([blockedDocKey]),
      "contentsDocKey": FieldValue.arrayRemove([blockedDocKey]),
      "likesDocKey": FieldValue.arrayRemove([blockedDocKey]),
      "bookmarksDocKey": FieldValue.arrayRemove([blockedDocKey]),
    });
    await _batch.commit();
  }
}
