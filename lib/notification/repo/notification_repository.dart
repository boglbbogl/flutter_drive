import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/notification/model/notification_model.dart';

class NotificationRepository {
  static final NotificationRepository _repository =
      NotificationRepository._internal();
  factory NotificationRepository() => _repository;
  NotificationRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserNotificationModel?> getUserNotiSetting({
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userNotiSettingRef =
        _firestore.collection(collectionNotiSetting).doc(userKey);
    final DocumentSnapshot<Map<String, dynamic>> _userNotiSettingSnapshot =
        await _userNotiSettingRef.get();
    if (_userNotiSettingSnapshot.exists) {
      final UserNotificationModel _userNotiSetting =
          UserNotificationModel.fromFireStore(_userNotiSettingSnapshot);
      return _userNotiSetting;
    }
    return null;
  }

  Future<List<NotificationModel>> getUserNotification({
    required String userKey,
  }) async {
    final CollectionReference<Map<String, dynamic>> _userNotiRef =
        _firestore.collection(collectionNotification);
    final DocumentReference<Map<String, dynamic>> _userNotiSettingRef =
        _firestore.collection(collectionNotiSetting).doc(userKey);
    final _notiSnapshot = await _userNotiSettingRef.get();
    final UserNotificationModel _userSetting =
        UserNotificationModel.fromFireStore(_notiSnapshot);
    final _snapshot = await _userNotiRef.get();
    final _result = _snapshot.docs
        .map((e) => NotificationModel.fromFireStore(e))
        .where((e) => userKey.contains(e.notiUserKey))
        .where((e) => !e.isHide)
        .where((noti) =>
            (noti.noti == 1 && _userSetting.isUserLike) ||
            (noti.noti == 2 && _userSetting.isComment) ||
            (noti.noti == 3 && _userSetting.isMoreComment) ||
            (noti.noti == 4 && _userSetting.isFeedLike) ||
            (noti.noti == 5 && _userSetting.isFeedBookmark))
        .toList();
    return _result;
  }

  Future allNotificationRemove({
    required String userKey,
  }) async {
    final CollectionReference<Map<String, dynamic>> _notiRef =
        _firestore.collection(collectionNotification);
    await _notiRef
        .where('notiUserKey', isEqualTo: userKey)
        .get()
        .then((snapshot) {
      for (final element in snapshot.docs) {
        _notiRef.doc(element.id).delete();
      }
    });
  }

  Future removeUserNotification({
    required String docKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _notiRef =
        _firestore.collection(collectionNotification).doc(docKey);
    await _notiRef.delete();
  }

  Future userNotificationSettingUpdate({
    required String userKey,
    required UserNotificationModel userNotificationModel,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userNotiSettingRef =
        _firestore.collection(collectionNotiSetting).doc(userKey);
    await _userNotiSettingRef.update(userNotificationModel.toJson());
  }
}

// NOTIFICATION - 1 : User Like,
//              - 2 : Feed Comment,
//              - 3 : Feed More Comment,
//              - 4 : Feed Like,
//              - 5 : Feed Bookmark