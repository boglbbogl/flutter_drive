import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/notification/model/notification_model.dart';

class FeedRepostiory {
  static final FeedRepostiory _repostiory = FeedRepostiory._internal();
  factory FeedRepostiory() => _repostiory;
  FeedRepostiory._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<CourseModel>> getStreamCourse({
    int? limit,
    required bool isMain,
  }) async* {
    final CollectionReference<Map<String, dynamic>> _collectionRef =
        _firestore.collection(collectionCourse);
    if (isMain) {
      yield* _collectionRef
          .orderBy('createdAt', descending: true)
          .limit(limit!)
          .snapshots()
          .map((sn) {
        return sn.docs.map((doc) {
          return CourseModel.fromFireStore(doc);
        }).toList();
      });
    } else {
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

  Future<UserModel?> getFeedUserProfile({
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _documentReference =
        _firestore.collection(collectionUser).doc(userKey);
    final DocumentSnapshot<Map<String, dynamic>> _documentSnapshot =
        await _documentReference.get();
    if (_documentSnapshot.exists) {
      final UserModel userModel = UserModel.fromJson(_documentSnapshot.data()!);
      return userModel;
    }
    return null;
  }

  Future addLikesUserAndLikeMeUser({
    required String userKey,
    required String likeMeUserKey,
    required NotificationModel userLikeNotiModel,
  }) async {
    final CollectionReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionActivity);
    final DocumentReference<Map<String, dynamic>> _notiRef =
        _firestore.collection(collectionNotification).doc();
    final DocumentReference<Map<String, dynamic>> _userNotiSettingRef =
        _firestore.collection(collectionNotiSetting).doc(likeMeUserKey);
    final _notiSnapshot = await _userNotiSettingRef.get();
    final bool _isUserLike =
        UserNotificationModel.fromFireStore(_notiSnapshot).isUserLike;
    final _batch = _firestore.batch();
    if (_isUserLike) {
      final _userNotiToWrite = userLikeNotiModel.copyWith(docKey: _notiRef.id);
      _batch.set(_notiRef, _userNotiToWrite.toJson());
    }
    _batch.update(_activityRef.doc(userKey), {
      "likesUserKey": FieldValue.arrayUnion([likeMeUserKey])
    });
    _batch.update(_activityRef.doc(likeMeUserKey), {
      "likeMeUserKey": FieldValue.arrayUnion([userKey])
    });
    await _batch.commit();
  }

  Future removeLikesUserAndLikeMeUser({
    required String userKey,
    required String likeMeUserKey,
  }) async {
    final CollectionReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionActivity);
    final _batch = _firestore.batch();
    _batch.update(_activityRef.doc(userKey), {
      "likesUserKey": FieldValue.arrayRemove([likeMeUserKey])
    });
    _batch.update(_activityRef.doc(likeMeUserKey), {
      "likeMeUserKey": FieldValue.arrayRemove([userKey])
    });
    await _batch.commit();
  }
}
